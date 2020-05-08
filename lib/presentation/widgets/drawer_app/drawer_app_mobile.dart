import 'package:flutter/material.dart';
import 'package:pong_score/domain/core/utils/app_localizations.dart';
import 'package:pong_score/presentation/widgets/drawer_app/drawer_app.dart';

class DrawerAppMobile extends StatelessWidget {
  const DrawerAppMobile({Key key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    var orientation = MediaQuery.of(context).orientation;
    var isPortrait = orientation == Orientation.portrait ? true : false;
    final translate = Applocalizations.of(context).translate;
    return Container(
      width: orientation == Orientation.portrait ? 250 : 100,
      decoration: BoxDecoration(color: Color(0xFF212B45), boxShadow: [
        BoxShadow(
          blurRadius: 16,
          color: Colors.black12,
        )
      ]),
      child: ListView(
        children: [
          DrawerApp.getProfile(isPortrait),
          ...DrawerApp.buildListViewOptions(translate)
        ],
      ),
    );
  }
}
