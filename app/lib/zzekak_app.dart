/*
 * "tick_client" created by @howyoujini on 2023/11/11  6:54 PM
 * Copyright (c) app.lib. All rights reserved.
 */

import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import 'package:zzekak/screen/home/v_home.dart';
import 'package:zzekak/screen/login/v_login.dart';
import 'package:zzekak/schemes/color_schemes.dart';
import 'package:zzekak/screen/splash/v_splash.dart';

part 'app_routes.dart';

class ZzekakApp extends StatelessWidget {
  /// ko ver. 째깍
  /// en ver. zzekak
  static const String appName = "째깍";
  static const String appFontFamily = "NotoSansKR";

  const ZzekakApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: appName,
      routerConfig: _router,
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.white,
        useMaterial3: true,
        colorScheme: lightColorScheme,
        fontFamily: ZzekakApp.appFontFamily,
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent,
      ),
      darkTheme: ThemeData(
        scaffoldBackgroundColor: Colors.black,
        useMaterial3: true,
        colorScheme: darkColorScheme,
        fontFamily: ZzekakApp.appFontFamily,
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent,
      ),
    );
  }
}
