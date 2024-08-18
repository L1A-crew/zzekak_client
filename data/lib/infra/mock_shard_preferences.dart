//
// zzekak_client all rights reserved
//
// @author WongueShin
// @email won7963kr@gmail.com
// @since 2023-12-16
//

/// DI PoC 를 위해 [SharedPreferences] 를 모킹합니다.
final class MockSharedPreferences {
  static Future<MockSharedPreferences> create() async {
    await Future.delayed(const Duration(seconds: 1));
    final singleton = MockSharedPreferences();
    return singleton;
  }
}
