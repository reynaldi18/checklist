import 'package:json_annotation/json_annotation.dart';

part 'regis_req.g.dart';

@JsonSerializable()
class RegisReq {
  @JsonKey(name: 'email')
  String? email;
  @JsonKey(name: 'username')
  String? username;
  @JsonKey(name: 'password')
  String? password;


  RegisReq({
    this.email,
    this.username,
    this.password,
  });

  factory RegisReq.fromJson(Map<String, dynamic> json) => _$RegisReqFromJson(json);

  Map<String, dynamic> toJson() => _$RegisReqToJson(this);
}
