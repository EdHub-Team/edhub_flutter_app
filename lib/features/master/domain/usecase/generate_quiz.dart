import 'package:dartz/dartz.dart';
import 'package:edhub_flutter_app/core/error/failure.dart';
import 'package:edhub_flutter_app/core/usecase/usecase.dart';
import 'package:edhub_flutter_app/features/master/domain/entities/quiz.dart';
import 'package:edhub_flutter_app/features/master/domain/repository/master_repository.dart';

class GenerateQuiz implements UseCase<Quiz, GenerateQuizParams> {
  final MasterRepository masterRepository;
  GenerateQuiz(this.masterRepository);
  @override
  Future<Either<Failure, Quiz>> call(GenerateQuizParams params) async {
    return await masterRepository.generateQuiz(
      topic: params.topic,
      difficultyLevel: params.difficultyLevel,
    );
  }
}

class GenerateQuizParams {
  final String topic;
  final int difficultyLevel;
  GenerateQuizParams({
    required this.topic,
    required this.difficultyLevel,
  });
}
