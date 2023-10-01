import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:uml_freelance/domain/entities/user_role.dart';

part 'user.freezed.dart';

part 'user.g.dart';

@freezed
class User with _$User {
  factory User({
    required final String id,
    required final String login,
    required final String password,
    required final String name,
    required final UserRole role,
  }) = _User;

  factory User.fromJson(Map<String, Object?> json) => _$UserFromJson(json);
}
