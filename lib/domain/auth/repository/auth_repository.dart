import 'package:dartz/dartz.dart';
import 'package:e_commers_app/data/auth/models/user_creation_req.dart';

abstract class AuthRepository {
  Future<Either> singup(UserCreationReq user);
  Future<Either> getAges();
}
