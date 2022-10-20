// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_api.dart';

// **************************************************************************
// ChopperGenerator
// **************************************************************************

// ignore_for_file: always_put_control_body_on_new_line, always_specify_types, prefer_const_declarations, unnecessary_brace_in_string_interps
class _$AuthApi extends AuthApi {
  _$AuthApi([ChopperClient? client]) {
    if (client == null) return;
    this.client = client;
  }

  @override
  final definitionType = AuthApi;

  @override
  Future<Response<SignUpResponse>> signUp(Map<String, dynamic> body) {
    final $url = '/signup';
    final $body = body;
    final $request = Request('POST', $url, client.baseUrl, body: $body);
    return client.send<SignUpResponse, SignUpResponse>($request);
  }

  @override
  Future<Response<SignInResponse>> signIn(Map<String, dynamic> body) {
    final $url = '/login';
    final $body = body;
    final $request = Request('POST', $url, client.baseUrl, body: $body);
    return client.send<SignInResponse, SignInResponse>($request);
  }
}
