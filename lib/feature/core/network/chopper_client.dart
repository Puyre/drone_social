import 'package:chopper/chopper.dart';
import 'package:drone_assist/feature/auth/data/auth_api.dart';
import 'package:get_it/get_it.dart';

void configureChopper() {
  final chopper = ChopperClient(
    baseUrl: "http://0.0.0.0:8080",
    services: [
      AuthApi.create()
    ]
  );

  GetIt.I.registerSingleton(chopper.getService<AuthApi>());
}