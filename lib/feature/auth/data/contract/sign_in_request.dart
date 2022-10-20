import 'package:json_annotation/json_annotation.dart';

part 'sign_in_request.g.dart';

@JsonSerializable()
class SignInRequest {
  final String login;
  final String password;

  const SignInRequest(
      this.login,
      this.password,
      );

  factory SignInRequest.fromJson(final Map<String, dynamic> json) {
    return _$SignInRequestFromJson(json);
  }

  Map<String, dynamic> toJson() => _$SignInRequestToJson(this);
}
