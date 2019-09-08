import 'package:flutter/material.dart';
import 'package:pong_score/ui/global/app_localizations.dart';
import '../preference/preference_page.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(Applocalizations.of(context).translate('home')),
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
      body: Center(
        child: Container(
          child: Text(
            Applocalizations.of(context).translate('hello-world'),
            style: Theme.of(context).textTheme.display1,
          ),
        ),
      ),
    );
  }
}