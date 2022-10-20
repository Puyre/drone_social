import 'package:drone_assist/feature/auth/widgets/sign_in_widget.dart';
import 'package:drone_assist/feature/auth/widgets/sign_up_widget.dart';
import 'package:drone_assist/generated/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
class AuthScreen extends StatelessWidget {
  const AuthScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: TabBar(
            tabs: [
              Tab(text: LocaleKeys.auth_signIn.tr()),
              Tab(text: LocaleKeys.auth_signUp.tr()),
            ],
          ),
        ),
        body: const TabBarView(
          children: [
            SignInWidget(),
            SignUpWidget(),
          ],
        ),
      ),
    );
  }
}
