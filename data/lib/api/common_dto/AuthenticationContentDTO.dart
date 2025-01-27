import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'AuthenticationContentDTO.g.dart';

@JsonSerializable(explicitToJson: true)
final class AuthenticationContentDTO extends Equatable {
  @JsonKey(name: 'id')
  final String id;
  @JsonKey(name: 'type')
  final AuthenticationType type;
  @JsonKey(name: 'created_at')
  final DateTime createdAt;
  @JsonKey(name: 'updated_at')
  final DateTime updatedAt;

  const AuthenticationContentDTO({
    required this.id,
    required this.type,
    required this.createdAt,
    required this.updatedAt,
  });

  factory AuthenticationContentDTO.fromJson(Map<String, dynamic> json) =>
      _$AuthenticationContentDTOFromJson(json);

  Map<String, dynamic> toJson() => _$AuthenticationContentDTOToJson(this);

  @override
  List<Object?> get props => [
        id,
        type,
        createdAt,
        updatedAt,
      ];
}

enum AuthenticationType {
  @JsonValue('ka')
  KAKAO,
  @JsonValue('ap')
  APPLE,
}
