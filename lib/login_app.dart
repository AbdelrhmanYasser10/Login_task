import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:login_task/config/themes/app_theme.dart';

import 'core/utils/app_router.dart';

class LoginApp extends StatelessWidget {
  const LoginApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Screen util package for responsive
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (_, child) {
        return MaterialApp.router(
          routerConfig: AppRouter.router,
          title: "Radio App",
          debugShowCheckedModeBanner: false,
          themeMode: ThemeMode.light,
          theme: appTheme(),
        );
      },
    );
  }
}
