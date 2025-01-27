//
// zzekak_client all rights reserved
//
// @author WongueShin
// @email won7963kr@gmail.com
// @since 2024-02-24
//

import 'package:dart_scope_functions/dart_scope_functions.dart';
import 'package:data/api/auth_api/request/user_update_request.dart';
import 'package:data/api/auth_api/response/join_or_login_response.dart';
import 'package:data/api/auth_api/request/join_or_login_request.dart';
import 'package:data/api/common_dto/user_response.dart';
import 'package:data/io/http_client.dart';
import 'package:get_it/get_it.dart';
import 'package:logger/logger.dart';

abstract interface class UserAPI {
  Future<JoinOrLoginResponse> joinOrLogin(final JoinOrLoginRequest request);

  Future<void> withdraw();

  Future<UserResponse> update(final UserUpdateRequest request);
}

final class UserAPIImpl implements UserAPI {
  static const String _apiUrl = 'user';

  final HttpClient _httpClient;

  const UserAPIImpl(this._httpClient);

  static UserAPIImpl create() {
    final GetIt getIt = GetIt.instance;
    return getIt
        .get<HttpClient>(type: HttpClient)
        .let((final HttpClient httpClient) => UserAPIImpl(httpClient));
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

  @override
  Future<void> withdraw() async {
    _httpClient.put(
      HTTPRequest(url: "$_apiUrl/withdrawal"),
    );
  }

  @override
  Future<UserResponse> update(final UserUpdateRequest request) async {
    try {
      return _httpClient
          .post(HTTPRequest<UserUpdateRequest>(
              url: "$_apiUrl/update", body: request))
          .then((response) => UserResponse.fromJson(response.json!));
    } catch (e, s) {
      Logger().e("Failed to update user\n$e\n$s");
      rethrow;
    }
  }
}
