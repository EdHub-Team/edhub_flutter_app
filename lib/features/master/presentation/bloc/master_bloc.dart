import 'package:edhub_flutter_app/features/master/domain/entities/qna.dart';
import 'package:edhub_flutter_app/features/master/domain/entities/quiz.dart';
import 'package:edhub_flutter_app/features/master/domain/usecase/generate_quiz.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'master_event.dart';
part 'master_state.dart';

class MasterBloc extends Bloc<MasterEvent, MasterState> {
  final GenerateQuiz _generateQuiz;
  MasterBloc({
    required GenerateQuiz generateQuiz,
  })  : _generateQuiz = generateQuiz,
        super(MasterInitial()) {
    on<MasterEvent>((event, emit) {
      // TODO: implement event handler
    });
    on<MasterGenerateQuiz>(_onMasterGenerateQuiz);
    on<MasterStartQuiz>(_onMasterStartQuiz);
    on<MasterMarkAnswer>(_onMasterMarkAnswer);
    on<MasterSubmitAnswer>(_onMasterSubmitAnswer);
  }

  void _onMasterGenerateQuiz(
    MasterGenerateQuiz event,
    Emitter<MasterState> emit,
  ) async {
    emit(MasterLoading());
    final res = await _generateQuiz(
      GenerateQuizParams(
        topic: event.topic,
        difficultyLevel: event.difficultyLevel,
      ),
    );
    res.fold(
      (l) => emit(MasterFailure(message: l.message)),
      // (r) => emit(MasterGenerateQuizSuccess(quiz: r)),
      (r) => emit(MasterQuizInProgress(quiz: r, score: 0)),
    );
  }

  void _onMasterStartQuiz(
    MasterStartQuiz event,
    Emitter<MasterState> emit,
  ) {
    emit(MasterQuizInProgress(quiz: event.quiz, score: 0));
  }

  void _onMasterMarkAnswer(
    MasterMarkAnswer event,
    Emitter<MasterState> emit,
  ) {
    if (event.quiz.qnaList?.isEmpty ?? true) {
      return;
    }
    final currentQuizProgress = state as MasterQuizInProgress;
    List<QnA> newQnAList = List.from(event.quiz.qnaList ?? []);
    final currentQnA = event.quiz.qnaList?[event.currentQnAIndex];
    newQnAList[event.currentQnAIndex] = QnA(
      question: currentQnA?.question,
      options: currentQnA?.options,
      answer: currentQnA?.answer,
      explanation: currentQnA?.explanation,
      userMarkedAnswer: event.answer,
    );
    final updatedQuiz = Quiz(title: event.quiz.title, qnaList: newQnAList);
    emit(
      MasterQuizInProgress(
        quiz: updatedQuiz,
        score: currentQuizProgress.score,
      ),
    );
  }

  void _onMasterSubmitAnswer(
    MasterSubmitAnswer event,
    Emitter<MasterState> emit,
  ) {
    final currentQuizProgress = state as MasterQuizInProgress;
    final isCorrect =
        currentQuizProgress.quiz.qnaList?[event.currentQnAIndex].answer ==
            currentQuizProgress
                .quiz.qnaList?[event.currentQnAIndex].userMarkedAnswer;
    final newScore = isCorrect
        ? ((currentQuizProgress.score ?? 0) + 1)
        : currentQuizProgress.score;
    if (event.currentQnAIndex ==
        (currentQuizProgress.quiz.qnaList?.length ?? 0) - 1) {
      emit(
        MasterQuizCompleted(
          quiz: currentQuizProgress.quiz,
          score: (newScore ?? 0),
        ),
      );
    } else {
      emit(
        MasterQuizInProgress(
          quiz: currentQuizProgress.quiz,
          score: newScore,
        ),
      );
    }
  }
}
