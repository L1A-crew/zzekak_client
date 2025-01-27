import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'AgreementContentDTO.g.dart';

@JsonSerializable(explicitToJson: true)
final class AgreementContentDTO extends Equatable {
  @JsonKey(name: 'marketing_consent')
  final DateTime? marketing_consent;
  @JsonKey(name: 'location_consent')
  final DateTime? location_consent;
  @JsonKey(name: 'push_notification_consent')
  final DateTime? push_notification_consent;

  const AgreementContentDTO({
    this.marketing_consent,
    this.location_consent,
    this.push_notification_consent,
  });

  @override
  List<Object?> get props => [
        marketing_consent,
        location_consent,
        push_notification_consent,
      ];

  factory AgreementContentDTO.fromJson(Map<String, dynamic> json) =>
      _$AgreementContentDTOFromJson(json);

  Map<String, dynamic> toJson() => _$AgreementContentDTOToJson(this);
}
