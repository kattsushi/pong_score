import 'package:flutter/material.dart';

class HomeClub extends StatelessWidget {
  const HomeClub({
    Key key,
    @required this.translate,
  }) : super(key: key);

  final String Function(String key) translate;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(children: <Widget>[
        Column(
          children: <Widget>[
            Container(
              width: MediaQuery.of(context).size.width / 2,
              height: 160,
              child: Card(
                child: Container(
                  child: Text(
                    translate('home-club'),
                    style: Theme.of(context).textTheme.display1,
                  ),
                ),
              ),
            ),
          ],
        ),
        Column(
          children: <Widget>[
            Container(
              width: MediaQuery.of(context).size.width / 2,
              child: Card(
                child: Container(
                  color: Color(0xFF062346),
                  child: Text(
                    translate('home-club'),
                    style: Theme.of(context).textTheme.display1,
                  ),
                ),
              ),
            ),
          ],
        ),
      ]),
    );
  }
}
