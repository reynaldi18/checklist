// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'core_res.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CoreRes<T> _$CoreResFromJson<T>(
  Map<String, dynamic> json,
  T Function(Object? json) fromJsonT,
) {
  return CoreRes<T>(
    success: json['success'] as bool?,
    message: json['message'] as String?,
    data: _$nullableGenericFromJson(json['data'], fromJsonT),
    time: json['time'] == null
        ? null
        : Time.fromJson(json['time'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$CoreResToJson<T>(
  CoreRes<T> instance,
  Object? Function(T value) toJsonT,
) =>
    <String, dynamic>{
      'success': instance.success,
      'message': instance.message,
      'data': _$nullableGenericToJson(instance.data, toJsonT),
      'time': instance.time,
    };

T? _$nullableGenericFromJson<T>(
  Object? input,
  T Function(Object? json) fromJson,
) =>
    input == null ? null : fromJson(input);

Object? _$nullableGenericToJson<T>(
  T? input,
  Object? Function(T value) toJson,
) =>
    input == null ? null : toJson(input);
