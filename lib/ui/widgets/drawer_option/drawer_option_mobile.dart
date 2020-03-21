import 'package:flutter/material.dart';
import 'package:pong_score/ui/widgets/base_widget.dart/base_widget_model.dart';
import 'package:pong_score/ui/widgets/drawer_app/drawer_item_data.dart';

class DrawerOptionMobilePortrait extends BaseModelWidget<DrawerItemData> {
  @override
  Widget build(BuildContext context, DrawerItemData data) {
    return Container(
      padding: const EdgeInsets.only(left: 25),
      height: 60,
      child: Row(
        children: <Widget>[
          Icon(
            data.iconData,
            size: 25,
          ),
          SizedBox(
            width: 25,
          ),
          Text(
            data.title,
            style: TextStyle(fontSize: 15),
          )
        ],
      ),
    );
  }
}

class DrawerOptionMobileLandscape extends BaseModelWidget<DrawerItemData> {
  @override
  Widget build(BuildContext context, DrawerItemData data) {
    return Container(
      height: 62,
      alignment: Alignment.center,
      child: Icon(data.iconData),
    );
  }
}