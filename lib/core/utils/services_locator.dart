import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:login_task/features/login_feature/data/repositories/login_repo_imp.dart';

import '../servcies/api_services.dart';

final getIt = GetIt.instance;

void setupServiceLocator() {
  getIt.registerSingleton<ApiService>(ApiService(Dio()));
  getIt.registerSingleton<LoginRepoImp>(LoginRepoImp(
    getIt.get<ApiService>(),
  ));
}