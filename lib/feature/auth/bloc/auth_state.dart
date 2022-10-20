
import 'package:freezed_annotation/freezed_annotation.dart';
part 'auth_state.freezed.dart';

@freezed
class AuthState with _$AuthState {
  const factory AuthState.initial() = _AuthInitialState;
  const factory AuthState.loading() = _AuthLoadingState;
  const factory AuthState.authorized() = _AuthAuthorizedState;
  const factory AuthState.errorUserAlreadyExists() = _AuthErrorUserAlreadyExistsState;
  const factory AuthState.errorIncorrectCredentials() = _AuthErrorIncorrectCredentialsState;
  const factory AuthState.errorNetworkError() = _AuthErrorNetworkState;
  const factory AuthState.errorEmptyLogin() = _AuthErrorEmptyLoginState;
  const factory AuthState.errorEmptyPassword() = _AuthErrorEmptyPasswordState;
}