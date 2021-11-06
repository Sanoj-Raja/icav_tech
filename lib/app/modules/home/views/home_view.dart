import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:get/get.dart';
import 'package:icav_tech/app/constants/app_colors.dart';
import 'package:icav_tech/app/constants/app_strings.dart';
import 'package:icav_tech/app/local_storage/sessions.dart';
import 'package:icav_tech/app/widgets/body_top_bar.dart';
import 'package:icav_tech/app/widgets/custom_buttons.dart';
import 'package:icav_tech/app/widgets/gap_widget.dart';
import 'package:icav_tech/app/widgets/menu_option_card.dart';
import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            BodyTopBar(
              alignLeft: true,
            ),
            userProfile(),
            VerticalGap(
              gap: 5,
            ),
            notification(),
            VerticalGap(
              gap: 15,
            ),
            Expanded(
              child: menus(),
            ),
          ],
        ),
      ),
    );
  }

  Widget userProfile() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 15.0, horizontal: 25),
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 4),
            child: InkWell(
              onTap: controller.editProfile,
              child: Obx(
                () => Stack(
                  alignment: Alignment.bottomCenter,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: AppColors.white,
                          width: 1.2,
                        ),
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(120),
                        child: USER_IMAGE.value != ''
                            ? Image.file(
                                File(USER_IMAGE.value),
                                height: 70,
                                width: 70,
                                fit: BoxFit.cover,
                                errorBuilder: (_, __, ___) => Icon(
                                  Icons.person,
                                  size: 60,
                                ),
                              )
                            : Container(
                                color: AppColors.darkBlueBackground,
                                height: 70,
                                width: 70,
                                child: Icon(
                                  Icons.person,
                                  size: 60,
                                  color: AppColors.blackBackground,
                                ),
                              ),
                      ),
                    ),
                    Container(
                      width: 60,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.vertical(
                          bottom: Radius.circular(50),
                        ),
                        color: Colors.black54,
                      ),
                      child: Icon(
                        Icons.camera_alt,
                        color: AppColors.yellowHighlighter,
                        size: 16,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          HorizontalGap(
            gap: 15,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: Get.width * .6,
                child: Obx(
                  () => Text(
                    USER_NAME.value,
                    style: Get.textTheme.headline2!.copyWith(
                      fontSize: 23,
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ),
              InkWell(
                onTap: controller.editProfile,
                child: Text(
                  AppStrings.viewAndEditProfile,
                  style: Get.textTheme.subtitle2!.copyWith(
                    color: AppColors.yellowHighlighter,
                    decoration: TextDecoration.underline,
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }

  Obx notification() {
    return Obx(
      () => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              AppStrings.notifications,
              style: Get.textTheme.subtitle1!.copyWith(
                color: AppColors.white,
              ),
            ),
            FlutterSwitch(
              activeColor: AppColors.yellowHighlighter,
              inactiveColor: AppColors.darkGreySecondaryText,
              width: 38.0,
              height: 20.0,
              toggleSize: 18.0,
              value: controller.isNotificationEnable.value,
              padding: 1.5,
              onToggle: (val) {
                controller.isNotificationEnable.value = val;
              },
            ),
          ],
        ),
      ),
    );
  }

  menus() {
    return SingleChildScrollView(
      child: Column(
        children: [
          MenuOptionCard(
            heading: AppStrings.contactUs,
            subHeading: AppStrings.contactUsSubHeading,
            onTap: controller.contactUs,
          ),
          MenuOptionCard(
            heading: AppStrings.help,
            subHeading: AppStrings.helpSubHeading,
            onTap: controller.help,
          ),
          MenuOptionCard(
            heading: AppStrings.rateApp,
            subHeading: AppStrings.rateAppSubHeading,
            onTap: controller.rateApp,
          ),
          VerticalGap(
            gap: 15,
          ),
          LargeButton(
            buttonText: AppStrings.logout,
            onPressed: controller.logout,
          ),
          VerticalGap(
            gap: 15,
          ),
        ],
      ),
    );
  }
}
