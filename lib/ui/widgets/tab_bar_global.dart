
import 'package:flutter/material.dart';

class TabBarGlobalWidget extends StatelessWidget {
  const TabBarGlobalWidget({
    Key key,
    @required this.translate,
  }) : super(key: key);

  final String Function(String key) translate;

  @override
  Widget build(BuildContext context) {
    return TabBar(
      indicatorColor: Color(0xFF3B2F81),
      tabs: [
        Tab(
          child: Column(
            children: <Widget>[
              Icon(Icons.blur_on),
              Text(translate('home-club')),
            ],
          ),
        ),
        Tab(
          child: Column(
            children: <Widget>[
              Icon(Icons.layers),
              Text(translate('record-match')),
            ],
          ),
        ),
        Tab(
          child: Column(
            children: <Widget>[
              Icon(Icons.format_list_numbered),
              Text(translate('leader-board')),
            ],
          ),
        ),
      ],
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
      Center(
        child: Container(
          child: Text(
            translate('home-club'),
            style: Theme.of(context).textTheme.display1,
          ),
        ),
      ),
      Center(
        child: Container(
          child: Text(
            translate('record-match'),
            style: Theme.of(context).textTheme.display1,
          ),
        ),
      ),
      Center(
        child: Container(
          child: Text(
            translate('leader-board'),
            style: Theme.of(context).textTheme.display1,
          ),
        ),
      )
    ]);
  }
}
