import 'package:flutter/material.dart';
import 'package:pong_score/presentation/widgets/drawer_app/drawer_item_data.dart';
import 'package:pong_score/presentation/widgets/drawer_option/drawer_option_mobile.dart';
import 'package:pong_score/presentation/widgets/drawer_option/drawer_option_tablet.dart';
import 'package:provider/provider.dart';
import 'package:responsive_builder/responsive_builder.dart';

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
        mobile: OrientationLayoutBuilder(
          landscape: (context) => DrawerOptionMobileLandscape(),
          portrait: (context) => DrawerOptionMobilePortrait(),
        ),
        tablet: OrientationLayoutBuilder(
          portrait: (context) => DrawerOptionTabletPortrait(),
          landscape: (context) => DrawerOptionMobilePortrait(),
        ),
      ),
    );
  }
}
