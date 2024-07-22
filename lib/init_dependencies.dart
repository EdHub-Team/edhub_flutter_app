import 'package:edhub_flutter_app/core/secrets/app_secrets.dart';
import 'package:edhub_flutter_app/features/auth/data/datasources/auth_remote_data_source.dart';
import 'package:edhub_flutter_app/features/auth/data/repository/auth_repository_impl.dart';
import 'package:edhub_flutter_app/features/auth/domain/repository/auth_repository.dart';
import 'package:edhub_flutter_app/features/auth/domain/usecase/current_user.dart';
import 'package:edhub_flutter_app/features/auth/domain/usecase/user_login_usecase.dart';
import 'package:edhub_flutter_app/features/auth/domain/usecase/user_sign_up_usecase.dart';
import 'package:edhub_flutter_app/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:edhub_flutter_app/features/learn/data/datasources/learn_remote_data_source.dart';
import 'package:edhub_flutter_app/features/learn/data/repository/learn_repository_impl.dart';
import 'package:edhub_flutter_app/features/learn/domain/repository/learn_repository.dart';
import 'package:edhub_flutter_app/features/learn/domain/usecase/summarize_from_image.dart';
import 'package:edhub_flutter_app/features/learn/presentation/bloc/learn_bloc.dart';
import 'package:edhub_flutter_app/features/master/data/datasources/master_remote_data_source.dart';
import 'package:edhub_flutter_app/features/master/data/repository/master_repository_impl.dart';
import 'package:edhub_flutter_app/features/master/domain/repository/master_repository.dart';
import 'package:edhub_flutter_app/features/master/domain/usecase/generate_quiz.dart';
import 'package:edhub_flutter_app/features/master/presentation/bloc/master_bloc.dart';
import 'package:edhub_flutter_app/shared/presentation/cubits/app_user/app_user_cubit.dart';
import 'package:get_it/get_it.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

final serviceLocator = GetIt.instance;
Future<void> initDependencies() async {
  _initAuth();
  _initMaster();
  _initLearn();
  final supabase = await Supabase.initialize(
    url: AppSecrets.supabaseUrl,
    anonKey: AppSecrets.supabaseAnon,
  );
  serviceLocator.registerLazySingleton(() => supabase.client);

  //Core
  serviceLocator.registerLazySingleton(() => AppUserCubit());
}

void _initLearn() {
  serviceLocator
    //Data Source
    ..registerFactory<LearnRemoteDataSource>(
      () => LearnRemoteDataSourceImpl(),
    )
    //Repo
    ..registerFactory<LearnRepository>(
      () => LearnRepositoryImpl(
        serviceLocator(),
      ),
    )
    //Usecase
    ..registerFactory(
      () => SummarizeFromImage(
        serviceLocator(),
      ),
    )
    //Bloc
    ..registerLazySingleton(
      () => LearnBloc(
        summarizeFromImage: serviceLocator(),
      ),
    );
}

void _initMaster() {
  serviceLocator
    //Data Source
    ..registerFactory<MasterRemoteDataSource>(
      () => MasterRemoteDataSourceImpl(),
    )
    //Repo
    ..registerFactory<MasterRepository>(
      () => MasterRepositoryImpl(
        serviceLocator(),
      ),
    )
    //Usecase
    ..registerFactory(
      () => GenerateQuiz(
        serviceLocator(),
      ),
    )
    //Bloc
    ..registerLazySingleton(
      () => MasterBloc(
        generateQuiz: serviceLocator(),
      ),
    );
}

void _initAuth() {
  serviceLocator
    //Data Source
    ..registerFactory<AuthRemoteDataSource>(
      () => AuthRemoteDataSourceImpl(
        serviceLocator(),
      ),
    )
    //Repo
    ..registerFactory<AuthRepository>(
      () => AuthRepositoryImpl(
        serviceLocator(),
      ),
    )
    //Usecase
    ..registerFactory(
      () => UserSignUp(
        serviceLocator(),
      ),
    )
    ..registerFactory(
      () => UserLogin(
        serviceLocator(),
      ),
    )
    ..registerFactory(
      () => CurrentUser(
        serviceLocator(),
      ),
    )
    //Bloc
    ..registerLazySingleton(
      () => AuthBloc(
        userSignUp: serviceLocator(),
        userLogin: serviceLocator(),
        currentUser: serviceLocator(),
        appUserCubit: serviceLocator(),
      ),
    );
}
