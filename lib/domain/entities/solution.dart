import 'package:freezed_annotation/freezed_annotation.dart';

part 'solution.freezed.dart';

part 'solution.g.dart';

@freezed
class Solution with _$Solution {
  factory Solution({
    required final String id,
    required final String title,
    required final String performerId,
    required final String orderId,
    @Default(false) final bool viewed,
  }) = _Solution;

  factory Solution.fromJson(Map<String, Object?> json) => _$SolutionFromJson(json);
}
