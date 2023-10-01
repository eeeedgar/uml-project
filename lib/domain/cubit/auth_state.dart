part of 'auth_cubit.dart';

@freezed
class AuthState with _$AuthState {
  const factory AuthState({
    @Default(AuthStatus.unauthorized) final AuthStatus status,
    final User? user,
  }) = _AuthState;
}
