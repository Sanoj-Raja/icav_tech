import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:icav_tech/app/routes/app_pages.dart';

class LoginController extends GetxController {
  final phoneNumberTextController = TextEditingController();
  final passwordTextController = TextEditingController();
  final loginFormKey = GlobalKey<FormState>();

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}

  void login() {
    if (loginFormKey.currentState!.validate()) {
      Get.offAllNamed(Routes.HOME);
    }
  }

  void registerNow() {
    Get.toNamed(Routes.REGISTER);
  }

  void forgotPassword() {
    print('Forgot password clicked.');
  }
}
