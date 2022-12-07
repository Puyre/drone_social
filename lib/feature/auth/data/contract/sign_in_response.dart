import 'package:freezed_annotation/freezed_annotation.dart';

part 'sign_in_response.g.dart';

@JsonSerializable()
class SignInResponse {
  final String accessToken;
  final String refreshToken;

  const SignInResponse(
    this.accessToken,
    this.refreshToken,
  );

  factory SignInResponse.fromJson(final Map<String, dynamic> json) {
    return _$SignInResponseFromJson(json);
  }

  Map<String, dynamic> toJson() => _$SignInResponseToJson(this);
}
