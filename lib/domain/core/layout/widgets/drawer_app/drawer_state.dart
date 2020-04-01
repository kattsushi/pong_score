import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

final List menuData = [
  MenuHeaderDrawer(),
  MenuDivider(),
  MenuItemDrawer(icon: FontAwesomeIcons.users, transKey: 'members'),
  MenuItemDrawer(icon: FontAwesomeIcons.trophy, transKey: 'tournaments'),
  MenuItemDrawer(icon: FontAwesomeIcons.calendarCheck, transKey: 'events'),
  MenuItemDrawer(icon: FontAwesomeIcons.tableTennis, transKey: 'club-info'),
  MenuItemDrawer(icon: FontAwesomeIcons.ticketAlt, transKey: 'subcription'),
  MenuItemDrawer(icon: FontAwesomeIcons.usersCog, transKey: 'teams-management'),
];

class User {
  final String name;
  final String email;
  final String urlImage;

  User({this.name, this.email, this.urlImage});
}

abstract class MenuItem {}

class MenuHeaderDrawer {}

class MenuItemDrawer {
  final String transKey;
  final IconData icon;
  MenuItemDrawer({this.transKey, this.icon});
}

class MenuDivider {}
