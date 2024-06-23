//
// zzekak_client all rights reserved
//
// @author WongueShin
// @email won7963kr@gmail.com
// @since 2024-06-23
//

import 'package:data/io/json_serializable.dart';
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'token_content_dto.g.dart';

@JsonSerializable()
final class TokenContentDTO extends Equatable
    implements ZzekakJsonSerializable {
  @JsonKey(name: 'access_token')
  final String accessToken;
  @JsonKey(name: 'refresh_token')
  final String refreshToken;

  const TokenContentDTO({
    required this.accessToken,
    required this.refreshToken,
  });

  @override
  Map<String, dynamic> toJson() => _$TokenContentDTOToJson(this);

  factory TokenContentDTO.fromJson(Map<String, dynamic> json) =>
      _$TokenContentDTOFromJson(json);

  @override
  TokenContentDTO fromJson(Map<String, dynamic> json) =>
      TokenContentDTO.fromJson(json);

  @override
  List<Object> get props => [
        accessToken,
        refreshToken,
      ];

  @override
  bool get stringify => true;
}
