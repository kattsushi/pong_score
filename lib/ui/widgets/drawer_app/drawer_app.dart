import 'package:flutter/material.dart';
import 'package:pong_score/ui/layout/orientation_layout.dart';
import 'package:pong_score/ui/layout/screen_type_layout.dart';
import 'package:pong_score/ui/widgets/drawer_app/drawer_app_mobile.dart';
import 'package:pong_score/ui/widgets/drawer_app/drawer_app_tablet.dart';
import 'package:pong_score/ui/widgets/drawer_app/drawer_state.dart';
// import 'package:pong_score/ui/widgets/drawer_app/drawer_state.dart';
import 'package:pong_score/ui/widgets/drawer_option/drawer_option.dart';

class DrawerApp extends StatelessWidget {
  const DrawerApp({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenTypeLayout(
      mobile: DrawerAppMobile(),
      tablet: OrientationLayout(
        portrait: DrawerAppTabletPortrait(),
        landscape: DrawerAppTabletLandscape(),
      ),
    );
  }

  static Widget getProfile(bool orientation) {
    return orientation
        ? UserAccountsDrawerHeader(
            accountName: Text('Jon doe'),
            accountEmail: Text('jondoe@test.com'),
            decoration: BoxDecoration(
                shape: BoxShape.rectangle,
                image: DecorationImage(image: AssetImage("images/header.png"))))
        : Padding(
            padding: const EdgeInsets.only(top: 8.0), child: CircleAvatar());
  }

  static List<Widget> buildListViewOptions(String translate(String key)) {
    return menuData.map<Widget>((menu) {
      if (menu is MenuDivider) {
          return Divider();
        } else if (menu is MenuItemDrawer) {
          return DrawerOption(
            title: menu.transKey,
            iconData: menu.icon,
          );
        }
        return Container();
    }).toList();
    //   [
    //   DrawerOption(
    //     title: 'Images',
    //     iconData: Icons.image,
    //   ),
    //   DrawerOption(
    //     title: 'Reports',
    //     iconData: Icons.photo_filter,
    //   ),
    //   DrawerOption(
    //     title: 'Incidents',
    //     iconData: Icons.message,
    //   ),
    //   DrawerOption(
    //     title: 'Settings',
    //     iconData: Icons.settings,
    //   ),
    // ];
    // return ListView.builder(
    //   itemCount: menuData.length,
    //   itemBuilder: (context, index) {
    //     final item = menuData[index];
    //     if (item is MenuHeaderDrawer) {
    //       return UserAccountsDrawerHeader(
    //         accountName: Text('Jon doe'),
    //         accountEmail: Text('jondoe@test.com'),
    //         decoration: BoxDecoration(
    //             shape: BoxShape.rectangle,
    //             image:
    //                 DecorationImage(image: AssetImage("images/header.png"))),
    //       );
    //     } else if (item is MenuDivider) {
    //       return Divider();
    //     } else if (item is MenuItemDrawer) {
    //       return ListTile(
    //         title: Text(translate(item.transKey)),
    //         leading: Icon(item.icon),
    //       );
    //     }
    //     return null;
    //   },
    // );
  }
}
