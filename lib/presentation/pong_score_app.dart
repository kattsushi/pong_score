import 'package:flutter/material.dart';
import 'package:device_preview/device_preview.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:pong_score/domain/core/utils/app_localizations.dart';

import 'package:pong_score/presentation/core/theme/bloc/bloc.dart';
import 'package:pong_score/presentation/pages/auth/auth_view.dart';
import 'package:pong_score/presentation/pages/home/home_view.dart';
import 'package:pong_score/presentation/pages/home_club/home_club_page.dart';
import 'package:pong_score/application/auth/auth_bloc.dart';
import 'package:pong_score/injection.dart';

class PongScoreApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) => MultiBlocProvider(
        providers: [
          BlocProvider(create: (_) => ThemeBloc()),
          BlocProvider(
            create: (_) =>
                getIt<AuthBloc>()..add(const AuthEvent.authCheckRequested()),
          )
        ],
        child: BlocBuilder<ThemeBloc, ThemeState>(
          builder: _buildWithTheme,
        ),
      );

  Widget _buildWithTheme(BuildContext context, ThemeState state) {
    return MaterialApp(
      debugShowCheckedModeBanner: true,
      builder: DevicePreview.appBuilder,
      locale: DevicePreview.of(context).locale,
      home: AuthView(),
      theme: state.themeData,
      // TODO: overwrite language state
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
