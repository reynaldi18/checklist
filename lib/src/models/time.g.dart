// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'time.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Time _$TimeFromJson(Map<String, dynamic> json) {
  return Time(
    date: json['date'] as String?,
    timezoneType: json['timezone_type'] as int?,
    timezone: json['timezone'] as String?,
  );
}

Map<String, dynamic> _$TimeToJson(Time instance) => <String, dynamic>{
      'date': instance.date,
      'timezone_type': instance.timezoneType,
      'timezone': instance.timezone,
    };
