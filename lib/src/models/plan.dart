import 'package:json_annotation/json_annotation.dart';
import 'package:si_jaja/src/models/execution.dart';

part 'plan.g.dart';

@JsonSerializable()
class Plan {
  @JsonKey(name: 'id')
  int? id;
  @JsonKey(name: 'name')
  String? name;
  @JsonKey(name: 'address')
  String? address;
  @JsonKey(name: 'status')
  String? status;
  @JsonKey(name: 'road_width')
  double? roadWidth;
  @JsonKey(name: 'road_length')
  double? roadLength;
  @JsonKey(name: 'budget')
  double? budget;
  @JsonKey(name: 'execution')
  Execution? execution;


  Plan({
    this.id,
    this.name,
    this.address,
    this.status,
    this.roadWidth,
    this.roadLength,
    this.budget,
    this.execution,
  });

  factory Plan.fromJson(Map<String, dynamic> json) => _$PlanFromJson(json);

  Map<String, dynamic> toJson() => _$PlanToJson(this);
}
