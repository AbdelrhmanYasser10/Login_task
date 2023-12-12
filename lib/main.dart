import 'package:flutter/material.dart';
import 'package:login_task/login_app.dart';

import 'core/servcies/cache_helper/cache_servcies.dart';
import 'core/utils/services_locator.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  setupServiceLocator();

  //Initialize Cache Helper
  SharedPreferencesHelper.init();

  // root widget for the app
  runApp(const LoginApp());
}

