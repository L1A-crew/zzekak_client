import 'package:data/io/json_serializable.dart' as serializable;
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'user_update_request.g.dart';

@JsonSerializable(explicitToJson: true)
final class UserUpdateRequest extends Equatable
    implements serializable.ZzekakJsonSerializable {
  @JsonKey(required: true)
  final String name;
  @JsonKey(required: true)
  final bool marketing_consent;
  @JsonKey(required: true)
  final bool location_consent;
  @JsonKey(required: true)
  final bool push_notification_consent;
  @JsonKey(required: true)
  final String fcm_key;

  const UserUpdateRequest({
    required this.name,
    required this.marketing_consent,
    required this.location_consent,
    required this.push_notification_consent,
    required this.fcm_key,
  });

  factory UserUpdateRequest.fromJson(Map<String, dynamic> json) =>
      _$UserUpdateRequestFromJson(json);

  Map<String, dynamic> toJson() => _$UserUpdateRequestToJson(this);

  @override
  List<Object?> get props => [
        name,
        marketing_consent,
        location_consent,
        push_notification_consent,
        fcm_key,
      ];

  @override
  serializable.ZzekakJsonSerializable fromJson(Map<String, dynamic> json) =>
      UserUpdateRequest.fromJson(json);
}
