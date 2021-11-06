import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:icav_tech/app/constants/app_strings.dart';
import 'package:icav_tech/app/local_storage/sessions.dart';
import 'package:image_picker/image_picker.dart';

class EditProfileController extends GetxController {
  TextEditingController nameTextController = TextEditingController(
      text: USER_NAME.value == AppStrings.addName ? '' : USER_NAME.value);
  TextEditingController emailTextController =
      TextEditingController(text: USER_EMAIL.value);
  RxString profileImage = ''.obs;

  final profileFormKey = GlobalKey<FormState>();
  final picker = ImagePicker();

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

  void saveAndUpdateProfile() {
    if (profileFormKey.currentState!.validate()) {
      SessionManager.saveUserName(nameTextController.text);
      SessionManager.saveUserEmail(emailTextController.text);
      SessionManager.saveUserImage(profileImage.value).then(
        (_) {
          Get.back();
        },
      );
    }
  }

  void getProfileImage() {
    picker.pickImage(source: ImageSource.gallery).then(
      (pickedImage) {
        profileImage.value = pickedImage?.path ?? '';
      },
    );
  }
}
