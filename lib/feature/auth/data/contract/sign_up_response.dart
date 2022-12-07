import 'package:json_annotation/json_annotation.dart';

part 'sign_up_response.g.dart';

@JsonSerializable()
class SignUpResponse {
  final String accessToken;
  final String refreshToken;

  const SignUpResponse(
    this.accessToken,
    this.refreshToken,
  );

  factory SignUpResponse.fromJson(final Map<String, dynamic> json) {
    return _$SignUpResponseFromJson(json);
  }

  Map<String, dynamic> toJson() => _$SignUpResponseToJson(this);
}
