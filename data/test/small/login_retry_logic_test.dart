//
// zzekak_client all rights reserved
//
// @author WongueShin
// @email won7963kr@gmail.com
// @since 2024-03-16
//

import 'dart:math';

import 'package:data/api/auth_api/auth_api.dart';
import 'package:data/api/auth_api/request/join_or_login_request.dart';
import 'package:data/api/auth_api/response/join_or_login_response.dart';
import 'package:data/api/common_dto/token_content_dto.dart';
import 'package:data/io/http_client.dart';
import 'package:faker/faker.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../@mock/http_client/mock_httpcient_generator.mocks.dart';

void main() async {
  group("클라이언트는 인증 인가 관리를 할 수 있다.", () {
    final HttpClient httpClient = MockHttpClient();
    test("유저는 회원 가입을 진행 할 수 있다.", () async {
      final (AuthProvider, String) randToken = genRandToken();

      AuthenticationAPI sut = AuthenticationAPIImpl(httpClient);
      final String expectedAccess = Faker().randomGenerator.string(15);
      final String expectedRefresh = Faker().randomGenerator.string(15);

      provideDummy(HTTPResponse(json: {
        "token_content": {
          "access_token": expectedAccess,
          "refresh_token": expectedRefresh,
        },
        "is_login_first": true
      }));

      final JoinOrLoginResponse res = await sut.joinOrLogin(
          JoinOrLoginRequest(token: randToken.$2, provider: randToken.$1));

      expect(
          res,
          equals(JoinOrLoginResponse(
            tokenContent: TokenContentDTO(
              accessToken: expectedAccess,
              refreshToken: expectedRefresh,
            ),
            isFirstLogin: true,
          )));
    });
  });
}

(AuthProvider, String) genRandToken() => (
      AuthProvider.values[Random().nextInt(AuthProvider.values.length)],
      Faker().randomGenerator.string(15)
    );
