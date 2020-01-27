 /* tslint:disable:no-unused-variable */
// import * as functions from 'firebase-functions';

// const cors = require('cors')({ origin: true});

// import * as puppeteer from 'puppeteer';
import * as cheerio from 'cheerio';
// const getUrls = require('get-urls');
const fetch = require('node-fetch');

const RubberTypes = {
    pimplesIn: 'flag_ura',
    shortPimples: 'flag_omote',
    singleAntiSpinLongPimplesEtc: 'flag_etc',
    large: 'flag_large'
}


const scrape = async (model: string) => {
    const url =`https://tabletennis-reference.com/${model}/search/${RubberTypes.pimplesIn}`;
    const res = await fetch(url);

        const html = await res.text();
        
        const $ = cheerio.load(html);
        const numberOfThings = Number($('.redTtl2').children('span').text().split(' ')[0]);
        const pages = [...Array(Math.round(numberOfThings / 10)).keys()].map((val) => val * 10);
        console.log(pages);

        const promises = pages.map(async (value) => {
            if (value === 0) {
                
            }
        })

        // console.log($('.clearfix').toArray().filter((value) => value.tagName === 'dl').map((value) => ({
        //    detail: $(value.parent).attr()['href'],
        //    img: $(value.children.find((val) => val.tagName === 'dt')?.children.find(val => val.tagName === 'img')).attr()['src'],
        //    name: $(value.children.find((val) => val.tagName === 'dt')?.children.find(val => val.tagName === 'img')).attr()['alt'],
        //    description: $(value.children.find((val) => val.tagName === 'dd')?.children.find(val => val.tagName === 'p')).text(),
        //    points: $(value.children.find((val) => val.tagName === 'dd')?.children.find(val => val.tagName === 'ul')).text().trim().split('\n').map(e => ({
        //        all: e.includes('ALL') ? e.trim().split(':')[1]: null,
        //        speed: e.includes('Speed') ? e.trim().split(':')[1]: null,
        //        spin: e.includes('Spin') ? e.trim().split(':')[1]: null,
        //        control: e.includes('Control') ? e.trim().split(':')[1]: null,
        //        overall: e.includes('Overall') ? e.trim().split(':')[1]: null,
        //    }))
        // })));
        

        return { 
            url,
            rubberts: $('.listCont').children().toArray().map((value) => {
                return {
                    rubbertName: value
                }
            })
            // title: $('title').first().text(),
            // favicon: $('link[rel="shortcut icon"]').attr('href'),
            // // description: $('meta[name=description]').attr('content'),
            // description: getMetatag('description'),
            // image: getMetatag('image'),
            // author: getMetatag('author'),
        }
}

// tslint:disable-next-line: no-floating-promises
(async () => {
    await scrape('rubber');
    // console.log('DATA', data);
})();
export {};
// exports.scraper = functions.https.onRequest( async (request, response) => {
//     cors(request, response, async () => {
//         const data = await scrapeImages();
//         response.send(data)
//     });
// });
// // Start writing Firebase Functions
// // https://firebase.google.com/docs/functions/typescript
//
// export const helloWorld = functions.https.onRequest((request, response) => {
//  response.send("Hello from Firebase!");
// });
