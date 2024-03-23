//
// zzekak_client all rights reserved
//
// @author WongueShin
// @email won7963kr@gmail.com
// @since 2024-02-25
//

import 'package:core/model/auth_token/auth_token.dart';
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:data/io/json_serializable.dart' as serializable;

part 'join_or_login_response.g.dart';

@JsonSerializable()
final class JoinOrLoginResponse extends Equatable
    implements serializable.JsonSerializable {
  @JsonKey(name: 'accessToken')
  final String accessToken;
  @JsonKey(name: 'refreshToken')
  final String refreshToken;

  const JoinOrLoginResponse({
    required this.accessToken,
    required this.refreshToken,
  });

  factory JoinOrLoginResponse.fromJson(Map<String, dynamic> json) =>
      _$JoinOrLoginResponseFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$JoinOrLoginResponseToJson(this);

  @override
  serializable.JsonSerializable fromJson(Map<String, dynamic> json) =>
      JoinOrLoginResponse.fromJson(json);

  @override
  List<Object> get props => [accessToken, refreshToken];

  @override
  bool get stringify => true;
}

extension JoinOrLoginResponseExtension on JoinOrLoginResponse {
  FirstPartyAuthToken toFirstPartyAuthToken() => FirstPartyAuthToken(
        accessToken: accessToken,
        refreshToken: refreshToken,
      );
}
