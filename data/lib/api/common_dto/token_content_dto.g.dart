// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'token_content_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TokenContentDTO _$TokenContentDTOFromJson(Map<String, dynamic> json) =>
    TokenContentDTO(
      accessToken: json['access_token'] as String,
      refreshToken: json['refresh_token'] as String,
    );

Map<String, dynamic> _$TokenContentDTOToJson(TokenContentDTO instance) =>
    <String, dynamic>{
      'access_token': instance.accessToken,
      'refresh_token': instance.refreshToken,
    };
