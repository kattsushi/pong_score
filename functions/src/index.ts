/* tslint:disable:no-unused-variable */
// import * as functions from 'firebase-functions';
import * as cheerio from 'cheerio';
import { database } from 'firebase-admin';
const fetch = require('node-fetch');
const admin = require('firebase-admin');
var serviceAccount = require("./pong-score-firebase-adminsdk-s5qdi-0459700b70.json");


// const download = require('image-downloader');

const RubberTypes: any = {
	pimplesIn: 'flag_ura',
	shortPimples: 'flag_omote',
	singleAntiSpinLongPimplesEtc: 'flag_etc',
	large: 'flag_large'
}

const RacketTypes: any = {
	shake: 'flag_shake',
	japanesePen: 'flag_jpn',
	chinesePen: 'flag_chn',
	cut: 'flag_cut',
	others: 'flag_hpen'
}

// const downloadimg = async (url: string, id: number, model: string) => {
// 	const options = {
// 		url,
// 		dest: `./img/${model}/${id}.jpg`
// 	}
// 	try {
//     const { filename, image } = await download.image(options);
//   } catch (e) {
//     console.error(e)
//   }
// }


const scrape = async (model: string) => {

	let collection: any[] = [];
	const types: any = model === 'rubber' ? RubberTypes : RacketTypes;
	const generalPromises = Object.keys(types).map(async (key: string) => {

		const url = `https://tabletennis-reference.com/${model}/search/${types[key]}`;
		const res = await fetch(url);

		const html = await res.text();

		const $ = cheerio.load(html);
		const numberOfThings = Number($('.redTtl2').children('span').text().split(' ')[0]);
		const pages = [...Array(Math.round(numberOfThings / 10)).keys()].map((val) => val * 10);
		// console.log(pages);
		const promises = pages.map(async (page, i) => {
			const htmlDetail = await (await fetch(`https://tabletennis-reference.com/${model}/search/${types[key]}/${page}`)).text();
			const $detail = cheerio.load(htmlDetail);
			try {
				const documents = $detail('.clearfix').toArray().filter((value) => value.tagName === 'dl').map((value) => ({
					type: key,
					date: new Date(Date.now()).toISOString(),
					page: `https://tabletennis-reference.com/${model}/search/${types[key]}/${page}`,
					id: Number($detail(value.parent).attr()['href'].split('/')[$detail(value.parent).attr()['href'].split('/').length - 1]),
					detail: $detail(value.parent).attr()['href'],
					img: $detail(value.children.find((val) => val.tagName === 'dt')?.children.find(val => val.tagName === 'img')).attr() ? $detail(value.children.find((val) => val.tagName === 'dt')?.children.find(val => val.tagName === 'img')).attr()['src'].replace('100.', '450.') : '',
					name: $detail(value.children.find((val) => val.tagName === 'dt')?.children.find(val => val.tagName === 'img')).attr() ? $detail(value.children.find((val) => val.tagName === 'dt')?.children.find(val => val.tagName === 'img')).attr()['alt'] : '',
					description: $detail(value.children.find((val) => val.tagName === 'dd')?.children.find(val => val.tagName === 'p')).text(),
					points: $detail(value.children.find((val) => val.tagName === 'dd')?.children.find(val => val.tagName === 'ul')).text().trim().split('\n').map(e =>({
						all: e.includes('ALL') ? e.trim().split(':')[1] : null,
						speed: e.includes('Speed') ? e.trim().split(':')[1] : null,
						spin: e.includes('Spin') ? e.trim().split(':')[1] : null,
						control: e.includes('Control') ? e.trim().split(':')[1] : null,
						overall: e.includes('Overall') ? e.trim().split(':')[1] : null,
					}))
				}));
				collection = [...collection, ...documents];
			} catch (error) {
				console.log('ERROR', error);
			}
		});

		await Promise.all(promises);

	});
	await Promise.all(generalPromises);	
	// console.log('Collection', model, collection[10], collection.length);

	// const promisesImgs = collection.map( async ({ img, id }) => {
	// 	if (!img || !id) return;
	// 	await downloadimg(img, id, model);
	// });
	// await Promise.all(promisesImgs);

	return collection;
}

const save = async (databaseRef: any, items: any[]) => {
	
	const promises = items.map(async item => {
		return databaseRef.add(JSON.parse(JSON.stringify(item)));
	});

	await Promise.all(promises);
	
}
// tslint:disable-next-line: no-floating-promises
(async () => {
	const rubbers = await scrape('rubber');
	const rackets = await scrape('racket');
	await admin.initializeApp({
		credential: admin.credential.cert(serviceAccount),
		databaseURL: "https://pong-score.firebaseio.com"
	});
	await save(admin.firestore().collection('rubbers'), rubbers);
	await save(admin.firestore().collection('rackets'), rackets);
	console.log('SUCCESS');
})();
// exports.scraper = functions.https.onRequest( async (request, response) => {
//   const rubbers = await scrape('rubber');
// 	const rackets = await scrape('racket');
// 	await save(admin.database().ref('/rubbers'), rubbers);
// 	await save(admin.database().ref('/rackets'), rackets);
// });

