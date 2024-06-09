//
// zzekak_client all rights reserved
//
// @author WongueShin
// @email won7963kr@gmail.com
// @since 2024-02-24
//

import 'package:core/model/auth_token/auth_token.dart';
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:data/io/json_serializable.dart' as serializable;

part 'join_or_login_request.g.dart';

@JsonEnum()
enum AuthProvider {
  @JsonValue('ka')
  kakao,
  @JsonValue('ap')
  apple,
}

@JsonSerializable()
final class JoinOrLoginRequest extends Equatable
    implements serializable.JsonSerializable {
  @JsonKey(name: "token")
  final String token;
  @JsonKey(name: "authentication_type")
  final AuthProvider provider;

  const JoinOrLoginRequest({
    required this.token,
    required this.provider,
  });

  factory JoinOrLoginRequest.fromThirdPartyToken(
    final ThirdPartyAuthToken thirdPartyAuthToken,
  ) =>
      JoinOrLoginRequest(
        token: thirdPartyAuthToken.oAuthToken,
        provider: thirdPartyAuthToken.convertToAuthProvider(),
      );

  factory JoinOrLoginRequest.fromJson(Map<String, dynamic> json) =>
      _$JoinOrLoginRequestFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$JoinOrLoginRequestToJson(this);

  @override
  List<Object> get props => [token, provider];

  @override
  bool get stringify => true;

  @override
  serializable.JsonSerializable fromJson(Map<String, dynamic> json) =>
      JoinOrLoginRequest.fromJson(json);
}

extension _ThirdPartyAuthTokenExtension on ThirdPartyAuthToken {
  AuthProvider convertToAuthProvider() => switch (this) {
        KakakoTalkAuthToken() => AuthProvider.kakao,
        AppleAuthToken() => AuthProvider.apple,
      };
}

extension AuthProviderExt on AuthProvider {
  static AuthProvider fromString(final String value) => switch (value) {
        'ka' => AuthProvider.kakao,
        'ap' => AuthProvider.apple,
        String() => throw UnimplementedError(),
      };
}
