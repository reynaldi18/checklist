// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

User _$UserFromJson(Map<String, dynamic> json) {
  return User(
    id: json['id'] as int?,
    name: json['name'] as String?,
    email: json['email'] as String?,
    phone: json['phone'] as String?,
    gender: json['gender'] as String?,
    birthDate: json['birth_date'] as String?,
    token: json['token'] as String?,
  );
}

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'email': instance.email,
      'phone': instance.phone,
      'gender': instance.gender,
      'birth_date': instance.birthDate,
      'token': instance.token,
    };
