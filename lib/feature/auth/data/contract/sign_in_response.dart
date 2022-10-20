import 'package:freezed_annotation/freezed_annotation.dart';
part 'sign_in_response.g.dart';

@JsonSerializable()
class SignInResponse {
  final String token;

  const SignInResponse(this.token);

  factory SignInResponse.fromJson(final Map<String, dynamic> json) {
    return _$SignInResponseFromJson(json);
  }

  Map<String, dynamic> toJson() => _$SignInResponseToJson(this);
}
