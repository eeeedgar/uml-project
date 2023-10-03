import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:uml_freelance/domain/dto/user_dto.dart';
import 'package:uml_freelance/domain/entities/user.dart';

part 'users_cubit.freezed.dart';
part 'users_cubit.g.dart';
part 'users_state.dart';

class UsersCubit extends HydratedCubit<UsersState> {
  UsersCubit() : super(const UsersState());

  User registerUser(UserDto dto) {
    final user = User(
        id: _generateId(),
        name: dto.name,
        password: dto.password,
        login: dto.login,
        role: dto.role);
    emit(state.copyWith(
      users: List.of(state.users)
        ..add(
          user,
        ),
    ));
    return user;
  }

  void deleteUser(String id) {
    emit(state.copyWith(
      users: List.of(state.users)..removeWhere((u) => u.id == id),
    ));
  }

  User? search(UserDto dto) {
    try {
      return state.users.firstWhere((user) =>
          user.role == dto.role &&
          user.login == dto.login &&
          user.password == dto.password);
    } on Error {
      return null;
    }
  }

  bool isUnique(UserDto dto) {
    return state.users.where((u) => u.login == dto.login).isEmpty;
  }

  String _generateId() {
    final now = DateTime.now();
    return now.microsecondsSinceEpoch.toString();
  }

  @override
  UsersState? fromJson(Map<String, dynamic> json) => UsersState.fromJson(json);

  @override
  Map<String, dynamic>? toJson(UsersState state) => state.toJson();
}
