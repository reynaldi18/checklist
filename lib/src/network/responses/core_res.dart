import 'package:json_annotation/json_annotation.dart';
import 'package:si_jaja/src/models/time.dart';

part 'core_res.g.dart';

@JsonSerializable(genericArgumentFactories: true)
class CoreRes<T> {
  @JsonKey(name: 'success')
  bool? success;
  @JsonKey(name: 'message')
  String? message;
  @JsonKey(name: 'data')
  T? data;
  @JsonKey(name: 'time')
  Time? time;

  CoreRes({
    this.success,
    this.message,
    this.data,
    this.time,
  });

  factory CoreRes.fromJson(
          Map<String, dynamic> json, T Function(Object? json) fromJsonT) =>
      _$CoreResFromJson(json, fromJsonT);

  Map<String, dynamic> toJson(Object? Function(T value) toJsonT) =>
      _$CoreResToJson(this, toJsonT);
}
