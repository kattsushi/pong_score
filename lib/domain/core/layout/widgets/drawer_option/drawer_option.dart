import 'package:flutter/material.dart';
import 'package:pong_score/domain/core/layout/orientation_layout.dart';
import 'package:pong_score/domain/core/layout/screen_type_layout.dart';
import 'package:pong_score/domain/core/layout/widgets/drawer_app/drawer_item_data.dart';
import 'package:pong_score/domain/core/layout/widgets/drawer_option/drawer_option_mobile.dart';
import 'package:pong_score/domain/core/layout/widgets/drawer_option/drawer_option_tablet.dart';
import 'package:provider/provider.dart';

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
    return Provider.value(
      value: DrawerItemData(iconData: iconData, title: title),
      child: ScreenTypeLayout(
        mobile: OrientationLayout(
          landscape: (context) => DrawerOptionMobileLandscape(),
          portrait: (context) => DrawerOptionMobilePortrait(),
        ),
        tablet: OrientationLayout(
          portrait: (context) => DrawerOptionTabletPortrait(),
          landscape: (context) => DrawerOptionMobilePortrait(),
        ),
      ),
    );
  }
}
