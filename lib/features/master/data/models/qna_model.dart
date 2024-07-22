import 'package:edhub_flutter_app/features/master/domain/entities/qna.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'qna_model.freezed.dart';
part 'qna_model.g.dart';

@freezed
class QnAModel extends QnA with _$QnAModel {
  const factory QnAModel({
    required String? question,
    required Map<String, dynamic>? options,
    required int? answer,
    required String? explanation,
    required int? userMarkedAnswer,
  }) = _QnAModel;

  factory QnAModel.fromJson(Map<String, Object?> json) =>
      _$QnAModelFromJson(json);
}
