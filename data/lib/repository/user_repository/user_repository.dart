//
// zzekak_client all rights reserved
//
// @author WongueShin
// @email won7963kr@gmail.com
// @since 2023-12-16
//

import 'package:core/model/user/user_model.dart';
import 'package:core/repository/token_provider/token_provider.dart';
import 'package:dart_scope_functions/dart_scope_functions.dart';
import 'package:data/api/auth_api/auth_api.dart';
import 'package:data/api/auth_api/request/join_or_login_request.dart';
import 'package:data/api/auth_api/response/join_or_login_response.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

final class TokenProviderImpl implements TokenProvider {
  final AuthenticationAPI _authenticationAPI;
  final SharedPreferences _sharedPreferences;

  static TokenProvider newInstance(final GetIt getIt) => TokenProviderImpl(
        authenticationAPI: getIt.get(type: AuthProvider),
        searchPreferences: getIt.get(type: SharedPreferences),
      );

  const TokenProviderImpl({
    required final AuthenticationAPI authenticationAPI,
    required final SharedPreferences searchPreferences,
  })  : _authenticationAPI = authenticationAPI,
        _sharedPreferences = searchPreferences;

  @override
  Future<AuthenticationInfo?> findMe({
    String? tokenInput,
    String? providerInput,
  }) async {
    try {
      final String token = tokenInput ??
          _sharedPreferences.getString(TokenProvider.keyAccessToken)!;
      final String provider = providerInput ??
          _sharedPreferences.getString(TokenProvider.keyProvider)!;

      return (await _authenticationAPI.joinOrLogin(
        JoinOrLoginRequest(
          token: token,
          provider: AuthProviderExt.fromString(provider),
        ),
      ))
          .let((final JoinOrLoginResponse it) => AuthenticationInfo(
                it.tokenContent.accessToken,
                it.tokenContent.refreshToken,
              ));
    } catch (e) {
      return null;
    }
  }

  @override
  Future<AuthenticationInfo> save(AuthenticationInfo user) async {
    await _sharedPreferences.setString(
        TokenProvider.keyAccessToken, user.accessToken);
    await _sharedPreferences.setString(
        TokenProvider.keyRefreshToken, user.refreshToken);

    return user;
  }
}
