import 'package:json_annotation/json_annotation.dart';

part 'sign_up_request.g.dart';

@JsonSerializable()
class SignUpRequest {
  @JsonKey(name: 'login')
  final String login;
  @JsonKey(name: 'password')
  final String password;

  const SignUpRequest(
    this.login,
    this.password,
  );

  factory SignUpRequest.fromJson(final Map<String, dynamic> json) {
    return _$SignUpRequestFromJson(json);
  }

  Map<String, dynamic> toJson() => _$SignUpRequestToJson(this);
}
