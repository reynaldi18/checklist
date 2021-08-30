import 'package:json_annotation/json_annotation.dart';

part 'auth.g.dart';

@JsonSerializable()
class Auth {
  @JsonKey(name: 'token_type')
  String? tokenType;
  @JsonKey(name: 'expires_in')
  double? expiresIn;
  @JsonKey(name: 'access_token')
  String? accessToken;
  @JsonKey(name: 'refresh_token')
  String? refreshToken;
  @JsonKey(name: 'error')
  String? error;
  @JsonKey(name: 'error_description')
  String? errorDescription;
  @JsonKey(name: 'message')
  String? message;


  Auth({
    this.tokenType,
    this.expiresIn,
    this.accessToken,
    this.refreshToken,
    this.error,
    this.errorDescription,
    this.message,
  });

  factory Auth.fromJson(Map<String, dynamic> json) =>
      _$AuthFromJson(json);

  Map<String, dynamic> toJson() => _$AuthToJson(this);
}
