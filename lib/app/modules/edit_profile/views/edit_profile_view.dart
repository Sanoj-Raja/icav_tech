import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:icav_tech/app/constants/app_colors.dart';
import 'package:icav_tech/app/constants/app_errors.dart';
import 'package:icav_tech/app/constants/app_strings.dart';
import 'package:icav_tech/app/local_storage/sessions.dart';
import 'package:icav_tech/app/utils/text_fields.dart';
import 'package:icav_tech/app/widgets/body_top_bar.dart';
import 'package:icav_tech/app/widgets/custom_buttons.dart';
import 'package:icav_tech/app/widgets/gap_widget.dart';
import '../controllers/edit_profile_controller.dart';

class EditProfileView extends GetView<EditProfileController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      floatingActionButton: LargeButton(
        buttonText: AppStrings.saveAndUpdate,
        onPressed: controller.saveAndUpdateProfile,
      ),
      floatingActionButtonLocation:
          FloatingActionButtonLocation.miniCenterFloat,
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            BodyTopBarWithHeading(
              heading: AppStrings.editProfile,
            ),
            VerticalGap(
              gap: 20,
            ),
            Expanded(
              child: SingleChildScrollView(
                child: userDetailsForm(),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget userDetailsForm() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25),
      child: Form(
        key: controller.profileFormKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            VerticalGap(
              gap: 10,
            ),
            selectProfileImage(),
            VerticalGap(
              gap: 30,
            ),
            Text(
              AppStrings.name,
              style: Get.textTheme.headline2,
            ),
            VerticalGap(),
            UniversalTextField(
              controller: controller.nameTextController,
              keyboardType: TextInputType.name,
              hintText: AppStrings.name,
              validatorErrorText: AppErrors.nameErrorText,
              iconData: Icons.person,
            ),
            VerticalGap(
              gap: 20,
            ),
            Text(
              AppStrings.email,
              style: Get.textTheme.headline2,
            ),
            VerticalGap(),
            EmailTextField(
              controller: controller.emailTextController,
            ),
            VerticalGap(
              gap: Get.height * .5,
            )
          ],
        ),
      ),
    );
  }

  Widget selectProfileImage() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Center(
        child: InkWell(
          onTap: controller.getProfileImage,
          child: Obx(
            () => Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(120),
                border: Border.all(
                  color: AppColors.white,
                  width: 1.2,
                ),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(120),
                child: controller.profileImage.value != ''
                    ? Image.file(
                        File(controller.profileImage.value),
                        height: 120,
                        width: 120,
                        fit: BoxFit.cover,
                        errorBuilder: (_, __, ___) => Icon(
                          Icons.person,
                          size: 120,
                        ),
                      )
                    : USER_IMAGE.value != ''
                        ? Image.asset(
                            USER_IMAGE.value,
                            height: 120,
                            width: 120,
                            fit: BoxFit.cover,
                            errorBuilder: (_, __, ___) => Icon(
                              Icons.person,
                              size: 120,
                            ),
                          )
                        : Container(
                            color: AppColors.darkBlueBackground,
                            height: 120,
                            width: 120,
                            child: Icon(
                              Icons.person,
                              size: 110,
                              color: AppColors.blackBackground,
                            ),
                          ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
