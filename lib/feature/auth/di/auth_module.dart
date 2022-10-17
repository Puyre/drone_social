import 'package:drone_assist/feature/auth/data/api/auth_api.dart';
import 'package:drone_assist/feature/auth/data/auth_data_source.dart';
import 'package:drone_assist/feature/auth/data/auth_repository.dart';
import 'package:drone_assist/feature/auth/data/token_data_source.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<void> registerAuthModule() async {
  GetIt.I.registerSingleton(AuthDataSource(authApi: GetIt.I.get()));
  GetIt.I.registerSingleton(
    TokenDataSource(),
  );
  GetIt.I.registerSingleton(
    AuthRepository(
      authDataSource: GetIt.I.get(),
      tokenDataSource: GetIt.I.get(),
    ),
  );
}
