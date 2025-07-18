import 'package:dartz/dartz.dart';
import 'package:wink/core/depandancy_injection/service_locator.dart';
import 'package:wink/core/usecase/usecase.dart';
import 'package:wink/features/auth/data/models/login_req_body.dart';
import 'package:wink/features/auth/data/models/login_response.dart';
import 'package:wink/features/auth/domain/repository/auth_repo.dart';

class LoginUsecase extends UseCase<Either, LoginParms> {
  @override
  Future<Either<String, LoginUserData>> call({LoginParms? param}) async {
    if (param == null) throw ArgumentError('RegisterParams cannot be null');

    return await sl<AuthRepo>().login(loginReqBody: param.loginReqBody);
  }
}

class LoginParms {
  final LoginReqBody loginReqBody;

  LoginParms({required this.loginReqBody});
}
