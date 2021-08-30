// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dashboard.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Dashboard _$DashboardFromJson(Map<String, dynamic> json) {
  return Dashboard(
    budget: json['budget'] as String?,
    cost: json['cost'] as String?,
    planning: json['planning'] as int?,
    ongoing: json['ongoing'] as int?,
  );
}

Map<String, dynamic> _$DashboardToJson(Dashboard instance) => <String, dynamic>{
      'budget': instance.budget,
      'cost': instance.cost,
      'planning': instance.planning,
      'ongoing': instance.ongoing,
    };
