/*
 * "senior_client" created by @howyoujini on 2023/11/10  1:40 AM
 * Copyright (c) . All rights reserved.
 */


import 'package:zzekak/routes/app_routes.dart';

class SplashViewModel {
  Future<String> initLogic() async {
    await Future.delayed(const Duration(seconds: 1));
    return HomeRoute.PATH;
  }
}
