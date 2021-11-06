import 'package:get/get.dart';
import 'package:icav_tech/app/routes/app_pages.dart';

class SplashController extends GetxController {
  final animationDuration = Duration(milliseconds: 1500);
  RxDouble upperSplashLeftPosition = (-Get.width * 2).obs;
  RxDouble lowerSplashRightPosition = (-Get.width * 2).obs;
  RxDouble logoLeftPosition = (-Get.width * 2).obs;
  RxDouble logoWidth = (Get.width * .65).obs;

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
    upperSplashLeftPosition.value = 0;
    lowerSplashRightPosition.value = 0;
    logoLeftPosition.value = ((Get.width - logoWidth.value) / 2);

    Future.delayed(Duration(seconds: 2)).then(
      (_) {
        Get.offNamed(Routes.LOGIN);
      },
    );
  }

  @override
  void onClose() {}
}
