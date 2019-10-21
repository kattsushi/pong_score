import 'package:flutter/material.dart';
import 'package:pong_score/ui/views/home/home_view_mobile.dart';
import 'package:pong_score/ui/widgets/drawer_app/drawer_app.dart';

class HomeViewTablet extends StatelessWidget {
  const HomeViewTablet({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var children = [
      Expanded(
        child: Container(),
      ),
      DrawerApp()
    ];
    var orientation = MediaQuery.of(context).orientation;
    return Scaffold(
      appBar: HomeMobileViewPortrait.getAppBar(context),
      body: orientation == Orientation.portrait
          ? Column(children: children)
          : Row(children: children.reversed.toList()),
    );
  }
}