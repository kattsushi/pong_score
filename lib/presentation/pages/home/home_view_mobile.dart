import 'package:flutter/material.dart';
import 'package:pong_score/domain/core/layout/base_widget.dart/base_widget_model.dart';
import 'package:pong_score/domain/core/layout/widgets/drawer_app/drawer_app.dart';
import 'package:pong_score/presentation/pages/home/home_view_model.dart';
import 'package:pong_score/presentation/pages/preference/preference_page.dart';

class HomeMobileViewPortrait extends BaseModelWidget<HomeViewModel> {

  @override
  Widget build(BuildContext context, HomeViewModel model) {
    final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
    return Container(
      child: Scaffold(
        key: _scaffoldKey,
        drawer: DrawerApp(),
        appBar: HomeMobileViewPortrait.getAppBar(context),
        body: Container(),
      ),
    );
  }
  static Widget getAppBar(BuildContext context) {
    return AppBar(
      title: Text("Pong-Scores"),
      actions: <Widget>[
        IconButton(
          icon: Icon(Icons.settings),
          onPressed: () {
            // Navigate to the PreferencePage
            Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => PreferencePage(),
            ));
          },
        )
      ],
    );
  }
}

class HomeMobileViewLandscape extends BaseModelWidget<HomeViewModel> {
  @override
  Widget build(BuildContext context, HomeViewModel model) {
    return Scaffold(
      body: Row(children: <Widget>[
        DrawerApp(),
        Expanded(
        child: Scaffold(
          appBar: HomeMobileViewPortrait.getAppBar(context),
        ),
      ),
      ],),
    );
  }
}