import 'package:dartz/dartz.dart';
import 'package:edhub_flutter_app/core/error/exceptions.dart';
import 'package:edhub_flutter_app/core/error/failure.dart';
import 'package:edhub_flutter_app/features/master/data/datasources/master_remote_data_source.dart';
import 'package:edhub_flutter_app/features/master/domain/entities/quiz.dart';
import 'package:edhub_flutter_app/features/master/domain/repository/master_repository.dart';

class MasterRepositoryImpl implements MasterRepository {
  MasterRemoteDataSource masterRemoteDataSource;
  MasterRepositoryImpl(this.masterRemoteDataSource);
  @override
  Future<Either<Failure, Quiz>> generateQuiz({
    required String topic,
    required int difficultyLevel,
  }) async {
    try {
      final Quiz quiz = await masterRemoteDataSource.generateQuiz(
        topic: topic,
        difficultyLevel: difficultyLevel,
      );
      return right(quiz);
    } on ServerException catch (e) {
      return left(Failure(e.message));
    } catch (e) {
      return left(Failure(e.toString()));
    }
  }
}
