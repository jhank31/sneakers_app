import 'package:e_commers_app/data/auth/repository/auth_repository_impl.dart';
import 'package:e_commers_app/data/auth/source/auth_firebase_service.dart';
import 'package:e_commers_app/data/category/respository/category_repository_impl.dart';
import 'package:e_commers_app/data/category/source/category_firebase_service.dart';
import 'package:e_commers_app/data/product/repository/product_repository_impl.dart';
import 'package:e_commers_app/data/product/source/product_firebase_service.dart';
import 'package:e_commers_app/domain/auth/repository/auth_repository.dart';
import 'package:e_commers_app/domain/product/repository/product_repository.dart';
import 'package:e_commers_app/domain/usecases.dart';
import 'package:e_commers_app/domain/category/repository/category_repository.dart';
import 'package:get_it/get_it.dart';

final sl = GetIt.instance;
Future<void> initializeDependencies() async {
  //* Services
  //? Auth Firebase Service
  sl.registerSingleton<AuthFirebaseService>(AuthFirebaseServiceImpl());
  //? Category Firebase Service
  sl.registerSingleton<CategoryFirebaseService>(CategoryFirebaseServiceImpl());
  //? Product Firebase Service
  sl.registerSingleton<ProductFirebaseService>(ProductFirebaseServiceImpl());

  //* Repositories
  //? Auth Repository
  sl.registerSingleton<AuthRepository>(AuthRepositoryImpl());
  //? Category Repository
  sl.registerSingleton<CategoryRepository>(CategoryRepositoryImpl());
  //? Product Repository
  sl.registerSingleton<ProductRepository>(ProductRepositoryImpl());

  //* Use cases
  //? Auth Use cases
  sl.registerSingleton<SignupUsecase>(SignupUsecase());
  sl.registerSingleton<GetAgesUsecase>(GetAgesUsecase());
  sl.registerSingleton<SinginUsecase>(SinginUsecase());
  sl.registerSingleton<SendPasswordResetEmaiUsecase>(
      SendPasswordResetEmaiUsecase());
  sl.registerSingleton<IsLoggedInUseCase>(IsLoggedInUseCase());
  sl.registerSingleton<LogoutUsecase>(LogoutUsecase());
  sl.registerSingleton<GetUserUsecase>(GetUserUsecase());

  //? Category Use cases
  sl.registerSingleton<GetCategoriesUsecase>(GetCategoriesUsecase());

  //? Product Use cases
  sl.registerSingleton<GetTopSellings>(GetTopSellings());
}
