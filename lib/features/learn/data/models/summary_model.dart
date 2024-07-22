import 'package:edhub_flutter_app/features/learn/domain/entities/summary.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'summary_model.freezed.dart';
part 'summary_model.g.dart';

@freezed
class SummaryModel extends Summary with _$SummaryModel {
  const factory SummaryModel({
    required String? title,
    required String? summary,
    required String? detailedExplanation,
    required String? sourceImageUrl,
  }) = _SummaryModel;

  factory SummaryModel.fromJson(Map<String, Object?> json) =>
      _$SummaryModelFromJson(json);
}
