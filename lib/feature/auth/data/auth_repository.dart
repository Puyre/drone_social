import 'package:drone_assist/feature/auth/data/auth_data_source.dart';
import 'package:drone_assist/feature/auth/data/contract/sign_in_request.dart';
import 'package:drone_assist/feature/auth/data/contract/sign_up_request.dart';
import 'package:drone_assist/feature/auth/data/token_data_source.dart';
import 'package:http/http.dart' as http;

class AuthRepository {
  final AuthDataSource authDataSource;
  final TokenDataSource tokenDataSource;

  const AuthRepository({
    required this.authDataSource,
    required this.tokenDataSource,
  });

  Future<void> signUp(
    String login,
    String password,
  ) async {
    final response = await authDataSource.signup(
      SignUpRequest(
        login,
        password,
      ),
    );

    await tokenDataSource.setTokenPair(
      accessToken: response.accessToken,
      refreshToken: response.refreshToken,
    );
  }

  Future<void> signIn(
    String login,
    String password,
  ) async {
    final response = await authDataSource.signIn(
      SignInRequest(
        login,
        password,
      ),
    );

    await tokenDataSource.setTokenPair(
      accessToken: response.accessToken,
      refreshToken: response.refreshToken,
    );
  }
}
