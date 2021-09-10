import 'package:json_annotation/json_annotation.dart';

part 'login_req.g.dart';

@JsonSerializable()
class LoginReq {
  @JsonKey(name: 'username')
  String? username;
  @JsonKey(name: 'password')
  String? password;


  LoginReq({
    this.username,
    this.password,
  });

  factory LoginReq.fromJson(Map<String, dynamic> json) => _$LoginReqFromJson(json);

  Map<String, dynamic> toJson() => _$LoginReqToJson(this);
}
