import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:icav_tech/app/constants/app_colors.dart';

class LargeButton extends StatelessWidget {
  final String buttonText;
  final onPressed;
  final bool isGrey;
  final double? buttonHorizontalPadding;
  final double height;
  final double fontSize;

  const LargeButton({
    Key? key,
    required this.buttonText,
    required this.onPressed,
    this.isGrey = false,
    this.height = 55,
    this.fontSize = 17,
    this.buttonHorizontalPadding,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: buttonHorizontalPadding ?? 25.0,
      ),
      child: ElevatedButton(
        child: Container(
          height: height,
          child: Center(
            child: Text(
              buttonText.toUpperCase(),
              style: Get.textTheme.headline2!.copyWith(
                color: isGrey ? AppColors.white : AppColors.blackButtonText,
                fontSize: fontSize,
              ),
            ),
          ),
        ),
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          primary: isGrey
              ? AppColors.textFieldLabelAndButtonGrey
              : AppColors.yellowButton,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
        ),
      ),
    );
  }
}
