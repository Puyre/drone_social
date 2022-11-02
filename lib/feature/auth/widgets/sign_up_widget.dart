import 'package:drone_assist/common/widgets/beer_text_field.dart';
import 'package:drone_assist/extensions/context_extensions.dart';
import 'package:drone_assist/feature/auth/bloc/auth_bloc.dart';
import 'package:drone_assist/feature/auth/bloc/auth_event.dart';
import 'package:drone_assist/feature/auth/bloc/auth_state.dart';
import 'package:drone_assist/generated/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
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
      child: BlocConsumer<AuthBloc, AuthState>(
        listener: (context, state) {
          state.whenOrNull(
            errorUserAlreadyExists: () {
              context.showSnackBar(
                text: LocaleKeys.auth_errorUserAlreadyExists.tr(),
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
                BeerTextField(
                  hint: LocaleKeys.auth_email.tr(),
                  onChanged: (text) {
                    login = text;
                  },
                ),
                const SizedBox(
                  height: 16,
                ),
                BeerTextField(
                  hint: LocaleKeys.auth_password.tr(),
                  onChanged: (text) {
                    password = text;
                  },
                  obscureText: true,
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
                  child: Text(
                    LocaleKeys.auth_signUp.tr(),
                    style: const TextStyle(
                      color: Colors.amber,
                    ),
                  ),
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
