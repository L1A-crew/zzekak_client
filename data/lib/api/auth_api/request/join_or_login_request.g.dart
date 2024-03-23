// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'join_or_login_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

JoinOrLoginRequest _$JoinOrLoginRequestFromJson(Map<String, dynamic> json) =>
    JoinOrLoginRequest(
      token: json['token'] as String,
      provider: $enumDecode(_$AuthProviderEnumMap, json['provider']),
    );

Map<String, dynamic> _$JoinOrLoginRequestToJson(JoinOrLoginRequest instance) =>
    <String, dynamic>{
      'token': instance.token,
      'provider': _$AuthProviderEnumMap[instance.provider]!,
    };

const _$AuthProviderEnumMap = {
  AuthProvider.kakao: 'ka',
  AuthProvider.apple: 'ap',
};
