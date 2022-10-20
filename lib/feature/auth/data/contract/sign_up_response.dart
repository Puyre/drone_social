import 'package:json_annotation/json_annotation.dart';

part 'sign_up_response.g.dart';

@JsonSerializable()
class SignUpResponse {
  @JsonKey(name: 'token')
  final String token;

  const SignUpResponse(this.token);


  factory SignUpResponse.fromJson(final Map<String, dynamic> json) {
    return _$SignUpResponseFromJson(json);
  }

  Map<String, dynamic> toJson() => _$SignUpResponseToJson(this);
}
