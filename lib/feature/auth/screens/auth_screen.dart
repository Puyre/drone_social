import 'package:drone_assist/feature/auth/widgets/sign_in_widget.dart';
import 'package:drone_assist/feature/auth/widgets/sign_up_widget.dart';
import 'package:flutter/material.dart';

class AuthScreen extends StatelessWidget {
  const AuthScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          bottom: const TabBar(
            tabs: [
              Tab(text: "Sign in"),
              Tab(text: "Sign up"),
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
