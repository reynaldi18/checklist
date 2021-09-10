// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'checklist.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Checklist _$ChecklistFromJson(Map<String, dynamic> json) {
  return Checklist(
    id: json['id'] as int?,
  )
    ..name = json['name'] as String?
    ..items = json['items'] as String?
    ..checklistCompletionStatus = json['checklistCompletionStatus'] as bool?;
}

Map<String, dynamic> _$ChecklistToJson(Checklist instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'items': instance.items,
      'checklistCompletionStatus': instance.checklistCompletionStatus,
    };
