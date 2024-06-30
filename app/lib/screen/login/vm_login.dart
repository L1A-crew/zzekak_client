//
// zzekak_client all rights reserved
//
// @author WongueShin
// @email won7963kr@gmail.com
// @since 2024-04-16
//

import 'package:core/model/auth_token/auth_token.dart';
import 'package:core/model/user/user_model.dart';
import 'package:core/repository/token_provider/token_provider.dart';
import 'package:data/api/auth_api/auth_api.dart';
import 'package:data/api/auth_api/request/join_or_login_request.dart';
import 'package:data/api/auth_api/response/join_or_login_response.dart';
import 'package:get_it/get_it.dart';
import 'package:zzekak/mixin/login.dart';

final class LoginViewModel with CertificationUsecase {
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

  Future<
      ({
        AuthenticationInfo authenticationInfo,
        bool isFirstLogin,
      })> whenLoginBtnTapped(final SocialLoginEvent event) async {
    final ThirdPartyAuthToken token = await socialLogin(event: event);

    final JoinOrLoginResponse res =
        await _authenticationAPI.joinOrLogin(JoinOrLoginRequest(
      token: token.oAuthToken,
      provider: switch (token) {
        KakakoTalkAuthToken() => AuthProvider.kakao,
        AppleAuthToken() => AuthProvider.apple,
      },
    ));

    final AuthenticationInfo authInfo = AuthenticationInfo(
      res.tokenContent.accessToken,
      res.tokenContent.refreshToken,
    );

    await _tokenProvider.save(authInfo);

    return (
      authenticationInfo: authInfo,
      isFirstLogin: res.isFirstLogin,
    );
  }
}
