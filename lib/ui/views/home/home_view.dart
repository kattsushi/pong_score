import 'package:flutter/material.dart';
import 'package:pong_score/ui/layout/orientation_layout.dart';
import 'package:pong_score/ui/layout/screen_type_layout.dart';
import 'package:pong_score/ui/views/home/home_view_mobile.dart';
import 'package:pong_score/ui/views/home/home_view_model.dart';
import 'package:pong_score/ui/views/home/home_view_tablet.dart';
import 'package:pong_score/ui/widgets/base_widget.dart/base_widget.dart';

class HomeView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    print('Rebuild');
    return BaseWidget<HomeViewModel>(
      viewModel: HomeViewModel(),
      onModelReady: (model) => model.initialise(),
      child: ScreenTypeLayout(
        mobile: OrientationLayout(
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