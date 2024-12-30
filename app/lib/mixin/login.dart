//
// zzekak_client all rights reserved
//
// @author WongueShin
// @email won7963kr@gmail.com
// @since 2024-05-18
//

import 'package:core/model/auth_token/auth_token.dart';
import 'package:dart_scope_functions/dart_scope_functions.dart';
import 'package:flutter/foundation.dart';
import 'package:kakao_flutter_sdk/kakao_flutter_sdk.dart' as kakao_sdk;
import 'package:logger/logger.dart';
import 'package:sign_in_with_apple/sign_in_with_apple.dart' as apple_sdk;

sealed class SocialLoginEvent {}

final class KakaoLoginEvent extends SocialLoginEvent {}

final class AppleLoginEvent extends SocialLoginEvent {}

mixin CertificationUsecase {
  @protected
  Future<ThirdPartyAuthToken> socialLogin(
      {required final SocialLoginEvent event}) async {
    switch (event) {
      case KakaoLoginEvent():
        return _loginWithKakao(event);
      case AppleLoginEvent():
        return _loginWithApple(event);
    }
  }

  Future<KakaoTalkAuthToken> _loginWithKakao(
      final KakaoLoginEvent kakaoLoginEvent) async {
    if (await kakao_sdk.isKakaoTalkInstalled()) {
      final kakao_sdk.OAuthToken token =
          await kakao_sdk.UserApi.instance.loginWithKakaoTalk();

      return token.let(
          (final kakao_sdk.OAuthToken kakaoOAuthToken) => KakaoTalkAuthToken(
                oAuthToken: kakaoOAuthToken.idToken ?? '',
                accessToken: kakaoOAuthToken.accessToken,
                refreshToken: kakaoOAuthToken.refreshToken ?? '',
              ));
    } else {
      return (await kakao_sdk.UserApi.instance.loginWithKakaoAccount()).let(
          (final kakao_sdk.OAuthToken kakaoOAuthToken) => KakaoTalkAuthToken(
                oAuthToken: kakaoOAuthToken.idToken ?? '',
                accessToken: kakaoOAuthToken.accessToken,
                refreshToken: kakaoOAuthToken.refreshToken ?? '',
              ));
    }
  }

  Future<AppleAuthToken> _loginWithApple(final AppleLoginEvent event) async {
    if (await apple_sdk.SignInWithApple.isAvailable()) {
      return (await apple_sdk.SignInWithApple.getAppleIDCredential(scopes: []))
          .let((final apple_sdk.AuthorizationCredentialAppleID it) =>
              AppleAuthToken(oAuthToken: it.identityToken ?? ''));
    } else {
      Logger().e('Apple Login is not available');
      throw Exception('Apple Login is not available');
    }
  }
}
