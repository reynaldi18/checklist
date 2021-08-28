import 'package:json_annotation/json_annotation.dart';

part 'auth_res.g.dart';

@JsonSerializable()
class AuthRes {
  @JsonKey(name: 'token_type')
  String? tokenType;
  @JsonKey(name: 'expires_in')
  double? expiresIn;
  @JsonKey(name: 'access_token')
  String? accessToken;
  @JsonKey(name: 'refresh_token')
  String? refreshToken;

  AuthRes(
    this.tokenType,
    this.expiresIn,
    this.accessToken,
    this.refreshToken,
  );

  factory AuthRes.fromJson(Map<String, dynamic> json) =>
      _$AuthResFromJson(json);

  Map<String, dynamic> toJson() => _$AuthResToJson(this);
}
