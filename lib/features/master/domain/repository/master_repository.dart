import 'package:dartz/dartz.dart';
import 'package:edhub_flutter_app/core/error/failure.dart';
import 'package:edhub_flutter_app/features/master/domain/entities/quiz.dart';

abstract interface class MasterRepository {
  Future<Either<Failure, Quiz>> generateQuiz({
    required String topic,
    required int difficultyLevel,
  });
}
