import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:uml_freelance/domain/entities/solution.dart';
import 'package:uml_freelance/domain/entities/user.dart';

part 'solutions_state.dart';
part 'solutions_cubit.freezed.dart';
part 'solutions_cubit.g.dart';

class SolutionsCubit extends HydratedCubit<SolutionsState> {
  SolutionsCubit() : super(const SolutionsState());

  void postSolution(String text, User user, String orderId) {
    final solution = Solution(
      id: _generateId(),
      title: text,
      performerId: user.id,
      orderId: orderId,
    );

    emit(state.copyWith(solutions: List.of(state.solutions)..add(solution)));
  }

  void viewSolution(String solutionId) {
    final s =
        state.solutions.where((element) => element.id == solutionId).first;
    final newSolution = Solution(
      id: s.id,
      title: s.id,
      performerId: s.performerId,
      orderId: s.orderId,
      viewed: true,
    );
    emit(
      state.copyWith(
        solutions: List.of(state.solutions)
          ..removeWhere((e) => e.id == solutionId)
          ..add(newSolution),
      ),
    );
  }

  @override
  SolutionsState? fromJson(Map<String, dynamic> json) =>
      SolutionsState.fromJson(json);

  @override
  Map<String, dynamic>? toJson(SolutionsState state) => state.toJson();

  String _generateId() {
    final now = DateTime.now();
    return now.microsecondsSinceEpoch.toString();
  }
}
