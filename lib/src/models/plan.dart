import 'package:json_annotation/json_annotation.dart';

part 'plan.g.dart';

@JsonSerializable()
class Plan {
  @JsonKey(name: 'id')
  int? id;
  @JsonKey(name: 'name')
  String? name;
  @JsonKey(name: 'address')
  String? address;

  Plan({
    this.id,
    this.name,
    this.address,
  });

  factory Plan.fromJson(Map<String, dynamic> json) => _$PlanFromJson(json);

  Map<String, dynamic> toJson() => _$PlanToJson(this);
}
