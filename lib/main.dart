import 'dart:async';
import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'app/constants/app_colors.dart';
import 'app/constants/app_errors.dart';
import 'app/constants/app_strings.dart';
import 'app/routes/app_pages.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init();
  await SystemChrome.setPreferredOrientations(
    [DeviceOrientation.portraitUp],
  );
  runZonedGuarded<Future<void>>(
    () async {
      runApp(
        GetMaterialApp(
          title: AppStrings.appTitle,
          initialRoute: AppPages.INITIAL,
          getPages: AppPages.routes,
          debugShowCheckedModeBanner: false,
          builder: BotToastInit(),
          navigatorObservers: [BotToastNavigatorObserver()],
          theme: ThemeData(
            primaryColor: AppColors.darkBlueBackground,
            canvasColor: AppColors.blackBackground,
            textTheme: TextTheme(
              headline1: TextStyle(
                color: AppColors.white,
                fontSize: 20,
                fontWeight: FontWeight.w700,
              ),
              headline2: TextStyle(
                color: AppColors.lightGreyPrimaryText,
                fontSize: 17,
              ),
              headline3: TextStyle(
                color: AppColors.darkGreySecondaryText,
                fontSize: 15.5,
              ),
            ),
          ),
        ),
      );
    },
    (dynamic error, StackTrace stackTrace) {
      print('<<----------ERROR--------->> \n$error');
      print('<<----------STACK TRACE--------->> \n$stackTrace');
      Get.defaultDialog(
        title: AppErrors.unknownError,
        titleStyle: Get.textTheme.headline2!.copyWith(
          color: AppColors.blackButtonText,
          fontSize: 22,
        ),
        middleText: AppErrors.unknownErrorDetails,
        middleTextStyle: Get.textTheme.subtitle1!.copyWith(
          color: AppColors.darkGreySecondaryText,
        ),
        textConfirm: AppStrings.goBack.toUpperCase(),
        confirmTextColor: AppColors.white,
        radius: 5,
        buttonColor: AppColors.yellowHighlighter,
        onConfirm: () {
          Get.back();
          // One to close the pop up screen.
          // other one for back navigation from the error page.
          Get.back();
        },
      );
    },
  );
}
