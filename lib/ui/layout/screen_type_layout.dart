import 'package:flutter/material.dart';
import 'package:pong_score/constants/device_screen_type.dart';
import 'package:pong_score/ui/layout/responsive_builder.dart';

class ScreenTypeLayout extends StatelessWidget {
  final Widget mobile;
  final Widget tablet;
  final Widget desktop;

  const ScreenTypeLayout(
      {Key key, @required this.mobile, this.tablet, this.desktop})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ResponsiveBuilder(builder: (context, sizingInformation) {
      if (sizingInformation.deviceScreenType == DeviceScreenType.Tablet) {
        if (tablet != null) {
          return tablet;
        }
      }
      if (sizingInformation.deviceScreenType == DeviceScreenType.Desktop) {
        if (desktop != null) {
          return desktop;
        }
      }
      return mobile;
    });
  }
}
