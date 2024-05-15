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
      (r) => emit(MasterGenerateQuizSuccess(quiz: r)),
    );
  }
}
