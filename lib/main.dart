import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:pong_score/ui/global/app_localizations.dart';
import 'package:pong_score/ui/global/theme/bloc/theme_bloc.dart';
import 'package:pong_score/ui/global/theme/bloc/theme_state.dart';
import 'package:pong_score/ui/screens/home/home_page.dart';

void main() => runApp(DevicePreview(builder: (context) => PongScoreApp()));
 
class PongScoreApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) => BlocProvider(
      builder: (context) => ThemeBloc(),
      child: BlocBuilder<ThemeBloc, ThemeState>(
        builder: _buildWithTheme,
      ),
    );

  Widget _buildWithTheme(BuildContext context, ThemeState state) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      builder: DevicePreview.appBuilder,
      locale: DevicePreview.of(context).locale,
      home: HomePage(),
      theme: state.themeData,
      supportedLocales: [
        Locale('es', 'MX'),
        Locale('en', 'US'),
      ],
      localizationsDelegates: [
        // THIS CLASS WILL BE ADDED LATER
        // A class which loads the translations from JSON files
        Applocalizations.delegate,
        // Built-in localization of basic text for Material widgets
        GlobalMaterialLocalizations.delegate,
        // Built-in localization for text direction LTR/RTL
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      localeResolutionCallback: (locale, supportedLocales) {
        for (var supportedLocale in supportedLocales) {
          if (supportedLocale.languageCode == locale.languageCode &&
              supportedLocale.countryCode == locale.countryCode) {
                return supportedLocale;
          }
        }
        return supportedLocales.first;
      },
    );
  }
}
