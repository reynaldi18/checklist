import 'package:json_annotation/json_annotation.dart';

part 'dashboard.g.dart';

@JsonSerializable()
class Dashboard {
  @JsonKey(name: 'budget')
  String? budget;
  @JsonKey(name: 'cost')
  String? cost;
  @JsonKey(name: 'planning')
  int? planning;
  @JsonKey(name: 'ongoing')
  int? ongoing;

  Dashboard({
    this.budget,
    this.cost,
    this.planning,
    this.ongoing,
  });

  factory Dashboard.fromJson(Map<String, dynamic> json) =>
      _$DashboardFromJson(json);

  Map<String, dynamic> toJson() => _$DashboardToJson(this);
}
