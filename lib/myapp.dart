import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:bienesta_integral/core/route/app_routes.dart';
import 'package:bienesta_integral/core/route/app_router.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      locale: DevicePreview.locale(context),
      builder: DevicePreview.appBuilder,
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.system,


      onGenerateRoute: AppRouter.onGenerateRoute,


      initialRoute: AppRoutes.login,
    );
  }
}