/*
 * "senior_client" created by @howyoujini on 2023/11/10  1:40 AM
 * Copyright (c) . All rights reserved.
 */

import 'package:zzekak/zzekak_app.dart';

class SplashViewModel {
  Future<AppRoutes> whereToGo() async {
    await Future.delayed(const Duration(seconds: 1));
    return AppRoutes.HOME;
  }
}
