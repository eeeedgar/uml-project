import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:uml_freelance/domain/entities/auth_status.dart';
import 'package:uml_freelance/domain/entities/user.dart';

part 'auth_state.dart';
part 'auth_cubit.freezed.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(const AuthState());

  void login(User user) {
    emit(state.copyWith(status: AuthStatus.authorized, user: user));
  }

  void logout() {
    emit(state.copyWith(status: AuthStatus.unauthorized, user: null));
  }
}
