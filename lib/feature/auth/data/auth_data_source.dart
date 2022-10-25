import 'package:drone_assist/extensions/network_extensions.dart';
import 'package:drone_assist/feature/auth/data/api/auth_api.dart';
import 'package:drone_assist/feature/auth/data/contract/sign_in_request.dart';
import 'package:drone_assist/feature/auth/data/contract/sign_in_response.dart';
import 'package:drone_assist/feature/auth/data/contract/sign_up_request.dart';
import 'package:drone_assist/feature/auth/data/contract/sign_up_response.dart';

class AuthDataSource {
  final AuthApi authApi;

  const AuthDataSource({
    required this.authApi,
  });

  Future<SignUpResponse> signup(SignUpRequest signUpRequest) async {
    final response = await authApi.signUp(
      signUpRequest.toJson()
    );
    return response.proceedResponse().body!;
  }

  Future<SignInResponse> signIn(SignInRequest signInRequest) async {
    final response = await authApi.signIn(signInRequest.toJson());
    return response.proceedResponse().body!;
  }
}
