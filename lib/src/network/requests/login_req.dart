import 'package:json_annotation/json_annotation.dart';

part 'login_req.g.dart';

@JsonSerializable()
class LoginReq {
  @JsonKey(name: 'username')
  String? username;
  @JsonKey(name: 'password')
  String? password;
  @JsonKey(name: 'grant_type')
  String? grantType;
  @JsonKey(name: 'client_id')
  int? clientId;
  @JsonKey(name: 'client_secret')
  String? clientSecret;


  LoginReq({
    this.username,
    this.password,
    this.grantType,
    this.clientId,
    this.clientSecret,
  });

  factory LoginReq.fromJson(Map<String, dynamic> json) => _$LoginReqFromJson(json);

  Map<String, dynamic> toJson() => _$LoginReqToJson(this);
}
