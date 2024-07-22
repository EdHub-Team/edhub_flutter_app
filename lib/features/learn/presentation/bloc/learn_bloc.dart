import 'dart:io';

import 'package:edhub_flutter_app/features/learn/domain/entities/summary.dart';
import 'package:edhub_flutter_app/features/learn/domain/usecase/summarize_from_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'learn_event.dart';
part 'learn_state.dart';

class LearnBloc extends Bloc<LearnEvent, LearnState> {
  final SummarizeFromImage _summarizeFromImage;
  LearnBloc({required SummarizeFromImage summarizeFromImage})
      : _summarizeFromImage = summarizeFromImage,
        super(LearnInitial()) {
    on<LearnEvent>((event, emit) {
      // TODO: implement event handler
    });
    on<LearnSummarizeFromImage>(_onLearnSummarizeFromImage);
  }

  void _onLearnSummarizeFromImage(
    LearnSummarizeFromImage event,
    Emitter<LearnState> emit,
  ) async {
    emit(LearnLoading());
    final res = await _summarizeFromImage(
      SummarizeFromImageParams(
        image: event.image,
      ),
    );
    res.fold(
      (l) => emit(LearnFailure(message: l.message)),
      (r) => emit(LearnSummarizeFromImageSuccess(summary: r)),
    );
  }
}
