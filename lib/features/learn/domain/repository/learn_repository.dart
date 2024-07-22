import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:edhub_flutter_app/core/error/failure.dart';
import 'package:edhub_flutter_app/features/learn/domain/entities/summary.dart';

abstract interface class LearnRepository {
  Future<Either<Failure, Summary>> summarizeFromImage({
    required File image,
  });
}
