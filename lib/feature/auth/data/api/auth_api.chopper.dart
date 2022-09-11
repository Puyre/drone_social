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
  Future<Response<SignUpResponse>> signUp(SignUpRequest request) {
    final $url = '/signup';
    final $request = Request('POST', $url, client.baseUrl);
    return client.send<SignUpResponse, SignUpResponse>($request);
  }

  @override
  Future<Response<SignInResponse>> signIn(SignInRequest request) {
    final $url = '/login';
    final $request = Request('POST', $url, client.baseUrl);
    return client.send<SignInResponse, SignInResponse>($request);
  }
}
