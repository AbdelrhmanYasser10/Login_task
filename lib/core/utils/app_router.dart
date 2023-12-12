import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:login_task/config/routes/app_routes.dart';
import 'package:login_task/core/utils/services_locator.dart';
import 'package:login_task/features/login_feature/data/repositories/login_repo_imp.dart';
import 'package:login_task/features/login_feature/presentation/manager/login_cubit/login_cubit.dart';

import '../../features/login_feature/presentation/pages/login_screen.dart';

abstract class AppRouter {

  static final router = GoRouter(
    routes: [
      // root (Login)
      GoRoute(
        path: AppRoutes.root,
        builder: (context, state){
          return BlocProvider(
              create:(_)=> LoginCubit(
                getIt.get<LoginRepoImp>(),
              ),
              child: const LoginScreen(),
          );
        },
      ),

      // Other Screens...
    ],
  );
}