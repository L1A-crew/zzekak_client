// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'join_or_login_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

JoinOrLoginResponse _$JoinOrLoginResponseFromJson(Map<String, dynamic> json) =>
    JoinOrLoginResponse(
      tokenContent: TokenContentDTO.fromJson(
          json['token_content'] as Map<String, dynamic>),
      isFirstLogin: json['is_login_first'] as bool? ?? false,
    );

Map<String, dynamic> _$JoinOrLoginResponseToJson(
        JoinOrLoginResponse instance) =>
    <String, dynamic>{
      'token_content': instance.tokenContent,
      'is_login_first': instance.isFirstLogin,
    };
