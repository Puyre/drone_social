import "dart:async";
import 'package:chopper/chopper.dart';
import 'package:drone_assist/feature/auth/data/contract/sign_in_request.dart';
import 'package:drone_assist/feature/auth/data/contract/sign_in_response.dart';
import 'package:drone_assist/feature/auth/data/contract/sign_up_request.dart';
import 'package:drone_assist/feature/auth/data/contract/sign_up_response.dart';

part 'auth_api.chopper.dart';

@ChopperApi()
abstract class AuthApi extends ChopperService {

  static AuthApi create([ChopperClient? client]) =>
      _$AuthApi(client);

  @Post(path: "/signup")
  Future<Response<SignUpResponse>> signUp(SignUpRequest request);

  @Post(path: "/login")
  Future<Response<SignInResponse>> signIn(SignInRequest request);
}