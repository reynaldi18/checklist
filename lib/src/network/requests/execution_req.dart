import 'package:json_annotation/json_annotation.dart';

part 'execution_req.g.dart';

@JsonSerializable()
class ExecutionReq {
  @JsonKey(name: 'width')
  String? width;
  @JsonKey(name: 'length')
  String? length;
  @JsonKey(name: 'cost')
  String? cost;
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

  ExecutionReq({
    this.width,
    this.length,
    this.cost,
    this.executor,
    this.executorContact,
    this.startAt,
    this.endAt,
    this.supervisor,
    this.images,
  });

  factory ExecutionReq.fromJson(Map<String, dynamic> json) =>
      _$ExecutionReqFromJson(json);

  Map<String, dynamic> toJson() => _$ExecutionReqToJson(this);
}
