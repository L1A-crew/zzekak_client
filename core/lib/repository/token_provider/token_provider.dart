//
// zzekak_client all rights reserved
//
// @author WongueShin
// @email won7963kr@gmail.com
// @since 2023-12-16
//

import 'package:core/model/user/user_model.dart';

abstract interface class TokenProvider {
  static const String keyAccessToken = 'access_token';
  static const String keyRefreshToken = 'refresh_token';
  static const String keyProvider = 'provider';

  /// 현재 로그인한 [AuthenticationInfo] 를 반환합니다.
  Future<AuthenticationInfo?> findMe();

  /// [user] 를 저장소에 저장합니다.
  Future<AuthenticationInfo> save(AuthenticationInfo user);
}
