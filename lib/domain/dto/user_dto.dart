import 'package:uml_freelance/domain/entities/user_role.dart';

class UserDto {
  UserDto({
    required this.name,
    required this.login,
    required this.password,
    required this.role,
  });

  final String name;
  final String login;
  final String password;
  final UserRole role;
}
