// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'execution_req.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ExecutionReq _$ExecutionReqFromJson(Map<String, dynamic> json) {
  return ExecutionReq(
    width: json['width'] as String?,
    length: json['length'] as String?,
    cost: json['cost'] as String?,
    executor: json['executor'] as String?,
    executorContact: json['executor_contact'] as String?,
    startAt: json['start_at'] as String?,
    endAt: json['end_at'] as String?,
    supervisor: json['supervisor'] as String?,
    problem: json['problem'] as String?,
    images:
        (json['images'] as List<dynamic>?)?.map((e) => e as String).toList(),
  );
}

Map<String, dynamic> _$ExecutionReqToJson(ExecutionReq instance) =>
    <String, dynamic>{
      'width': instance.width,
      'length': instance.length,
      'cost': instance.cost,
      'executor': instance.executor,
      'executor_contact': instance.executorContact,
      'start_at': instance.startAt,
      'end_at': instance.endAt,
      'supervisor': instance.supervisor,
      'problem': instance.problem,
      'images': instance.images,
    };
