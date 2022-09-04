import 'package:app_flutter/app/modules/dashboard/bindings/dashboard_binding.dart';
import 'package:app_flutter/app/modules/splash/page/splash_page.dart';
import 'package:get/route_manager.dart';
import '../data/api_page.dart';
import '../modules/dashboard/pages/dashboard_page.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/pages/home_page.dart';
import '../modules/login/bindings/login_binding.dart';
import '../modules/login/pages/login_page.dart';
import '../modules/register/register_page.dart';
import '../modules/splash/page/splash_page.dart';
import 'app_routes.dart';


class AppPages{
  static final routes = [
    GetPage(name: Routes.INITIAL, page: () => SplashPage()),
    GetPage(name: Routes.LOGIN, page: () => LoginPage(), binding: LoginBinding()),
    GetPage(name: Routes.REGISTER, page: () => RegisterPage()),
    GetPage(name: Routes.HOME, page: () => HomePage(), binding: HomeBinding()),
    GetPage(name: Routes.API, page: () => ApiPage()),
    GetPage(name: Routes.DASHBOARD, page: () => DashboardPage(), binding: DashboardBinding()),
  ];
}