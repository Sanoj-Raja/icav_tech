import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:icav_tech/app/constants/app_colors.dart';
import 'package:icav_tech/app/constants/app_errors.dart';
import 'package:icav_tech/app/constants/app_strings.dart';
import 'custom_validator.dart';

class InputTextStyle {
  static TextStyle inputStyle = Get.textTheme.headline2!.copyWith(
    color: AppColors.white,
  );
}

class UniversalTextField extends StatelessWidget with customDecorationMixin {
  final TextEditingController controller;
  final TextInputType keyboardType;
  final String hintText;
  final bool readOnly;
  final String validatorErrorText;
  final IconData? iconData;
  final Color? fillColor;
  final int? lengthToValidate;
  final int? maxLines;

  const UniversalTextField({
    Key? key,
    required this.controller,
    required this.keyboardType,
    required this.hintText,
    required this.validatorErrorText,
    this.iconData,
    this.readOnly = false,
    this.fillColor,
    this.lengthToValidate,
    this.maxLines,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      keyboardType: keyboardType,
      cursorColor: AppColors.white,
      readOnly: readOnly,
      maxLines: maxLines ?? 1,
      decoration: customDecoration(
        fillColor: fillColor,
        hintText: hintText,
        icon: Icon(
          iconData ?? Icons.person,
          color: iconData == null
              ? Colors.transparent
              : AppColors.textFieldLabelAndButtonGrey,
        ),
      ),
      style: InputTextStyle.inputStyle,
      validator: (value) =>
          value!.length >= (lengthToValidate ?? 2) ? null : validatorErrorText,
    );
  }
}

class EmailTextField extends StatelessWidget with customDecorationMixin {
  final TextEditingController controller;
  final bool readOnly;
  const EmailTextField({
    Key? key,
    required this.controller,
    this.readOnly = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      keyboardType: TextInputType.emailAddress,
      cursorColor: AppColors.white,
      readOnly: readOnly,
      validator: (email) =>
          GetUtils.isEmail(email.toString()) ? null : AppErrors.emailErrorText,
      decoration: customDecoration(
        hintText: AppStrings.email,
        icon: Icon(
          Icons.email,
          color: AppColors.textFieldLabelAndButtonGrey,
        ),
      ),
      style: InputTextStyle.inputStyle,
    );
  }
}

class PhoneTextField extends StatelessWidget with customDecorationMixin {
  final TextEditingController controller;
  final bool readOnly;

  const PhoneTextField({
    Key? key,
    required this.controller,
    this.readOnly = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      keyboardType: TextInputType.phone,
      cursorColor: AppColors.white,
      readOnly: readOnly,
      validator: (phoneNumber) => GetUtils.isPhoneNumber(phoneNumber.toString())
          ? null
          : AppErrors.phoneNumberErrorText,
      decoration: customDecoration(
        icon: Icon(
          Icons.smartphone_sharp,
          color: AppColors.textFieldLabelAndButtonGrey,
        ),
        hintText: AppStrings.mobileNumber,
      ),
      style: InputTextStyle.inputStyle,
    );
  }
}

class CountryCodeTextField extends StatelessWidget with customDecorationMixin {
  final countryCodeController =
      TextEditingController(text: AppStrings.countryCode);
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: countryCodeController,
      readOnly: true,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5),
        ),
        filled: true,
        isDense: true,
        fillColor: AppColors.darkBlueBackground,
      ),
      style: InputTextStyle.inputStyle,
    );
  }
}

class PasswordTextField extends StatelessWidget with customDecorationMixin {
  final TextEditingController controller;
  final String hintText;
  final bool readOnly;

  const PasswordTextField({
    Key? key,
    required this.controller,
    required this.hintText,
    this.readOnly = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      keyboardType: TextInputType.visiblePassword,
      cursorColor: AppColors.white,
      readOnly: readOnly,
      validator: (password) => CustomValidator.validatePassword(password ?? '')
          ? null
          : AppErrors.passwordErrorText,
      decoration: customDecoration(
        icon: Icon(
          Icons.vpn_key_sharp,
          color: AppColors.textFieldLabelAndButtonGrey,
        ),
        hintText: hintText,
      ),
      obscureText: true,
      style: InputTextStyle.inputStyle,
    );
  }
}

mixin customDecorationMixin {
  InputDecoration customDecoration({
    required icon,
    required hintText,
    fillColor,
  }) {
    return InputDecoration(
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
      ),
      filled: true,
      fillColor: fillColor ?? AppColors.darkBlueBackground,
      isDense: true,
      suffixIcon: icon,
      hintText: hintText,
      hintStyle: Get.textTheme.subtitle2!.copyWith(
        color: AppColors.textFieldLabelAndButtonGrey,
      ),
    );
  }
}
