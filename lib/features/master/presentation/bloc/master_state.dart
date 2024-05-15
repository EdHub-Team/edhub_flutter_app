part of 'master_bloc.dart';

@immutable
sealed class MasterState {
  const MasterState();
}

final class MasterInitial extends MasterState {}

final class MasterLoading extends MasterState {}

final class MasterGenerateQuizSuccess extends MasterState {
  final Quiz quiz;
  const MasterGenerateQuizSuccess({required this.quiz});
}

final class MasterFailure extends MasterState {
  final String message;
  const MasterFailure({required this.message});
}
