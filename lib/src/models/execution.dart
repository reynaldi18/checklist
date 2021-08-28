import 'package:json_annotation/json_annotation.dart';

part 'execution.g.dart';

@JsonSerializable()
class Execution {
  @JsonKey(name: 'road_width')
  double? roadWidth;
  @JsonKey(name: 'road_length')
  double? roadLength;
  @JsonKey(name: 'cost')
  double? cost;
  @JsonKey(name: 'executor')
  String? executor;
  @JsonKey(name: 'executor_contact')
  String? executorContact;
  @JsonKey(name: 'start_at')
  String? startAt;
  @JsonKey(name: 'end_at')
  String? endAt;
  @JsonKey(name: 'supervisor')
  String? supervisor;
  @JsonKey(name: 'images')
  List<String>? images;


  Execution({
    this.roadWidth,
    this.roadLength,
    this.cost,
    this.executor,
    this.executorContact,
    this.startAt,
    this.endAt,
    this.supervisor,
    this.images,
  });

  factory Execution.fromJson(Map<String, dynamic> json) => _$ExecutionFromJson(json);

  Map<String, dynamic> toJson() => _$ExecutionToJson(this);
}
