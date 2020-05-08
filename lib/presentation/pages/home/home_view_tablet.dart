import 'package:flutter/material.dart';
import 'package:pong_score/presentation/core/base_widget.dart/base_widget_model.dart';
import 'package:pong_score/presentation/pages/home/home_view_mobile.dart';
import 'package:pong_score/presentation/pages/home/home_view_model.dart';
import 'package:pong_score/presentation/widgets/drawer_app/drawer_app.dart';

class HomeViewTablet extends BaseModelWidget<HomeViewModel> {
  @override
  Widget build(BuildContext context, HomeViewModel model) {
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
