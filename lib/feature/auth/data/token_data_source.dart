import 'package:shared_preferences/shared_preferences.dart';

class TokenDataSource {
  final String _accessTokenKey = "_accessTokenKey";
  final String _refreshTokenKey = "_refreshTokenKey";

  Future<void> setTokenPair({
    required String accessToken,
    required String refreshToken,
  }) async {
    final preferences = await SharedPreferences.getInstance();
    await preferences.setString(
      _accessTokenKey,
      accessToken,
    );
    await preferences.setString(
      _refreshTokenKey,
      refreshToken,
    );
  }

  Future<String> getAccessToken() async {
    final preferences = await SharedPreferences.getInstance();
    return preferences.getString(_accessTokenKey) ?? "";
  }

  Future<String> getRefreshToken() async {
    final preferences = await SharedPreferences.getInstance();
    return preferences.getString(_refreshTokenKey) ?? "";
  }
}
