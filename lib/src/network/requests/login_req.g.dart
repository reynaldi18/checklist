// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_req.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LoginReq _$LoginReqFromJson(Map<String, dynamic> json) {
  return LoginReq(
    username: json['username'] as String?,
    password: json['password'] as String?,
    grantType: json['grant_type'] as String?,
    clientId: json['client_id'] as int?,
    clientSecret: json['client_secret'] as String?,
  );
}

Map<String, dynamic> _$LoginReqToJson(LoginReq instance) => <String, dynamic>{
      'username': instance.username,
      'password': instance.password,
      'grant_type': instance.grantType,
      'client_id': instance.clientId,
      'client_secret': instance.clientSecret,
    };
