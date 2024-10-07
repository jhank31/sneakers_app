import 'package:dartz/dartz.dart';
import 'package:e_commers_app/data/auth/models/user_creation_req.dart';
import 'package:e_commers_app/data/auth/models/user_model.dart';
import 'package:e_commers_app/data/auth/models/user_signin_req.dart';
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

  @override
  Future<Either> singin(UserSigninReq user) async {
    return await sl<AuthFirebaseService>().signin(user);
  }

  @override
  Future<Either> sendPasswordResetEmail(String email) async {
    return await sl<AuthFirebaseService>().sendPasswordResetEmail(email);
  }

  @override
  Future<bool> isLoggedIn() async {
    return await sl<AuthFirebaseService>().isLoggedIn();
  }

  @override
  Future<bool> logout() async {
    return await sl<AuthFirebaseService>().logout();
  }

  @override
  Future<Either> getUser() async {
    var user = await sl<AuthFirebaseService>().getuser();
    return user.fold(
      (error) {
        return Left(error);
      },
      (data) {
        return Right(
          UserModel.fromJson(data).toEntity(),
        );
      },
    );
  }
}
