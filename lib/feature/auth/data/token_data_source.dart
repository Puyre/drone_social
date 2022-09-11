import 'package:shared_preferences/shared_preferences.dart';

class TokenDataSource {
  final String tokenKey = "_tokenKey";

  final SharedPreferences preferences;

  const TokenDataSource({
    required this.preferences,
  });

  Future<void> setToken(
    String token,
  ) async {
    await preferences.setString(
      tokenKey,
      token,
    );
  }

  Future<String> getToken() async {
    return preferences.getString(tokenKey) ?? "";
  }
}
