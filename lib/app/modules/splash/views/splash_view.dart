import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:icav_tech/app/constants/app_assest.dart';
import '../controllers/splash_controller.dart';

class SplashView extends GetView<SplashController> {
  @override
  Widget build(BuildContext context) { 
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Obx(
              () => AnimatedPositioned(
                duration: controller.animationDuration,
                left: controller.upperSplashLeftPosition.value,
                top: 0,
                child: Container(
                  height: Get.height * .2,
                  width: Get.width * .7,
                  child: Image.asset(
                    AppImages.upperSplashImage,
                    alignment: Alignment.topLeft,
                  ),
                ),
              ),
            ),
            Obx(
              () => AnimatedPositioned(
                duration: controller.animationDuration,
                left: controller.logoLeftPosition.value,
                top: Get.height * .5 - Get.height * .08,
                child: Container(
                  height: Get.height * .1,
                  width: controller.logoWidth.value,
                  child: Image.asset(AppImages.logo),
                ),
              ),
            ),
            Obx(
              () => AnimatedPositioned(
                duration: controller.animationDuration,
                right: controller.lowerSplashRightPosition.value,
                bottom: 0,
                child: Container(
                  height: Get.height * .3,
                  width: Get.width * .99,
                  child: Image.asset(
                    AppImages.lowerSplashImage,
                    alignment: Alignment.bottomRight,
                  ),
                ),
              ),
            ),
            Container(
              height: Get.height * .96,
              width: Get.width,
            )
          ],
        ),
      ),
    );
  }
}
