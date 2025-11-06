import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'myapp.dart';
import 'package:device_preview/device_preview.dart';

void main() {
  runApp(DevicePreview(
      enabled: kDebugMode,
      builder: (context) => const MyApp()));
}