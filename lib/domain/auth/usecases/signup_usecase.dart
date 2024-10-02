import 'package:dartz/dartz.dart';
import 'package:e_commers_app/core/usecase.dart/usecase.dart';
import 'package:e_commers_app/data/auth/models/user_creation_req.dart';
import 'package:e_commers_app/domain/auth/repository/auth_repository.dart';
import 'package:e_commers_app/service_locator.dart';

class SignupUsecase implements UseCase<Either, UserCreationReq>{
  @override
  Future<Either> call({UserCreationReq ? params}) async {
    return await sl<AuthRepository>().singup(params!);
  }

}