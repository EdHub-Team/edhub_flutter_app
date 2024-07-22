// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'summary_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$SummaryModelImpl _$$SummaryModelImplFromJson(Map<String, dynamic> json) =>
    _$SummaryModelImpl(
      title: json['title'] as String?,
      summary: json['summary'] as String?,
      detailedExplanation: json['detailedExplanation'] as String?,
      sourceImageUrl: json['sourceImageUrl'] as String?,
    );

Map<String, dynamic> _$$SummaryModelImplToJson(_$SummaryModelImpl instance) =>
    <String, dynamic>{
      'title': instance.title,
      'summary': instance.summary,
      'detailedExplanation': instance.detailedExplanation,
      'sourceImageUrl': instance.sourceImageUrl,
    };
