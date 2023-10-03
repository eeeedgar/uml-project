part of 'complaints_cubit.dart';

@freezed
class ComplaintsState with _$ComplaintsState {
  const factory ComplaintsState({
    @Default([]) final List<Complaint> complaints,
  }) = _ComplaintsState;

  factory ComplaintsState.fromJson(Map<String, Object?> json) =>
      _$ComplaintsStateFromJson(json);
}

