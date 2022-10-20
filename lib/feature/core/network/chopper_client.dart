import 'package:chopper/chopper.dart';
import 'package:drone_assist/feature/auth/data/api/auth_api.dart';
import 'package:drone_assist/feature/core/network/%20json_converter.dart';
import 'package:get_it/get_it.dart';

void configureChopper() {
  final chopper = ChopperClient(
    baseUrl: "http://10.0.2.2:8080",
    services: [
      AuthApi.create()
    ],
    converter: ModelJsonConverter(),
    errorConverter: const JsonConverter(),
    interceptors: [
      HttpLoggingInterceptor(),
    ]
  );

  GetIt.I.registerSingleton(chopper.getService<AuthApi>());
}