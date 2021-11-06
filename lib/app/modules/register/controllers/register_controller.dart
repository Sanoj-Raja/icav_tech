import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:icav_tech/app/routes/app_pages.dart';

class RegisterController extends GetxController {
  final phoneNumberController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();
  final signupFormKey = GlobalKey<FormState>();

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

  void register() {
    if (signupFormKey.currentState!.validate()) {
      Get.offAllNamed(Routes.HOME);
    }
  }

  void readTermsAndCondition() {
    print('Term & Condition Pressed.');
  }
}
