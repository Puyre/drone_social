import 'dart:async';

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
    emitter(const AuthState.loading());
    await authRepository.signIn(
      event.login,
      event.password,
    );
    emitter(const AuthState.authorized());
  }

  FutureOr<void> onSignUpEvent(
    SignUpEvent event,
    Emitter emitter,
  ) async {
    emitter(const AuthState.loading());
    await authRepository.signUp(
      event.login,
      event.password,
    );
    emitter(const AuthState.authorized());
  }
}
