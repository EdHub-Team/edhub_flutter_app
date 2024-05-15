import 'package:edhub_flutter_app/features/master/data/models/qna_model.dart';
import 'package:edhub_flutter_app/features/master/domain/entities/quiz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'quiz_model.freezed.dart';
part 'quiz_model.g.dart';

@freezed
class QuizModel extends Quiz with _$QuizModel {
  const factory QuizModel({
    required String? title,
    required List<QnAModel>? qnaList,
  }) = _QuizModel;

  factory QuizModel.fromJson(Map<String, Object?> json) =>
      _$QuizModelFromJson(json);
}
