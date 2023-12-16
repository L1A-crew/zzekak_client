//
// zzekak_client all rights reserved
//
// @author WongueShin
// @email won7963kr@gmail.com
// @since 2023-12-16
//

import 'package:injectable/injectable.dart';
import 'package:util/di_env/di_env.dart';

/// DI PoC 를 위해 [SharedPreferences] 를 모킹합니다.
@mobile
@web
@dev
@prod
@singleton
final class MockSharedPreferences {
  @FactoryMethod()
  static Future<MockSharedPreferences> create() async {
    await Future.delayed(Duration(seconds: 1));
    final singleton = MockSharedPreferences();
    return singleton;
  }
}
