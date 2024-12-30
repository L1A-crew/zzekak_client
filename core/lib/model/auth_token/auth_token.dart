//
// zzekak_client all rights reserved
//
// @author WongueShin
// @email won7963kr@gmail.com
// @since 2024-02-24
//

import 'package:equatable/equatable.dart';

/// 애플리케이션 내에서 발급받은 O-Auth 토큰
final class FirstPartyAuthToken extends Equatable {
  final String accessToken;
  final String refreshToken;

  const FirstPartyAuthToken({
    required this.accessToken,
    required this.refreshToken,
  });

  @override
  List<Object> get props => [accessToken, refreshToken];

  @override
  bool get stringify => true;
}

/// 애플리케이션 외에서 발급받은 O-Auth 토큰
sealed class ThirdPartyAuthToken extends Equatable {
  final String oAuthToken;

  const ThirdPartyAuthToken({
    required this.oAuthToken,
  });
}

/// 카카오톡 로그인을 통해 발급받은 O-Auth 토큰
final class KakaoTalkAuthToken extends ThirdPartyAuthToken {
  final String accessToken;
  final String refreshToken;

  const KakaoTalkAuthToken({
    required super.oAuthToken,
    required this.accessToken,
    required this.refreshToken,
  });

  @override
  List<Object> get props => [oAuthToken, accessToken, refreshToken];

  @override
  bool get stringify => true;
}

/// 애플 로그인을 통해 발급받은 O-Auth 토큰
final class AppleAuthToken extends ThirdPartyAuthToken {
  const AppleAuthToken({
    required super.oAuthToken,
  });

  @override
  List<Object> get props => [oAuthToken];

  @override
  bool get stringify => true;
}
