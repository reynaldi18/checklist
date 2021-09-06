import 'package:json_annotation/json_annotation.dart';

part 'id.g.dart';

@JsonSerializable()
class Id {
  @JsonKey(name: 'id')
  int? id;

  Id({
    this.id
  });

  factory Id.fromJson(Map<String, dynamic> json) => _$IdFromJson(json);

  Map<String, dynamic> toJson() => _$IdToJson(this);
}
