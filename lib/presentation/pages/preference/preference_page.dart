import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pong_score/domain/core/utils/app_localizations.dart';
import 'package:pong_score/presentation/core/theme/app_themes.dart';
import 'package:pong_score/presentation/core/theme/bloc/bloc.dart';

class PreferencePage extends StatelessWidget {
  const PreferencePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // var translate = Applocalizations.of(context).translate;
    return Scaffold(
      appBar: AppBar(
        title: Text('Preferences'),
      ),
      body:
          // Column(
          // children: <Widget>[
          ListView.builder(
        padding: EdgeInsets.all(8),
        itemCount: AppTheme.values.length,
        itemBuilder: (context, index) {
          // Enums expose their values as a list - perfect for ListView
          // Store the theme for the current ListView item
          final itemAppTheme = AppTheme.values[index];
          return Column(
            children: <Widget>[
              Card(
                // Style the cards with the to-be-selected theme colors
                color: appThemeData[itemAppTheme].primaryColor,
                child: ListTile(
                  title: Text(
                    itemAppTheme.toString(),
                    // To show light text with the dark variants...
                    style: appThemeData[itemAppTheme].textTheme.bodyText2,
                  ),
                  onTap: () {
                    // This will make the Bloc output a new ThemeState,
                    // which will rebuild the UI because of the BlocBuilder in main.dart
                    BlocProvider.of<ThemeBloc>(context)
                        .add(ThemeChanged(theme: itemAppTheme));
                  },
                ),
              ),
            ],
          );
        },
      ),
      // Padding(
      //   padding: const EdgeInsets.only(left: 10, right: 10),
      //   child: Row(
      //     children: [
      //       Expanded(child: Text(translate('lenguage'))),
      //       Radio(
      //         value: 0,
      //         groupValue: null,
      //         onChanged: (val) => null,
      //       ),
      //       Text(translate('spanish')),
      //       Radio(
      //         value: 1,
      //         groupValue: null,
      //         onChanged: (val) => null,
      //       ),
      //       Text(translate('english')),
      //     ],
      //   ),
      // )
      // ],
      // ),
    );
  }
}

class LocalePref extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var translate = Applocalizations.of(context).translate;
    return Padding(
      padding: const EdgeInsets.only(left: 10, right: 10),
      child: Row(
        children: [
          Expanded(child: Text(translate('lenguage'))),
          Radio(
            value: 0,
            groupValue: null,
            onChanged: (val) => null,
          ),
          Text(translate('spanish')),
          Radio(
            value: 1,
            groupValue: null,
            onChanged: (val) => null,
          ),
          Text(translate('english')),
        ],
      ),
    );
  }
}
