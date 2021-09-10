import 'package:json_annotation/json_annotation.dart';

part 'core_res.g.dart';

@JsonSerializable(genericArgumentFactories: true)
class CoreRes<T> {
  @JsonKey(name: 'statusCode')
  int? statusCode;
  @JsonKey(name: 'message')
  String? message;
  @JsonKey(name: 'data')
  T? data;
  @JsonKey(name: 'errorMessage')
  String? errorMessage;

  CoreRes({
    this.statusCode,
    this.message,
    this.data,
    this.errorMessage,
  });

  factory CoreRes.fromJson(
          Map<String, dynamic> json, T Function(Object? json) fromJsonT) =>
      _$CoreResFromJson(json, fromJsonT);

  Map<String, dynamic> toJson(Object? Function(T value) toJsonT) =>
      _$CoreResToJson(this, toJsonT);
}
