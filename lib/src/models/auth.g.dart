// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Auth _$AuthFromJson(Map<String, dynamic> json) {
  return Auth(
    tokenType: json['token_type'] as String?,
    expiresIn: (json['expires_in'] as num?)?.toDouble(),
    accessToken: json['access_token'] as String?,
    refreshToken: json['refresh_token'] as String?,
    error: json['error'] as String?,
    errorDescription: json['error_description'] as String?,
    message: json['message'] as String?,
  );
}

Map<String, dynamic> _$AuthToJson(Auth instance) => <String, dynamic>{
      'token_type': instance.tokenType,
      'expires_in': instance.expiresIn,
      'access_token': instance.accessToken,
      'refresh_token': instance.refreshToken,
      'error': instance.error,
      'error_description': instance.errorDescription,
      'message': instance.message,
    };
