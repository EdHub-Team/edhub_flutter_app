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

final class MasterStartQuiz extends MasterEvent {
  final Quiz quiz;
  const MasterStartQuiz({required this.quiz});
}

final class MasterMarkAnswer extends MasterEvent {
  final Quiz quiz;
  final int currentQnAIndex;
  final int? answer;
  const MasterMarkAnswer({
    required this.quiz,
    required this.currentQnAIndex,
    required this.answer,
  });
}

final class MasterSubmitAnswer extends MasterEvent {
  // final Quiz quiz;
  final int currentQnAIndex;
  // final int? answer;
  const MasterSubmitAnswer({
    // required this.quiz,
    required this.currentQnAIndex,
    // required this.answer,
  });
}
