import 'package:json_annotation/json_annotation.dart';

part 'time.g.dart';

@JsonSerializable()
class Time {
  @JsonKey(name: 'date')
  String? date;
  @JsonKey(name: 'timezone_type')
  int? timezoneType;
  @JsonKey(name: 'timezone')
  String? timezone;


  Time({
    this.date,
    this.timezoneType,
    this.timezone,
  });

  factory Time.fromJson(Map<String, dynamic> json) =>
      _$TimeFromJson(json);

  Map<String, dynamic> toJson() => _$TimeToJson(this);
}
