import 'package:get/get.dart';

import 'package:app_module/app/modules/home/bindings/home_binding.dart';
import 'package:app_module/app/modules/home/views/home_view.dart';
import 'package:app_module/app/modules/signin/bindings/signin_binding.dart';
import 'package:app_module/app/modules/signin/views/signin_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.SIGNIN;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.SIGNIN,
      page: () => SigninView(),
      binding: SigninBinding(),
    ),
  ];
}
