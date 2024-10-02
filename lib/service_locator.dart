import 'package:e_commers_app/data/auth/repository/auth_repository_impl.dart';
import 'package:e_commers_app/data/auth/source/auth_firebase_service.dart';
import 'package:e_commers_app/domain/auth/repository/auth_repository.dart';
import 'package:e_commers_app/domain/auth/usecases_auth.dart';
import 'package:get_it/get_it.dart';

final sl = GetIt.instance;
Future<void> initializeDependencies() async {
  //* Services
  //? Auth Firebase Service
  sl.registerSingleton<AuthFirebaseService>(AuthFirebaseServiceImpl());

  //* Repositories
  //? Auth Repository
  sl.registerSingleton<AuthRepository>(AuthRepositoryImpl());

  //* Use cases
  //? Auth Use cases
  sl.registerSingleton<SignupUsecase>(SignupUsecase());
  sl.registerSingleton<GetAgesUsecase>(GetAgesUsecase());

}
