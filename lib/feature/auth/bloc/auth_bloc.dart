import 'dart:async';

import 'package:drone_assist/core/exceptions/server_exception.dart';
import 'package:drone_assist/feature/auth/bloc/auth_event.dart';
import 'package:drone_assist/feature/auth/bloc/auth_state.dart';
import 'package:drone_assist/feature/auth/data/auth_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthRepository authRepository;

  AuthBloc({
    required this.authRepository,
  }) : super(const AuthState.initial()) {
    on<SignInEvent>(onSignInEvent);
    on<SignUpEvent>(onSignUpEvent);
  }

  FutureOr<void> onSignInEvent(
    SignInEvent event,
    Emitter emitter,
  ) async {
    if (event.login.isEmpty) {
      emitter(const AuthState.errorEmptyLogin());
    } else if (event.password.isEmpty) {
      emitter(const AuthState.errorEmptyPassword());
    } else {
      emitter(const AuthState.loading());
      try {
        await authRepository.signIn(
          event.login,
          event.password,
        );
        emitter(const AuthState.authorized());
      } catch (e) {
        if (e is ServerException) {
          emitter(const AuthState.errorIncorrectCredentials());
        } else {
          emitter(const AuthState.errorNetworkError());
        }
      }
    }
  }

  FutureOr<void> onSignUpEvent(
    SignUpEvent event,
    Emitter emitter,
  ) async {
    if (event.login.isEmpty) {
      emitter(const AuthState.errorEmptyLogin());
    } else if (event.password.isEmpty) {
      emitter(const AuthState.errorEmptyPassword());
    } else {
      emitter(const AuthState.loading());
      try {
        await authRepository.signUp(
          event.login,
          event.password,
        );
        emitter(const AuthState.authorized());
      } catch (e) {
        if (e is ServerException) {
          emitter(const AuthState.errorUserAlreadyExists());
        } else {
          emitter(const AuthState.errorNetworkError());
        }
      }
    }
  }
}
