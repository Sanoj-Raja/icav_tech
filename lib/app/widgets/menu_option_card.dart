import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:icav_tech/app/constants/app_colors.dart';
import 'gap_widget.dart';

class MenuOptionCard extends StatelessWidget {
  final String heading;
  final String subHeading;
  final String? yellowSubHeading;
  final onTap;

  const MenuOptionCard({
    Key? key,
    this.yellowSubHeading,
    required this.heading,
    required this.subHeading,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(25, 20, 25, 0),
      child: InkWell(
        onTap: onTap,
        child: Container(
          decoration: BoxDecoration(
            color: AppColors.darkBlueBackground,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 15,
              vertical: 15,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      heading,
                      style: Get.textTheme.subtitle1!.copyWith(
                        color: AppColors.white,
                      ),
                    ),
                    VerticalGap(
                      gap: 6,
                    ),
                    Container(
                      width: Get.width * .6,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            subHeading,
                            style: Get.textTheme.subtitle2!.copyWith(
                              color: AppColors.lightGreyPrimaryText,
                            ),
                          ),
                          if (yellowSubHeading != null) HorizontalGap(gap: 5),
                          if (yellowSubHeading != null)
                            Text(
                              yellowSubHeading ?? '',
                              style: Get.textTheme.subtitle2!.copyWith(
                                color: AppColors.yellowButton,
                              ),
                            ),
                        ],
                      ),
                    )
                  ],
                ),
                Icon(
                  Icons.arrow_forward_ios,
                  color: AppColors.darkGreySecondaryText,
                  size: 20,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
