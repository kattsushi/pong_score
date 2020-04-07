import 'package:flutter/material.dart';

class Header extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      overflow: Overflow.visible,
      children: <Widget>[
        Container(
          height: 60,
          width: double.infinity,
          // TODO: apply the theme dark/light
          color: Color(0xff3466FF),
        ),
        Positioned(
            height: 200, top: -25, child: Image.asset('images/header.png')),
      ],
    );
  }
}
