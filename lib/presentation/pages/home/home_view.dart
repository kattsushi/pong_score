import 'package:flutter/material.dart';
import 'package:pong_score/presentation/core/base_widget.dart/base_widget.dart';
import 'package:pong_score/presentation/pages/home/home_view_mobile.dart';
import 'package:pong_score/presentation/pages/home/home_view_model.dart';
import 'package:pong_score/presentation/pages/home/home_view_tablet.dart';
import 'package:responsive_builder/responsive_builder.dart';

class HomeView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    print('Rebuild');
    return BaseWidget<HomeViewModel>(
      viewModel: HomeViewModel(),
      onModelReady: (model) => model.initialise(),
      child: ScreenTypeLayout(
        mobile: OrientationLayoutBuilder(
          portrait: (context) => HomeMobileViewPortrait(),
          landscape: (context) => HomeMobileViewLandscape(),
        ),
        tablet: HomeViewTablet(),
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
