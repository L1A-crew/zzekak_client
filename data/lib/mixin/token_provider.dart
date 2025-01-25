//
// zzekak_client all rights reserved
//
// @author WongueShin
// @email won7963kr@gmail.com
// @since 2024-02-24
//

import 'package:core/model/auth_token/trd_auth_token.dart';
import 'package:core/model/local_storage.dart';
import 'package:data/api/auth_api/auth_api.dart';
import 'package:data/api/auth_api/request/join_or_login_request.dart';
import 'package:data/api/auth_api/response/join_or_login_response.dart';
import 'package:dart_scope_functions/dart_scope_functions.dart';

abstract interface class AuthenticationMixinBase {
  static const String _accessTokenKey = 'access_token';
  static const String _refreshToken = 'refresh_token';
  abstract final LocalStorage localStorage;

  abstract final AuthenticationAPI authenticationAPI;
}

abstract mixin class AuthenticateUseCase implements AuthenticationMixinBase {
  /// 사용자의 인증을 위해 로그인을 시도하고, 성공 시 [FirstPartyAuthToken]을 반환합니다.
  Future<FirstPartyAuthToken> authenticate(
      final ThirdPartyAuthToken token) async {
    return (await authenticationAPI
            .joinOrLogin(JoinOrLoginRequest.fromThirdPartyToken(token)))
        .toFirstPartyAuthToken()
        .also((final FirstPartyAuthToken firstPartyAuthToken) {
      (
        localStorage.save(AuthenticationMixinBase._accessTokenKey,
            firstPartyAuthToken.accessToken),
        localStorage.save(AuthenticationMixinBase._refreshToken,
            firstPartyAuthToken.refreshToken),
      ).wait;
    });
  }
}

abstract mixin class TokenRefreshUseCase implements AuthenticationMixinBase {
  /// 사용자의 인증을 위해 로그인을 시도하고, 성공 시 [FirstPartyAuthToken]을 반환합니다.
  Future<FirstPartyAuthToken> refresh() {
    /// 서버가 아직 Endpoint를 제공하지 않음.
    throw UnimplementedError();
  }
}

abstract mixin class LogoutUseCase implements AuthenticationMixinBase {
  /// 사용자의 인증을 위해 로그인을 시도하고, 성공 시 [FirstPartyAuthToken]을 반환합니다.
  Future<void> logout() async {
    await (
      localStorage.delete(AuthenticationMixinBase._accessTokenKey),
      localStorage.delete(AuthenticationMixinBase._refreshToken),
    ).wait;
  }

  /// 사용자의 인증을 위해 로그인을 시도하고, 성공 시 [FirstPartyAuthToken]을 반환합니다.
  Future<void> signOut();
}
