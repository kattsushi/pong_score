import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:pong_score/domain/core/layout/widgets/drawer_app/drawer_app.dart';
import 'package:pong_score/domain/core/utils/app_localizations.dart';

class DrawerAppTabletPortrait extends StatelessWidget {
  const DrawerAppTabletPortrait({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // var orientation = MediaQuery.of(context).orientation == Orientation.portrait ? true : false;
    final translate = Applocalizations.of(context).translate;
    return Container(
      height: 130,
      decoration: BoxDecoration(color: Color(0xFF212B45), boxShadow: [
        BoxShadow(
          blurRadius: 16,
          color: Colors.black12,
        )
      ]),
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: [
          // DrawerApp.getProfile(orientation),
          ...DrawerApp.buildListViewOptions(translate)
        ],
      ),
    );
  }
}

class DrawerAppTabletLandscape extends StatelessWidget {
  const DrawerAppTabletLandscape({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // var orientation = MediaQuery.of(context).orientation != Orientation.landscape;
    final translate = Applocalizations.of(context).translate;
    return Container(
      width: 250,
      decoration: BoxDecoration(color: Color(0xFF212B45), boxShadow: [
        BoxShadow(
          blurRadius: 16,
          color: Colors.black12,
        )
      ]),
      child: ListView(
        children: [
          // DrawerApp.getProfile(orientation),
          ...DrawerApp.buildListViewOptions(translate)
        ],
      ),
    );
  }
}