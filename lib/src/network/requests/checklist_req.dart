import 'package:json_annotation/json_annotation.dart';

part 'checklist_req.g.dart';

@JsonSerializable()
class ChecklistReq {
  @JsonKey(name: 'name')
  String? name;


  ChecklistReq({
    this.name,
  });

  factory ChecklistReq.fromJson(Map<String, dynamic> json) => _$ChecklistReqFromJson(json);

  Map<String, dynamic> toJson() => _$ChecklistReqToJson(this);
}
