// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'execution.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Execution _$ExecutionFromJson(Map<String, dynamic> json) {
  return Execution(
    roadWidth: (json['road_width'] as num?)?.toDouble(),
    roadLength: (json['road_length'] as num?)?.toDouble(),
    cost: (json['cost'] as num?)?.toDouble(),
    executor: json['executor'] as String?,
    executorContact: json['executor_contact'] as String?,
    startAt: json['start_at'] as String?,
    endAt: json['end_at'] as String?,
    supervisor: json['supervisor'] as String?,
    images:
        (json['images'] as List<dynamic>?)?.map((e) => e as String).toList(),
  );
}

Map<String, dynamic> _$ExecutionToJson(Execution instance) => <String, dynamic>{
      'road_width': instance.roadWidth,
      'road_length': instance.roadLength,
      'cost': instance.cost,
      'executor': instance.executor,
      'executor_contact': instance.executorContact,
      'start_at': instance.startAt,
      'end_at': instance.endAt,
      'supervisor': instance.supervisor,
      'images': instance.images,
    };
