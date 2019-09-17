import 'package:flutter/material.dart';
import 'package:pong_score/ui/global/app_localizations.dart';

import 'drawer_state.dart';

class DrawerGlobal extends StatelessWidget {
  const DrawerGlobal({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final translate = Applocalizations.of(context).translate;
    return Drawer(
      child: ListView.builder(
      itemCount: menuData.length,
      itemBuilder: (context, index) {
        final item = menuData[index];
        if (item is MenuHeaderDrawer) {
          return UserAccountsDrawerHeader(
            accountName: Text('Jon doe'),
            accountEmail: Text('jondoe@test.com'),
            decoration: BoxDecoration(
                shape: BoxShape.rectangle,
                image: DecorationImage(
                    image: AssetImage("images/header.png")
                )
            ),
          );
        } else if (item is MenuDivider) {
          return Divider();
        } else if (item is MenuItemDrawer) {
          return ListTile(
            title: Text(translate(item.transKey)),
            leading: Icon(item.icon),
          );
        }
        return null;
      },
    ));
  }
}
