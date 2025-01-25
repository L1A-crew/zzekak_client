//
// zzekak_client all rights reserved
//
// @author WongueShin
// @email won7963kr@gmail.com
// @since 2023-12-09
//

import 'package:core/model/auth_token/trd_auth_token.dart';
import 'package:core/model/identifier/identifier.dart';
import 'package:equatable/equatable.dart';

/// 유저의 인증 정보와 발급 기관
final class AuthenticationInfo with Identifier {
  @override
  String get identificationKey => id;
  final String id;
  final ThirdPartyProvider provider;
  final DateTime createdAt;
  final DateTime updatedAt;

  const AuthenticationInfo({
    required this.id,
    required this.provider,
    required this.createdAt,
    required this.updatedAt,
  });
}

/// 유저의 약관 동의 정보
final class AgreementOfTerms extends Equatable {
  final DateTime? isAgreedMarketingConsent;
  final DateTime? isAgreedLocationConsent;
  final DateTime? isAgreedPushNotificationConsent;

  const AgreementOfTerms({
    required this.isAgreedMarketingConsent,
    required this.isAgreedLocationConsent,
    required this.isAgreedPushNotificationConsent,
  });

  @override
  List<Object?> get props => [
        isAgreedMarketingConsent,
        isAgreedLocationConsent,
        isAgreedPushNotificationConsent,
      ];
}

final class User with Identifier {
  @override
  String get identificationKey => id;
  final String id;

  final AuthenticationInfo authenticationInfo;

  final AgreementOfTerms agreementOfTerms;

  final DateTime createdAt;
  final DateTime updatedAt;
  final String? fcmToken;

  const User({
    required this.id,
    required this.authenticationInfo,
    required this.agreementOfTerms,
    required this.createdAt,
    required this.updatedAt,
    required this.fcmToken,
  });
}
