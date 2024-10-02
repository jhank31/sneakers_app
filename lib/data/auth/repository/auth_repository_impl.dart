import 'package:dartz/dartz.dart';
import 'package:e_commers_app/data/auth/models/user_creation_req.dart';
import 'package:e_commers_app/data/auth/source/auth_firebase_service.dart';
import 'package:e_commers_app/domain/auth/repository/auth_repository.dart';
import 'package:e_commers_app/service_locator.dart';

class AuthRepositoryImpl extends AuthRepository {
  @override
  Future<Either> singup(UserCreationReq user) async {
    return await sl<AuthFirebaseService>().singup(user);
  }
  
  @override
  Future<Either> getAges() async {
    return await sl<AuthFirebaseService>().getAges();
  }
  
}