// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'qna_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$QnAModelImpl _$$QnAModelImplFromJson(Map<String, dynamic> json) =>
    _$QnAModelImpl(
      question: json['question'] as String?,
      options: json['options'] as Map<String, dynamic>?,
      answer: json['answer'] as String?,
      explanation: json['explanation'] as String?,
    );

Map<String, dynamic> _$$QnAModelImplToJson(_$QnAModelImpl instance) =>
    <String, dynamic>{
      'question': instance.question,
      'options': instance.options,
      'answer': instance.answer,
      'explanation': instance.explanation,
    };
