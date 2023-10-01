part of 'users_cubit.dart';

@freezed
class UsersState with _$UsersState {
  const factory UsersState({
    @Default([]) final List<User> users,
  }) = _UsersState;

  factory UsersState.fromJson(Map<String, Object?> json) =>
      _$UsersStateFromJson(json);
}
