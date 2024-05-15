import 'package:dartz/dartz.dart';
import 'package:edhub_flutter_app/core/error/failure.dart';
import 'package:edhub_flutter_app/core/usecase/usecase.dart';
import 'package:edhub_flutter_app/shared/domain/entities/user.dart';
import 'package:edhub_flutter_app/features/auth/domain/repository/auth_repository.dart';

class CurrentUser implements UseCase<User, NoParams> {
  final AuthRepository authRepository;
  CurrentUser(this.authRepository);
  @override
  Future<Either<Failure, User>> call(NoParams params) async {
    return await authRepository.currentUser();
  }
}
