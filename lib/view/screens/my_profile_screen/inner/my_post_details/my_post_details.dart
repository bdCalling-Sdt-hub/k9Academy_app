import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:k9academy/helper/network_img/network_img.dart';
import 'package:k9academy/helper/time_converter/time_converter.dart';
import 'package:k9academy/services/app_url.dart';
import 'package:k9academy/utils/app_colors/app_colors.dart';
import 'package:k9academy/utils/app_img/app_img.dart';
import 'package:k9academy/utils/static_strings/static_strings.dart';
import 'package:k9academy/view/screens/home_screen/home_controller/home_controller.dart';
import 'package:k9academy/view/widgets/custom_text/custom_text.dart';

class MyPostDetails extends StatelessWidget {
  MyPostDetails({super.key});

  final HomeController homeController = Get.find<HomeController>();
  final name = Get.arguments[0];
  final description = Get.arguments[1];
  final postImage = Get.arguments[2];
  final profileImage = Get.arguments[3];
  final postCreatedTime = Get.arguments[4];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.blackyDarkHover,
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 40.w,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0.w),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  IconButton(
                    onPressed: () {
                      Get.back();
                    },
                    icon: const Icon(
                      Icons.arrow_back,
                      color: AppColors.light,
                    ),
                  ),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(30),
                    child: CustomNetworkImage(
                      imageUrl: "${ApiUrl.baseUrl}$profileImage",
                      height: 50,
                      width: 50,
                    ),
                  ),
                  SizedBox(
                    width: 10.w,
                  ),
                   Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomText(
                        text: name,
                        fontWeight: FontWeight.w500,
                      ),
                      CustomText(
                        text: DateConverter.formatTime(
                            "${postCreatedTime ?? DateTime.now()}"),
                        fontWeight: FontWeight.w500,
                      ),
                    ],
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 16.h,
                  ),
                   CustomText(
                    textAlign: TextAlign.start,
                    maxLines: 7,
                    bottom: 10,
                    text: description,
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  ///============================See more================================
                  ///=====================================Cover Image=====================
                  ClipRRect(
                    borderRadius: BorderRadius.circular(16),
                    child: CustomNetworkImage(
                      imageUrl: "${ApiUrl.baseUrl}$postImage",
                      width: double.infinity,
                      height: 171.h,
                    ),
                  ),
                  ///=============================Comment =====================
                  SizedBox(
                    height: 15.h,
                  ),
                  const Divider(),
                  ///==============================All Comments ==================================
                  CustomText(
                    top: 12,
                    text: AppStaticStrings.allComments,
                    color: AppColors.blueNormal,
                    fontWeight: FontWeight.w600,
                    fontSize: 16.sp,
                    bottom: 5,
                  ),
                  Column(
                    children: List.generate(
                      6,
                          (index) => Padding(
                        padding: EdgeInsets.symmetric(vertical: 8.0.h),
                        child: Row(
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(30),
                              child: CustomNetworkImage(
                                imageUrl: AppImages.dog3,
                                height: 50,
                                width: 50,
                              ),
                            ),
                            SizedBox(
                              width: 10.w,
                            ),
                            Expanded(
                              child: Container(
                                margin: const EdgeInsets.only(top: 15),
                                padding: const EdgeInsets.all(18),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15),
                                  color: AppColors.blackyDark,
                                ),
                                child: const Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    CustomText(
                                      text: "Natasa",
                                      fontWeight: FontWeight.w600,
                                    ),
                                    CustomText(
                                      maxLines: 3,
                                      color: AppColors.lightNormalHover,
                                      text: "Nice product, best wishes",
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
