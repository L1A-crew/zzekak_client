//
// zzekak_client all rights reserved
//
// @author WongueShin
// @email won7963kr@gmail.com
// @since 2024-04-16
//

import 'package:core/model/user/user_model.dart';
import 'package:core/repository/user_repository/user_repository.dart';
import 'package:data/api/auth_api/auth_api.dart';
import 'package:data/api/auth_api/request/join_or_login_request.dart';
import 'package:data/api/auth_api/response/join_or_login_response.dart';
import 'package:get_it/get_it.dart';
import 'package:kakao_flutter_sdk/kakao_flutter_sdk.dart';

final class LoginViewModel {
  final TokenProvider _tokenProvider;
  final AuthenticationAPI _authenticationAPI;

  LoginViewModel({required final GetIt getIt})
      : _tokenProvider = getIt.get<TokenProvider>(),
        _authenticationAPI = getIt.get<AuthenticationAPI>();

  Future<void> tryGetMyInfo() async {
    try {
      await _tokenProvider.findMe();
    } catch (e) {
      rethrow;
    }
  }

  Future<AuthenticationInfo> login() async {
    final OAuthToken kakaoOauthToken = await ((await isKakaoTalkInstalled())
        ? UserApi.instance.loginWithKakaoTalk()
        : UserApi.instance.loginWithKakaoAccount());

    final JoinOrLoginResponse res =
        await _authenticationAPI.joinOrLogin(JoinOrLoginRequest(
      token: kakaoOauthToken.idToken ?? '',
      provider: AuthProvider.kakao,
    ));

    final AuthenticationInfo authInfo = AuthenticationInfo(
      res.accessToken,
      res.refreshToken,
    );

    await _tokenProvider.save(authInfo);

    return authInfo;
  }
}
