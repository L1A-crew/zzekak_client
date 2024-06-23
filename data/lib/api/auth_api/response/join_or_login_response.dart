//
// zzekak_client all rights reserved
//
// @author WongueShin
// @email won7963kr@gmail.com
// @since 2024-02-25
//

import 'package:core/model/auth_token/auth_token.dart';
import 'package:data/api/common_dto/token_content_dto.dart';
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:data/io/json_serializable.dart';

part 'join_or_login_response.g.dart';

@JsonSerializable()
final class JoinOrLoginResponse extends Equatable
    implements ZzekakJsonSerializable {
  @JsonKey(name: 'token_content')
  final TokenContentDTO tokenContent;
  @JsonKey(name: 'is_login_first', defaultValue: false)
  final bool isFirstLogin;

  const JoinOrLoginResponse({
    required this.tokenContent,
    required this.isFirstLogin,
  });

  factory JoinOrLoginResponse.fromJson(Map<String, dynamic> json) =>
      _$JoinOrLoginResponseFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$JoinOrLoginResponseToJson(this);

  @override
  ZzekakJsonSerializable fromJson(Map<String, dynamic> json) =>
      JoinOrLoginResponse.fromJson(json);

  @override
  List<Object> get props => [tokenContent, isFirstLogin];

  @override
  bool get stringify => true;
}

extension JoinOrLoginResponseExtension on JoinOrLoginResponse {
  FirstPartyAuthToken toFirstPartyAuthToken() => FirstPartyAuthToken(
        accessToken: tokenContent.accessToken,
        refreshToken: tokenContent.refreshToken,
      );
}
