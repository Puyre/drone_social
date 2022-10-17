import 'package:drone_assist/feature/auth/di/auth_module.dart';
import 'package:drone_assist/feature/auth/screens/auth_screen.dart';
import 'package:drone_assist/feature/core/network/chopper_client.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:vrouter/vrouter.dart';
import 'package:logging/logging.dart';

void main() async {
  _setupLogging();
  configureChopper();
  await registerAuthModule();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: VRouter(
        initialUrl: "/auth",
        routes: [
          VWidget(path: "/auth", widget: const AuthScreen()),
        ],
      ),
    );
  }
}

void _setupLogging() {
  Logger.root.level = Level.ALL;
  Logger.root.onRecord.listen((rec) {
    if (kDebugMode) {
      print('${rec.level.name}: ${rec.time}: ${rec.message}');
    }
  });
}
