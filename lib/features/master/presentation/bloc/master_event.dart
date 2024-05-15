part of 'master_bloc.dart';

@immutable
sealed class MasterEvent {
  const MasterEvent();
}

final class MasterGenerateQuiz extends MasterEvent {
  final String topic;
  final int difficultyLevel;
  const MasterGenerateQuiz({
    required this.topic,
    required this.difficultyLevel,
  });
}
