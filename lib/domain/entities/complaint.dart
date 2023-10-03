import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:uml_freelance/domain/entities/complaint_status.dart';

part 'complaint.freezed.dart';

part 'complaint.g.dart';

@freezed
class Complaint with _$Complaint {
  factory Complaint({
    required final String id,
    required final String description,
    required final String solutionId,
    required final String orderId,
    required ComplaintStatus status,
  }) = _Complaint;

  factory Complaint.fromJson(Map<String, Object?> json) => _$ComplaintFromJson(json);
}
