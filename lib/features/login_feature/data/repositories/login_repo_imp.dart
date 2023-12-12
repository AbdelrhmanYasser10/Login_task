import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import 'package:login_task/core/error/fauilre.dart';
import 'package:login_task/core/servcies/cache_helper/cache_servcies.dart';

import 'package:login_task/features/login_feature/data/models/auth_model.dart';

import '../../../../core/servcies/api_services.dart';
import 'login_repo.dart';

class LoginRepoImp implements LoginRepo{
  final ApiService apiService;

  LoginRepoImp(this.apiService);
  @override
  Future<Either<Failure, AuthModel>> loginFn(String email , String password) async{
    try {
      var data = await apiService.post(
          endPoint:
          'login',
        data: {
            'email':email,
            'password':password,
        }
      );
      AuthModel authModel = AuthModel.fromJson(data);
      return right(authModel);
    } catch (e) {
      if (e is DioException) {
        return left(
          ServerFailure.fromDioError(e),
        );
      }
      return left(
        ServerFailure(
          e.toString(),
        ),
      );
    }
  }

}