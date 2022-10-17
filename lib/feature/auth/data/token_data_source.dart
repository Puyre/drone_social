import 'package:shared_preferences/shared_preferences.dart';

class TokenDataSource {
  final String tokenKey = "_tokenKey";

  Future<void> setToken(
    String token,
  ) async {
    final preferences = await SharedPreferences.getInstance();
    await preferences.setString(
      tokenKey,
      token,
    );
  }

  Future<String> getToken() async {
    final preferences = await SharedPreferences.getInstance();
    return preferences.getString(tokenKey) ?? "";
  }
}
