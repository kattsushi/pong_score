import 'package:flutter/material.dart';
import 'package:pong_score/presentation/core/base_widget.dart/base_widget_model.dart';
import 'package:pong_score/presentation/widgets/drawer_app/drawer_item_data.dart';

class DrawerOptionTabletPortrait extends BaseModelWidget<DrawerItemData> {
  @override
  Widget build(BuildContext context, DrawerItemData data) {
    return Container(
      width: 152,
      alignment: Alignment.center,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Icon(
            data.iconData,
            size: 45,
          ),
          Text(data.title, style: TextStyle(fontSize: 20)),
        ],
      ),
    );
  }
}
