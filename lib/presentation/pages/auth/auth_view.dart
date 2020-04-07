import 'package:flutter/material.dart';
import 'package:pong_score/domain/core/layout/base_widget.dart/base_widget.dart';
import 'package:pong_score/domain/core/layout/orientation_layout.dart';
import 'package:pong_score/domain/core/layout/screen_type_layout.dart';
import 'package:pong_score/presentation/pages/auth/auth_view_mobile.dart';
import 'package:pong_score/presentation/pages/auth/auth_view_model.dart';
import 'package:pong_score/presentation/pages/auth/auth_view_tablet.dart';

class AuthView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BaseWidget<AuthViewModel>(
      viewModel: AuthViewModel(),
      onModelReady: (model) => model.initialise(),
      child: ScreenTypeLayout(
        mobile: OrientationLayout(
          portrait: (context) => AuthMobileViewPortrait(),
          landscape: (context) => AuthMobileViewLandscape(),
        ),
        tablet: AuthViewTablet(),
      ),
    );
  }
}

class SecondView extends StatelessWidget {
  const SecondView({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.red,
    );
  }
}
