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
    width: (json['width'] as num?)?.toDouble(),
    length: (json['length'] as num?)?.toDouble(),
    budget: (json['budget'] as num?)?.toDouble(),
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
      'width': instance.width,
      'length': instance.length,
      'budget': instance.budget,
      'execution': instance.execution,
    };
