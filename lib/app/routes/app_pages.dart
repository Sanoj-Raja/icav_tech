import 'package:get/get.dart';

import 'package:icav_tech/app/modules/edit_profile/bindings/edit_profile_binding.dart';
import 'package:icav_tech/app/modules/edit_profile/views/edit_profile_view.dart';
import 'package:icav_tech/app/modules/home/bindings/home_binding.dart';
import 'package:icav_tech/app/modules/home/views/home_view.dart';
import 'package:icav_tech/app/modules/login/bindings/login_binding.dart';
import 'package:icav_tech/app/modules/login/views/login_view.dart';
import 'package:icav_tech/app/modules/register/bindings/register_binding.dart';
import 'package:icav_tech/app/modules/register/views/register_view.dart';
import 'package:icav_tech/app/modules/splash/bindings/splash_binding.dart';
import 'package:icav_tech/app/modules/splash/views/splash_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.SPLASH;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.LOGIN,
      page: () => LoginView(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: _Paths.SPLASH,
      page: () => SplashView(),
      binding: SplashBinding(),
    ),
    GetPage(
      name: _Paths.REGISTER,
      page: () => RegisterView(),
      binding: RegisterBinding(),
    ),
    GetPage(
      name: _Paths.EDIT_PROFILE,
      page: () => EditProfileView(),
      binding: EditProfileBinding(),
    ),
  ];
}
