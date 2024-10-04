import 'package:dartz/dartz.dart';
import 'package:e_commers_app/core/usecase.dart/usecase.dart';
import 'package:e_commers_app/data/auth/models/user_signin_req.dart';
import 'package:e_commers_app/domain/auth/repository/auth_repository.dart';
import 'package:e_commers_app/service_locator.dart';

class SinginUsecase implements UseCase<Either, UserSigninReq> {
  @override
  Future<Either> call({UserSigninReq? params}) async {
    return await sl<AuthRepository>().singin(params!);
  }
}
