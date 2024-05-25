import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:k9academy/helper/network_img/network_img.dart';
import 'package:k9academy/utils/app_colors/app_colors.dart';
import 'package:k9academy/utils/app_const/app_const.dart';
import 'package:k9academy/utils/app_img/app_img.dart';
import 'package:k9academy/utils/static_strings/static_strings.dart';
import 'package:k9academy/view/screens/home_screen/home_controller/home_controller.dart';
import 'package:k9academy/view/widgets/custom_text/custom_text.dart';

class CustomCommunityPostDetails extends StatelessWidget {
  CustomCommunityPostDetails({
    super.key,
    this.comment,
  });

  final Widget? comment;
  final HomeController homeController = Get.find<HomeController>();
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 40.w,
          ),
          Row(
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
                  imageUrl: AppImages.dog3,
                  height: 50,
                  width: 50,
                ),
              ),
              SizedBox(
                width: 10.w,
              ),
              const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomText(
                    text: "Diana Prince",
                    fontWeight: FontWeight.w500,
                  ),
                  CustomText(
                    text: "30m",
                    fontWeight: FontWeight.w500,
                  ),
                ],
              )
            ],
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 16.h,
                ),
                const CustomText(
                  textAlign: TextAlign.start,
                  maxLines: 7,
                  bottom: 10,
                  text:
                      "ultrices libero, hendrerit non ex ex. amet, vehicula, amet, Nam ultrices tortor. consectetur sapien ullamcorper lacus, dui enim. ex facilisis in Ut nec id vel ",
                ),

                ///============================See more================================
                GestureDetector(
                  onTap: () {
                    homeController.toggleTab();
                  },
                  child: Obx(() {
                    return homeController.isTab.value
                        ? CustomText(
                            textAlign: TextAlign.start,
                            text:
                                "ultrices libero, hendrerit non ex ex. amet, vehicula, amet, Nam ultrices tortor. consectetur sapien ullamcorper",
                            bottom: 15,
                            fontSize: 12.sp,
                            color: Colors.white,
                            maxLines: 10,
                          )
                        : CustomText(
                            text: 'See more',
                            bottom: 7,
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w500,
                            color: Colors.red,
                          );
                  }),
                ),

                ///=====================================Cover Image=====================
                ClipRRect(
                  borderRadius: BorderRadius.circular(16),
                  child: CustomNetworkImage(
                    imageUrl: AppConstants.onlineImage,
                    width: double.infinity,
                    height: 171,
                  ),
                ),

                ///=============================Comment =====================
                if (comment != null) comment!,
                SizedBox(
                  height: 15.w,
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
                    (index) => Row(
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
                        Container(
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
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 10.h,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
