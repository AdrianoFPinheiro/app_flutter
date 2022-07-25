import 'package:app_flutter/app/ui/android/splash_page.dart';
import 'package:get/route_manager.dart';

import '../bindings/home_binding.dart';
import '../bindings/login_binding.dart';
import '../ui/android/api_page.dart';
import '../ui/android/home_page.dart';
import '../ui/android/login_page.dart';
import '../ui/android/register_page.dart';
import '../ui/android/splash_page.dart';
import 'app_routes.dart';


class AppPages{
  static final routes = [
    GetPage(name: Routes.INITIAL, page: () => SplashPage()),
    GetPage(name: Routes.LOGIN, page: () => LoginPage(), binding: LoginBinding()),
    GetPage(name: Routes.REGISTER, page: () => RegisterPage()),
    GetPage(name: Routes.HOME, page: () => HomePage(), binding: HomeBinding()),
    GetPage(name: Routes.API, page: () => ApiPage()),
  ];
}