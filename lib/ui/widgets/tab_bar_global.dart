import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:pong_score/ui/views/home_club/home_club_page.dart';

class TabBarGlobalWidget extends StatelessWidget {
  const TabBarGlobalWidget({
    Key key,
    @required this.translate,
  }) : super(key: key);

  final String Function(String key) translate;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xFF212B45),
      child: TabBar(
        indicatorColor: Color(0xFFFFFFFF),
        tabs: [
          Tab(
            child: Column(
              children: <Widget>[
                Icon(Icons.blur_on),
                SizedBox(height: 5,),
                Text(translate('home-club'), style: TextStyle(fontSize: 11),),
              ],
            ),
          ),
          Tab(
            child: Column(
              children: <Widget>[
                Icon(FontAwesomeIcons.tableTennis),
                SizedBox(height: 5,),
                Text(translate('record-match'), style: TextStyle(fontSize: 11),),
              ],
            ),
          ),
          Tab(
            child: Column(
              children: <Widget>[
                Icon(Icons.format_list_numbered),
                SizedBox(height: 5,),
                Text(translate('leader-board'), style: TextStyle(fontSize: 11),),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class TabBarViewGlobal extends StatelessWidget {
  const TabBarViewGlobal({
    Key key,
    @required this.translate,
  }) : super(key: key);

  final String Function(String key) translate;

  @override
  Widget build(BuildContext context) {
    return TabBarView(children: [
      Scaffold(
        backgroundColor: Color(0xFF212B45),
        body: HomeClub(translate: translate),
      ),
      Scaffold(
        backgroundColor: Color(0xFF212B45),
        body: Center(
          child: Container(
            child: Text(
              translate('record-match'),
              style: Theme.of(context).textTheme.subtitle2,
            ),
          ),
        ),
      ),
      Scaffold(
        backgroundColor: Color(0xFF212B45),
        body: Center(
          child: Container(
            child: Text(
              translate('leader-board'),
              style: Theme.of(context).textTheme.subtitle1,
            ),
          ),
        ),
      )
    ]);
  }
}

