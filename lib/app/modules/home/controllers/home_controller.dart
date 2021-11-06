import 'package:bot_toast/bot_toast.dart';
import 'package:get/get.dart';
import 'package:icav_tech/app/routes/app_pages.dart';

class HomeController extends GetxController {
  RxBool isNotificationEnable = true.obs;

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

  void editProfile() {
    print('Edit Profile Clicked');
  }

  void contactUs() {
    print('Contact Us Clicked');
  }

  void bankAccount() {
    print('Bank Account Clicked');
  }

  void subscriptions() {
    print('Subscriptions Clicked');
  }

  void faqs() {
    print('FAQ Clicked');
  }

  void help() {
    print('Help Clicked');
  }

  void rateApp() {
    BotToast.showText(text: 'Comming Soon...');
  }

  void logout() {
    Get.offAllNamed(Routes.SPLASH);
  }
}
