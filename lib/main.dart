import 'package:drone_assist/core/network/chopper_client.dart';
import 'package:drone_assist/feature/auth/di/auth_module.dart';
import 'package:drone_assist/feature/welcome/screens/welcome_screen.dart';
import 'package:drone_assist/generated/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:vrouter/vrouter.dart';
import 'package:logging/logging.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();

  _setupLogging();
  configureChopper();
  await registerAuthModule();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return EasyLocalization(
      supportedLocales: const [
        Locale('en', 'US'),
        Locale('ru'),
      ],
      path: 'assets/translations',
      fallbackLocale: const Locale('en', 'US'),
      //startLocale: const Locale('ru', 'RU'),
      child: Builder(
        builder: (context) {
          return MaterialApp(
            localizationsDelegates: context.localizationDelegates,
            title:  LocaleKeys.common_appName.tr(),
            theme: ThemeData(
              primarySwatch: Colors.amber,
            ),
            home: VRouter(
              initialUrl: "/auth",
              routes: [
                VWidget(path: "/auth", widget: const WelcomeScreen()),
              ],
            ),
          );
        }
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
