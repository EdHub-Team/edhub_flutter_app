import 'package:dartz/dartz.dart';
import 'package:edhub_flutter_app/core/error/failure.dart';

abstract interface class UseCase<SuccessType, Params> {
  Future<Either<Failure, SuccessType>> call(Params params);
}

class NoParams {}
