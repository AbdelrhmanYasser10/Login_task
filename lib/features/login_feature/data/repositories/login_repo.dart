import 'package:dartz/dartz.dart';
import 'package:login_task/features/login_feature/data/models/auth_model.dart';

import '../../../../core/error/fauilre.dart';

abstract class LoginRepo{
  Future<Either<Failure, AuthModel>> loginFn(String email , String password);
}