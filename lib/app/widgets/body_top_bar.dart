import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:icav_tech/app/constants/app_assest.dart';
import 'package:icav_tech/app/constants/app_colors.dart';
import 'gap_widget.dart';

class BodyTopBar extends StatelessWidget {
  final bool alignLeft;
  final Color? customColor;
  const BodyTopBar({
    Key? key,
    this.alignLeft = false,
    this.customColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: Get.height * .11,
      width: Get.width,
      decoration: BoxDecoration(
        color: customColor ?? AppColors.darkBlueBackground,
        borderRadius: BorderRadius.vertical(
          bottom: Radius.circular(25),
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment:
            alignLeft ? CrossAxisAlignment.start : CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            child: Container(
              width: Get.width * .45,
              child: Image.asset(
                AppImages.logo,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class BodyTopBarWithHeading extends StatelessWidget {
  final bool disableBackArrowButton;
  final String heading;
  final Color? customColor;
  final IconButton? iconButton;

  const BodyTopBarWithHeading({
    Key? key,
    this.disableBackArrowButton = false,
    required this.heading,
    this.customColor,
    this.iconButton,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: Get.height * .11,
      width: Get.width,
      decoration: BoxDecoration(
        color: customColor ?? AppColors.darkBlueBackground,
        borderRadius: BorderRadius.vertical(
          bottom: Radius.circular(25),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              IconButton(
                onPressed: Get.back,
                icon: Icon(Icons.arrow_back),
                color: AppColors.white,
              ),
              Text(
                heading,
                style: Get.textTheme.headline2!.copyWith(
                  fontSize: 22,
                  color: AppColors.white,
                ),
              )
            ],
          ),
          if (iconButton != null)
            Padding(
              padding: const EdgeInsets.only(right: 25),
              child: Container(
                width: 45,
                height: 45,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: AppColors.blackBackground,
                ),
                child: iconButton,
              ),
            ),
        ],
      ),
    );
  }
}

class BodyTopBarWithTwoIcons extends StatelessWidget {
  final Color? customColor;
  final String? appBarHeading;
  final IconButton? iconButtonOne;
  final IconButton? iconButtonTwo;

  const BodyTopBarWithTwoIcons({
    Key? key,
    this.customColor,
    this.iconButtonOne,
    this.iconButtonTwo,
    this.appBarHeading,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: Get.height * .12,
      width: Get.width,
      decoration: BoxDecoration(
        color: customColor ?? AppColors.darkBlueBackground,
        borderRadius: BorderRadius.vertical(
          bottom: Radius.circular(25),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 25),
            child: Container(
              width: Get.width * .55,
              child: appBarHeading != null
                  ? Text(
                      appBarHeading!,
                      style: Get.textTheme.headline2!.copyWith(
                        fontSize: 20,
                      ),
                    )
                  : Padding(
                      padding: const EdgeInsets.only(right: 25),
                      child: Image.asset(
                        AppImages.logo,
                      ),
                    ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 25),
            child: Row(
              children: [
                if (iconButtonOne != null)
                  Container(
                    width: 45,
                    height: 45,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: AppColors.blackBackground,
                    ),
                    child: iconButtonOne,
                  ),
                HorizontalGap(
                  gap: 20,
                ),
                if (iconButtonTwo != null)
                  Container(
                    width: 45,
                    height: 45,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: AppColors.blackBackground,
                    ),
                    child: iconButtonTwo,
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
