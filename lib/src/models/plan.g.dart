// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'plan.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Plan _$PlanFromJson(Map<String, dynamic> json) {
  return Plan(
    id: json['id'] as int?,
    name: json['name'] as String?,
    address: json['address'] as String?,
    status: json['status'] as String?,
    roadWidth: (json['road_width'] as num?)?.toDouble(),
    roadLength: (json['road_length'] as num?)?.toDouble(),
    budget: json['budget'] as String?,
    execution: json['execution'] == null
        ? null
        : Execution.fromJson(json['execution'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$PlanToJson(Plan instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'address': instance.address,
      'status': instance.status,
      'road_width': instance.roadWidth,
      'road_length': instance.roadLength,
      'budget': instance.budget,
      'execution': instance.execution,
    };
