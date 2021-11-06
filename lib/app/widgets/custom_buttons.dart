import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:icav_tech/app/constants/app_colors.dart';
import 'gap_widget.dart';

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

class SmallButtonPair extends StatelessWidget {
  final String enabledText;
  final String disabledText;
  final enabledOnPressed;
  final disabledOnPressed;
  const SmallButtonPair({
    Key? key,
    required this.enabledText,
    required this.disabledText,
    required this.enabledOnPressed,
    required this.disabledOnPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Flexible(
            child: ElevatedButton(
              child: Container(
                height: 60,
                child: Center(
                  child: Text(
                    disabledText.toUpperCase(),
                    style: Get.textTheme.headline2!.copyWith(
                      color: AppColors.yellowButton,
                      fontSize: 17,
                    ),
                  ),
                ),
              ),
              onPressed: disabledOnPressed,
              style: ElevatedButton.styleFrom(
                primary: AppColors.blackButtonText,
                side: BorderSide(
                  color: AppColors.yellowButton,
                  width: 1,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
            ),
          ),
          HorizontalGap(gap: 20),
          Flexible(
            child: ElevatedButton(
              child: Container(
                height: 60,
                child: Center(
                  child: Text(
                    enabledText.toUpperCase(),
                    style: Get.textTheme.headline2!.copyWith(
                      color: AppColors.blackButtonText,
                      fontSize: 17,
                    ),
                  ),
                ),
              ),
              onPressed: enabledOnPressed,
              style: ElevatedButton.styleFrom(
                primary: AppColors.yellowButton,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

class CircularButton extends StatelessWidget {
  final onPressed;
  final bool isBackButton;
  const CircularButton({
    Key? key,
    required this.onPressed,
    this.isBackButton = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        height: 70,
        width: 70,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: AppColors.yellowButton,
        ),
        child: Padding(
          padding: const EdgeInsets.only(left: 8.0),
          child: Icon(
            isBackButton ? Icons.arrow_back_ios : Icons.arrow_forward_ios,
            size: 45,
            color: AppColors.blackButtonText,
          ),
        ),
      ),
    );
  }
}
