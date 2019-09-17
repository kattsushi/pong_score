import 'package:flutter/material.dart';
import 'package:pong_score/ui/global/app_localizations.dart';
import 'package:pong_score/ui/widgets/drawer_global.dart';
import 'package:pong_score/ui/widgets/tab_bar_global.dart';
import '../preference/preference_page.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
  final translate = Applocalizations.of(context).translate;
    return DefaultTabController(
      child: Scaffold(
        bottomNavigationBar: TabBarGlobalWidget(translate: translate),
        drawer: DrawerGlobal(),
        appBar: AppBar(
          title: Text("Pong-Score"),
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
        ),
        body: TabBarViewGlobal(translate: translate),
      ),
      length: 3,
    );
  }
}
