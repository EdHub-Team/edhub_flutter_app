import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:edhub_flutter_app/core/error/exceptions.dart';
import 'package:edhub_flutter_app/core/error/failure.dart';
import 'package:edhub_flutter_app/features/learn/data/datasources/learn_remote_data_source.dart';
import 'package:edhub_flutter_app/features/learn/domain/entities/summary.dart';
import 'package:edhub_flutter_app/features/learn/domain/repository/learn_repository.dart';

class LearnRepositoryImpl implements LearnRepository {
  LearnRemoteDataSource learnRemoteDataSource;
  LearnRepositoryImpl(this.learnRemoteDataSource);
  @override
  Future<Either<Failure, Summary>> summarizeFromImage({
    required File image,
  }) async {
    try {
      final Summary summary =
          await learnRemoteDataSource.summarizeFromImage(image: image);
      return right(summary);
    } on ServerException catch (e) {
      return left(Failure(e.message));
    } catch (e) {
      return left(Failure(e.toString()));
    }
  }
}
