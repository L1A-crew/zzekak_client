// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'join_or_login_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

JoinOrLoginResponse _$JoinOrLoginResponseFromJson(Map<String, dynamic> json) =>
    JoinOrLoginResponse(
      accessToken: json['accessToken'] as String,
      refreshToken: json['refreshToken'] as String,
    );

Map<String, dynamic> _$JoinOrLoginResponseToJson(
        JoinOrLoginResponse instance) =>
    <String, dynamic>{
      'accessToken': instance.accessToken,
      'refreshToken': instance.refreshToken,
    };
