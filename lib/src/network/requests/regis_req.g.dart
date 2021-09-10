// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'regis_req.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RegisReq _$RegisReqFromJson(Map<String, dynamic> json) {
  return RegisReq(
    email: json['email'] as String?,
    username: json['username'] as String?,
    password: json['password'] as String?,
  );
}

Map<String, dynamic> _$RegisReqToJson(RegisReq instance) => <String, dynamic>{
      'email': instance.email,
      'username': instance.username,
      'password': instance.password,
    };
