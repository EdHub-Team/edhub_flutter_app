import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:edhub_flutter_app/core/error/failure.dart';
import 'package:edhub_flutter_app/core/usecase/usecase.dart';
import 'package:edhub_flutter_app/features/learn/domain/entities/summary.dart';
import 'package:edhub_flutter_app/features/learn/domain/repository/learn_repository.dart';

class SummarizeFromImage implements UseCase<Summary, SummarizeFromImageParams> {
  final LearnRepository learnRepository;
  SummarizeFromImage(this.learnRepository);
  @override
  Future<Either<Failure, Summary>> call(SummarizeFromImageParams params) async {
    return await learnRepository.summarizeFromImage(
      image: params.image,
    );
  }
}

class SummarizeFromImageParams {
  final File image;
  SummarizeFromImageParams({
    required this.image,
  });
}
