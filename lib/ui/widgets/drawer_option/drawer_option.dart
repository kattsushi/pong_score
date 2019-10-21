import 'package:flutter/material.dart';
import 'package:pong_score/ui/layout/orientation_layout.dart';
import 'package:pong_score/ui/layout/screen_type_layout.dart';
import 'package:pong_score/ui/widgets/drawer_option/drawer_option_mobile.dart';
import 'package:pong_score/ui/widgets/drawer_option/drawer_option_tablet.dart';

class DrawerOption extends StatelessWidget {
  final String title;
  final IconData iconData;
  const DrawerOption({
    Key key,
    this.title,
    this.iconData,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenTypeLayout(
      mobile: OrientationLayout(
        landscape: DrawerOptionMobileLandscape(
          iconData: iconData,
        ),
        portrait: DrawerOptionMobilePortrait(
          title: title,
          iconData: iconData,
        ),
      ),
      tablet: OrientationLayout(
        portrait: DrawerOptionTabletPortrait(
          iconData: iconData,
          title: title,
        ),
        landscape: DrawerOptionMobilePortrait(
          iconData: iconData,
          title: title,
        ),
      ),
    );
  }
}