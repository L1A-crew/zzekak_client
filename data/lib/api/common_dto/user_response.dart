import 'package:data/api/common_dto/AgreementContentDTO.dart';
import 'package:data/api/common_dto/AuthenticationContentDTO.dart';
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'user_response.g.dart';

@JsonSerializable(explicitToJson: true)
final class UserResponse extends Equatable {
  @JsonKey(name: 'id')
  final String id;
  @JsonKey(name: 'name')
  final String name;
  @JsonKey(name: 'authentication')
  final AuthenticationContentDTO authentication;
  @JsonKey(name: 'agreement')
  final AgreementContentDTO agreement;
  @JsonKey(name: 'created_at')
  final DateTime created_at;
  @JsonKey(name: 'updated_at')
  final DateTime updated_at;
  @JsonKey(name: 'fcm_key')
  final String fcm_key;

  const UserResponse({
    required this.id,
    required this.name,
    required this.authentication,
    required this.agreement,
    required this.created_at,
    required this.updated_at,
    required this.fcm_key,
  });

  factory UserResponse.fromJson(Map<String, dynamic> json) =>
      _$UserResponseFromJson(json);

  Map<String, dynamic> toJson() => _$UserResponseToJson(this);

  @override
  List<Object?> get props => [
        id,
        name,
        authentication,
        agreement,
        created_at,
        updated_at,
        fcm_key,
      ];
}
