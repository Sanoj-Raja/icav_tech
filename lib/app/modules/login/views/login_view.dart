import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:icav_tech/app/constants/app_colors.dart';
import 'package:icav_tech/app/constants/app_strings.dart';
import 'package:icav_tech/app/utils/text_fields.dart';
import 'package:icav_tech/app/widgets/body_top_bar.dart';
import 'package:icav_tech/app/widgets/custom_buttons.dart';
import 'package:icav_tech/app/widgets/gap_widget.dart';
import '../controllers/login_controller.dart';

class LoginView extends GetView<LoginController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            BodyTopBar(
              customColor: Colors.transparent,
            ),
            VerticalGap(
              gap: 15,
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    VerticalGap(
                      gap: 15,
                    ),
                    Text(
                      AppStrings.login,
                      style: Get.textTheme.headline1,
                    ),
                    VerticalGap(
                      gap: 20,
                    ),
                    loginForm(),
                    VerticalGap(
                      gap: 30,
                    ),
                    LargeButton(
                      buttonText: AppStrings.login,
                      onPressed: controller.login,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 50.0,
                        vertical: 30,
                      ),
                      child: dontHaveAccount(),
                    ),
                    VerticalGap(
                      gap: 20,
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  RichText dontHaveAccount() {
    return RichText(
      textAlign: TextAlign.center,
      text: TextSpan(
        children: <TextSpan>[
          TextSpan(
            text: AppStrings.dontHaveAccount,
            style: Get.textTheme.headline2,
          ),
          TextSpan(
            text: AppStrings.registerNow,
            style: Get.textTheme.headline2!.copyWith(
              color: AppColors.purple,
              decoration: TextDecoration.underline,
            ),
            recognizer: TapGestureRecognizer()..onTap = controller.registerNow,
          ),
        ],
      ),
    );
  }

  Padding loginForm() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25),
      child: Form(
        key: controller.loginFormKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            VerticalGap(
              gap: 20,
            ),
            Text(
              AppStrings.mobileNumber,
              style: Get.textTheme.subtitle1!.copyWith(
                color: AppColors.white,
              ),
            ),
            VerticalGap(),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: Get.width * .15,
                  child: CountryCodeTextField(),
                ),
                Expanded(
                  child: PhoneTextField(
                    controller: controller.phoneNumberTextController,
                  ),
                ),
              ],
            ),
            VerticalGap(
              gap: 20,
            ),
            Text(
              AppStrings.password,
              style: Get.textTheme.subtitle1!.copyWith(
                color: AppColors.white,
              ),
            ),
            VerticalGap(),
            PasswordTextField(
              controller: controller.passwordTextController,
              hintText: AppStrings.password,
            ),
            VerticalGap(
              gap: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                InkWell(
                  onTap: controller.forgotPassword,
                  child: Text(
                    '${AppStrings.forgotPassword}?',
                    style: Get.textTheme.subtitle2!.copyWith(
                      color: AppColors.yellowButton,
                    ),
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
