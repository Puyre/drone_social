import 'package:drone_assist/feature/auth/bloc/auth_bloc.dart';
import 'package:drone_assist/feature/auth/bloc/auth_event.dart';
import 'package:drone_assist/feature/auth/bloc/auth_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

class SignUpWidget extends StatefulWidget {
  const SignUpWidget({Key? key}) : super(key: key);

  @override
  State<SignUpWidget> createState() => _SignUpWidgetState();
}

class _SignUpWidgetState extends State<SignUpWidget> {
  String login = "";
  String password = "";

  @override
  Widget build(BuildContext context) {
    return BlocProvider<AuthBloc>(
      create: (context) => AuthBloc(
        authRepository: GetIt.I.get(),
      ),
      child: BlocBuilder<AuthBloc, AuthState>(builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            children: [
              const Spacer(),
              TextField(
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: "Login",
                ),
                onChanged: (text) {
                  login = text;
                },
              ),
              const SizedBox(
                height: 16,
              ),
              TextField(
                obscureText: true,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: "Password",
                ),
                onChanged: (text) {
                  password = text;
                },
              ),
              const SizedBox(
                height: 16,
              ),
              TextButton(
                onPressed: () {
                  context.read<AuthBloc>().add(
                    SignUpEvent(
                      login: login,
                      password: password,
                    ),
                  );
                },
                child: const Text("Sign up"),
              ),
              const Spacer(
                flex: 2,
              ),
            ],
          ),
        );
      }),
    );
  }
}
