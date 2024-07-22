part of 'learn_bloc.dart';

@immutable
sealed class LearnState {
  const LearnState();
}

final class LearnInitial extends LearnState {}

final class LearnLoading extends LearnState {}

final class LearnSummarizeFromImageSuccess extends LearnState {
  final Summary summary;
  const LearnSummarizeFromImageSuccess({required this.summary});
}

final class LearnFailure extends LearnState {
  final String message;
  const LearnFailure({required this.message});
}
