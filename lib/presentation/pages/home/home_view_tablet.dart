import 'package:flutter/material.dart';
import 'package:pong_score/domain/core/layout/base_widget.dart/base_widget_model.dart';
import 'package:pong_score/domain/core/layout/widgets/drawer_app/drawer_app.dart';
import 'package:pong_score/presentation/pages/home/home_view_mobile.dart';
import 'package:pong_score/presentation/pages/home/home_view_model.dart';

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