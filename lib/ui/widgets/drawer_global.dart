import 'package:flutter/material.dart';
import 'package:pong_score/ui/global/app_localizations.dart';

enum Menu {
  members,
  tournaments,
  events,
  clubInfo,
  subscription,
  teamsManagement
}

final List<MenuItem> menuData = [
  MenuHeaderDrawer(),
  MenuDivider(),
  MenuItemDrawer(icon: Icons.contacts, transKey: 'members'),
  MenuItemDrawer(icon: Icons.call_merge, transKey: 'tournaments'),
  MenuItemDrawer(icon: Icons.launch, transKey: 'events'),
  MenuItemDrawer(icon: Icons.info, transKey: 'club-info'),
  MenuItemDrawer(icon: Icons.repeat_one, transKey: 'subcription'),
  MenuItemDrawer(icon: Icons.call_merge, transKey: 'teams-management'),
];

class User {
  final String name;
  final String email;
  final String urlImage;

  User({this.name, this.email, this.urlImage});
}

abstract class MenuItem {}

class MenuHeaderDrawer implements MenuItem {}

class MenuItemDrawer implements MenuItem {
  final String transKey;
  final IconData icon;
  MenuItemDrawer({this.transKey, this.icon});
}

class MenuDivider implements MenuItem {}

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
                    image:
                        NetworkImage("http://lorempixel.com/400/200/sports"))),
          );
        } else if (item is MenuDivider) {
          return Divider();
        } else if (item is MenuItemDrawer) {
          return ListTile(
            title: Text(translate(item.transKey)),
            // trailing: Icon(item.icon),
            leading: Icon(item.icon),
          );
        }
        return null;
      },
    ));
  }
}
