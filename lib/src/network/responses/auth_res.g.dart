// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_res.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AuthRes _$AuthResFromJson(Map<String, dynamic> json) {
  return AuthRes(
    json['token_type'] as String?,
    (json['expires_in'] as num?)?.toDouble(),
    json['access_token'] as String?,
    json['refresh_token'] as String?,
  );
}

Map<String, dynamic> _$AuthResToJson(AuthRes instance) => <String, dynamic>{
      'token_type': instance.tokenType,
      'expires_in': instance.expiresIn,
      'access_token': instance.accessToken,
      'refresh_token': instance.refreshToken,
    };
