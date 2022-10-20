import 'package:drone_assist/feature/auth/bloc/auth_bloc.dart';
import 'package:drone_assist/feature/auth/bloc/auth_event.dart';
import 'package:drone_assist/feature/auth/bloc/auth_state.dart';
import 'package:drone_assist/feature/extensions/context_extensions.dart';
import 'package:drone_assist/generated/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

class SignInWidget extends StatefulWidget {
  const SignInWidget({Key? key}) : super(key: key);

  @override
  State<SignInWidget> createState() => _SignInWidgetState();
}

class _SignInWidgetState extends State<SignInWidget> {
  String login = "";
  String password = "";

  @override
  Widget build(BuildContext context) {
    return BlocProvider<AuthBloc>(
      create: (context) => AuthBloc(
        authRepository: GetIt.I.get(),
      ),
      child: BlocConsumer<AuthBloc, AuthState>(
        listener: (context, state) {
          state.whenOrNull(
            errorIncorrectCredentials: () {
              context.showSnackBar(
                text: LocaleKeys.auth_errorWrongCredentials.tr(),
                icon: Icons.error_outline,
              );
            },
            errorNetworkError: () {
              context.showSnackBar(
                text: LocaleKeys.common_networkError.tr(),
                icon: Icons.network_check,
              );
            },
            errorEmptyLogin: () {
              context.showSnackBar(
                text: LocaleKeys.auth_errorEmptyLogin.tr(),
                icon: Icons.error_outline,
              );
            },
            errorEmptyPassword: () {
              context.showSnackBar(
                text: LocaleKeys.auth_errorEmptyPassword.tr(),
                icon: Icons.error_outline,
              );
            },
          );
        },
        builder: (context, state) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              children: [
                const Spacer(),
                TextField(
                  decoration: InputDecoration(
                    border: const OutlineInputBorder(),
                    hintText: LocaleKeys.auth_email.tr(),
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
                  decoration: InputDecoration(
                    border: const OutlineInputBorder(),
                    hintText: LocaleKeys.auth_password.tr(),
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
                          SignInEvent(
                            login: login,
                            password: password,
                          ),
                        );
                  },
                  child: Text(LocaleKeys.auth_signIn.tr()),
                ),
                const Spacer(
                  flex: 2,
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
