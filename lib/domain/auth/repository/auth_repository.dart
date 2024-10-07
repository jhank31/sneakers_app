import 'package:dartz/dartz.dart';
import 'package:e_commers_app/data/auth/models/user_creation_req.dart';
import 'package:e_commers_app/data/auth/models/user_signin_req.dart';

abstract class AuthRepository {
  Future<Either> singup(UserCreationReq user);
  Future<Either> getAges();
  Future<Either> singin(UserSigninReq user);
  Future<Either> sendPasswordResetEmail(String email);
  Future<bool> isLoggedIn();
  Future<bool> logout();
  Future<Either> getUser();

}
