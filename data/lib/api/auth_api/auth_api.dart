//
// zzekak_client all rights reserved
//
// @author WongueShin
// @email won7963kr@gmail.com
// @since 2024-02-24
//

import 'package:dart_scope_functions/dart_scope_functions.dart';
import 'package:data/api/auth_api/response/join_or_login_response.dart';
import 'package:data/api/auth_api/request/join_or_login_request.dart';
import 'package:data/io/http_client.dart';
import 'package:get_it/get_it.dart';

abstract interface class AuthenticationAPI {
  Future<JoinOrLoginResponse> joinOrLogin(final JoinOrLoginRequest request);
}

final class AuthenticationAPIImpl implements AuthenticationAPI {
  static const String _apiUrl = 'user';

  final HttpClient _httpClient;

  const AuthenticationAPIImpl(this._httpClient);

  static AuthenticationAPIImpl create() {
    final GetIt getIt = GetIt.instance;
    return getIt.get<HttpClient>(type: HttpClient).let(
        (final HttpClient httpClient) => AuthenticationAPIImpl(httpClient));
  }

  @override
  Future<JoinOrLoginResponse> joinOrLogin(
      final JoinOrLoginRequest request) async {
    final HTTPResponse response =
        await _httpClient.post(HTTPRequest<JoinOrLoginRequest>(
      url: '$_apiUrl/join_or_login',
      body: request,
    ));

    return JoinOrLoginResponse.fromJson(response.json ?? {});
  }
}
