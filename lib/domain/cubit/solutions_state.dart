part of 'solutions_cubit.dart';

@freezed
class SolutionsState with _$SolutionsState {
  const factory SolutionsState({
    @Default([]) final List<Solution> solutions,
  }) = _SolutionsState;

  factory SolutionsState.fromJson(Map<String, Object?> json) =>
      _$SolutionsStateFromJson(json);
}
