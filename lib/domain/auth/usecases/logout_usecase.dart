import 'package:e_commers_app/core/usecase.dart/usecase.dart';
import 'package:e_commers_app/domain/auth/repository/auth_repository.dart';
import 'package:e_commers_app/service_locator.dart';

class LogoutUsecase implements UseCase<bool, void> {
  @override
  Future<bool> call({void params}) async {
    return await sl<AuthRepository>().logout();
  }
 
}