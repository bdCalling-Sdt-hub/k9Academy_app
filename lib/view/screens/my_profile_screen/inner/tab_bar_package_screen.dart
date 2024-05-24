import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:k9academy/core/app_routes/app_routes.dart';
import 'package:k9academy/utils/static_strings/static_strings.dart';
import 'package:k9academy/view/widgets/custom_button/custom_button.dart';
import 'package:k9academy/view/widgets/custom_text/custom_text.dart';

import '../../../../utils/app_colors/app_colors.dart';

class TabBarPackageScreen extends StatelessWidget {
  const TabBarPackageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 100),
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height / 2.4,
          decoration: BoxDecoration(
              color: AppColors.blackyNormalActive,
              borderRadius: BorderRadius.circular(8)),
          child: Column(
            children: [
              const CustomText(
                text: AppStaticStrings.yourSubscriptionPackageIsExpired,
                bottom: 30,
              ),
              ///=================================Subscription Button ================
              CustomButton(
                fillColor: AppColors.redNormal,
                width: MediaQuery.of(context).size.width / 2,
                onTap: () {
                  Get.toNamed(AppRoute.subscription);
                },
                title: AppStaticStrings.subscriptionNow,
              )
            ],
          ),
        ),
      ),
    );
    // return Padding(
    //   padding: const EdgeInsets.symmetric(horizontal: 20),
    //   child: Container(
    //     padding: const EdgeInsets.symmetric(horizontal: 10),
    //     width: MediaQuery.of(context).size.width,
    //     decoration: BoxDecoration(
    //         color: AppColors.blackyNormalActive,
    //         borderRadius: BorderRadius.circular(8)),
    //     child:  Column(
    //       crossAxisAlignment: CrossAxisAlignment.start,
    //       children: [
    //         CustomText(
    //           text: "Date:  1 may, 2024, 10:00am",
    //           color: AppColors.blueLightActive,
    //           fontSize: 14.sp,
    //           bottom: 8,
    //           top: 8,
    //         ),
    //         CustomText(
    //           text: "Package: Essential",
    //           color: AppColors.lightNormalHover,
    //           fontSize: 14.sp,
    //           bottom: 8,
    //           top: 8,
    //         ),
    //         CustomText(
    //           text: "Price: \$40",
    //           color: AppColors.lightNormalHover,
    //           fontSize: 14.sp,
    //           bottom: 8,
    //           top: 8,
    //         ),
    //         const Divider(),
    //         Row(
    //           children: [
    //             CustomImage(
    //               imageSrc: AppIcons.checkDone,
    //               size: 30.sp,
    //             ),
    //             CustomText(
    //               text: "120 day permission to use",
    //               left: 10,
    //               fontWeight: FontWeight.w400,
    //               fontSize: 14.sp,
    //             ),
    //           ],
    //         ),
    //         SizedBox(
    //           height: 10.w,
    //         ),
    //         Row(
    //           children: [
    //             CustomImage(
    //               imageSrc: AppIcons.checkDone,
    //               size: 30.sp,
    //             ),
    //             CustomText(
    //               text: "Free training tutorial",
    //               left: 10,
    //               fontWeight: FontWeight.w400,
    //               fontSize: 14.sp,
    //             ),
    //           ],
    //         ),
    //         SizedBox(
    //           height: 10.w,
    //         ),
    //         Row(
    //           children: [
    //             CustomImage(
    //               imageSrc: AppIcons.checkDone,
    //               size: 30.sp,
    //             ),
    //             CustomText(
    //               text: "Free jurnal",
    //               left: 10,
    //               fontWeight: FontWeight.w400,
    //               fontSize: 14.sp,
    //             ),
    //           ],
    //         ),
    //       ],
    //     ),
    //   ),
    // );
  }
}
