import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:uml_freelance/domain/entities/complaint.dart';
import 'package:uml_freelance/domain/entities/complaint_status.dart';

part 'complaints_state.dart';
part 'complaints_cubit.freezed.dart';
part 'complaints_cubit.g.dart';

class ComplaintsCubit extends HydratedCubit<ComplaintsState> {
  ComplaintsCubit() : super(const ComplaintsState());

  void postComplaint(String description, String solutionId, String orderId) {
    final c = Complaint(
        id: _generateId(),
        description: description,
        solutionId: solutionId,
        orderId: orderId,
        status: ComplaintStatus.created);
    emit(state.copyWith(complaints: List.of(state.complaints)..add(c)));
  }

  void setStatus(String complaintId, ComplaintStatus status) {
    final c =
        state.complaints.where((element) => element.id == complaintId).first;
    final nc = Complaint(
      id: c.id,
      description: c.description,
      solutionId: c.solutionId,
      orderId: c.orderId,
      status: status,
    );
    _update(nc);
  }

  @override
  ComplaintsState? fromJson(Map<String, dynamic> json) =>
      ComplaintsState.fromJson(json);

  @override
  Map<String, dynamic>? toJson(ComplaintsState state) => state.toJson();

  String _generateId() {
    final now = DateTime.now();
    return now.microsecondsSinceEpoch.toString();
  }

  void _update(Complaint c) {
    emit(
      state.copyWith(
        complaints: List.of(state.complaints)
          ..removeWhere((element) => element.id == c.id)
          ..add(c),
      ),
    );
  }
}
