// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'qna_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

QnAModel _$QnAModelFromJson(Map<String, dynamic> json) {
  return _QnAModel.fromJson(json);
}

/// @nodoc
mixin _$QnAModel {
  String? get question => throw _privateConstructorUsedError;
  Map<String, dynamic>? get options => throw _privateConstructorUsedError;
  int? get answer => throw _privateConstructorUsedError;
  String? get explanation => throw _privateConstructorUsedError;
  int? get userMarkedAnswer => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $QnAModelCopyWith<QnAModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $QnAModelCopyWith<$Res> {
  factory $QnAModelCopyWith(QnAModel value, $Res Function(QnAModel) then) =
      _$QnAModelCopyWithImpl<$Res, QnAModel>;
  @useResult
  $Res call(
      {String? question,
      Map<String, dynamic>? options,
      int? answer,
      String? explanation,
      int? userMarkedAnswer});
}

/// @nodoc
class _$QnAModelCopyWithImpl<$Res, $Val extends QnAModel>
    implements $QnAModelCopyWith<$Res> {
  _$QnAModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? question = freezed,
    Object? options = freezed,
    Object? answer = freezed,
    Object? explanation = freezed,
    Object? userMarkedAnswer = freezed,
  }) {
    return _then(_value.copyWith(
      question: freezed == question
          ? _value.question
          : question // ignore: cast_nullable_to_non_nullable
              as String?,
      options: freezed == options
          ? _value.options
          : options // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>?,
      answer: freezed == answer
          ? _value.answer
          : answer // ignore: cast_nullable_to_non_nullable
              as int?,
      explanation: freezed == explanation
          ? _value.explanation
          : explanation // ignore: cast_nullable_to_non_nullable
              as String?,
      userMarkedAnswer: freezed == userMarkedAnswer
          ? _value.userMarkedAnswer
          : userMarkedAnswer // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$QnAModelImplCopyWith<$Res>
    implements $QnAModelCopyWith<$Res> {
  factory _$$QnAModelImplCopyWith(
          _$QnAModelImpl value, $Res Function(_$QnAModelImpl) then) =
      __$$QnAModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? question,
      Map<String, dynamic>? options,
      int? answer,
      String? explanation,
      int? userMarkedAnswer});
}

/// @nodoc
class __$$QnAModelImplCopyWithImpl<$Res>
    extends _$QnAModelCopyWithImpl<$Res, _$QnAModelImpl>
    implements _$$QnAModelImplCopyWith<$Res> {
  __$$QnAModelImplCopyWithImpl(
      _$QnAModelImpl _value, $Res Function(_$QnAModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? question = freezed,
    Object? options = freezed,
    Object? answer = freezed,
    Object? explanation = freezed,
    Object? userMarkedAnswer = freezed,
  }) {
    return _then(_$QnAModelImpl(
      question: freezed == question
          ? _value.question
          : question // ignore: cast_nullable_to_non_nullable
              as String?,
      options: freezed == options
          ? _value._options
          : options // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>?,
      answer: freezed == answer
          ? _value.answer
          : answer // ignore: cast_nullable_to_non_nullable
              as int?,
      explanation: freezed == explanation
          ? _value.explanation
          : explanation // ignore: cast_nullable_to_non_nullable
              as String?,
      userMarkedAnswer: freezed == userMarkedAnswer
          ? _value.userMarkedAnswer
          : userMarkedAnswer // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$QnAModelImpl implements _QnAModel {
  const _$QnAModelImpl(
      {required this.question,
      required final Map<String, dynamic>? options,
      required this.answer,
      required this.explanation,
      required this.userMarkedAnswer})
      : _options = options;

  factory _$QnAModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$QnAModelImplFromJson(json);

  @override
  final String? question;
  final Map<String, dynamic>? _options;
  @override
  Map<String, dynamic>? get options {
    final value = _options;
    if (value == null) return null;
    if (_options is EqualUnmodifiableMapView) return _options;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(value);
  }

  @override
  final int? answer;
  @override
  final String? explanation;
  @override
  final int? userMarkedAnswer;

  @override
  String toString() {
    return 'QnAModel(question: $question, options: $options, answer: $answer, explanation: $explanation, userMarkedAnswer: $userMarkedAnswer)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$QnAModelImpl &&
            (identical(other.question, question) ||
                other.question == question) &&
            const DeepCollectionEquality().equals(other._options, _options) &&
            (identical(other.answer, answer) || other.answer == answer) &&
            (identical(other.explanation, explanation) ||
                other.explanation == explanation) &&
            (identical(other.userMarkedAnswer, userMarkedAnswer) ||
                other.userMarkedAnswer == userMarkedAnswer));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      question,
      const DeepCollectionEquality().hash(_options),
      answer,
      explanation,
      userMarkedAnswer);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$QnAModelImplCopyWith<_$QnAModelImpl> get copyWith =>
      __$$QnAModelImplCopyWithImpl<_$QnAModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$QnAModelImplToJson(
      this,
    );
  }

  @override
  set userMarkedAnswer(int? _userMarkedAnswer) {
    // TODO: implement userMarkedAnswer
  }
}

abstract class _QnAModel implements QnAModel {
  const factory _QnAModel(
      {required final String? question,
      required final Map<String, dynamic>? options,
      required final int? answer,
      required final String? explanation,
      required final int? userMarkedAnswer}) = _$QnAModelImpl;

  factory _QnAModel.fromJson(Map<String, dynamic> json) =
      _$QnAModelImpl.fromJson;

  @override
  String? get question;
  @override
  Map<String, dynamic>? get options;
  @override
  int? get answer;
  @override
  String? get explanation;
  @override
  int? get userMarkedAnswer;
  @override
  @JsonKey(ignore: true)
  _$$QnAModelImplCopyWith<_$QnAModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
