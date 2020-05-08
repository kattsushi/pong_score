import 'package:device_preview/device_preview.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:pong_score/injection.dart';
import 'package:pong_score/presentation/pong_score_app.dart';

void main() {
  configureInjection(Env.prod);
  runApp(
      DevicePreview(enabled: kDebugMode, builder: (context) => PongScoreApp()));
}
