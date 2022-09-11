import 'package:drone_assist/feature/auth/data/auth_api.dart';
import 'package:drone_assist/feature/auth/data/sign_up_request.dart';
import 'package:drone_assist/feature/auth/data/sign_up_response.dart';
import 'package:drone_assist/feature/extensions/network_extensions.dart';

class AuthDataSource {
  final AuthApi authApi;

  const AuthDataSource({
    required this.authApi,
  });

  Future<SignUpResponse> signup(SignUpRequest signUpRequest) async {
    final response = await authApi.signUp(signUpRequest);
    return response.proceedResponse();
  }
}
