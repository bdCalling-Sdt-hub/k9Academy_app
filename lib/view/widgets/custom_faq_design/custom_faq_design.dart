import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:k9academy/utils/app_colors/app_colors.dart';
import 'package:k9academy/view/screens/home_screen/home_controller/home_controller.dart';
import 'package:k9academy/view/widgets/custom_text/custom_text.dart';
import 'package:k9academy/view/widgets/expanded_animation/expanded_animation.dart';

class FaqDesign extends StatelessWidget {
  FaqDesign({super.key, required this.faqList});

  final List<Map<String, String>> faqList;

  final HomeController homeController = Get.find<HomeController>();
  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return Column(
        children: List.generate(faqList.length, (index) {
          return Padding(
            padding: EdgeInsets.only(bottom: 15.h),
            child: Column(
              children: [
                ///==================== Question Design =====================
                GestureDetector(
                  onTap: () {
                    if (homeController.selectedFqw.value == index) {
                      homeController.selectedFqw.value = 100000;
                    } else {
                      homeController.selectedFqw.value = index;
                    }

                    homeController.selectedFqw.refresh();
                  },
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 10.w),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: AppColors.blackyNormalActive,
                        border: Border.all(color: AppColors.blueNormal)),
                    child: Row(
                      children: [
                        Expanded(
                            child: CustomText(
                          textAlign: TextAlign.left,
                          text: faqList[index]["que"]!,
                          fontWeight: FontWeight.w500,
                        )),
                        IconButton(
                            onPressed: () {
                              if (homeController.selectedFqw.value == index) {
                                homeController.selectedFqw.value = 100000;
                              } else {
                                homeController.selectedFqw.value = index;
                              }

                              homeController.selectedFqw.refresh();
                            },
                            icon: homeController.selectedFqw.value == index
                                ? const Icon(
                                    Icons.keyboard_arrow_down_rounded,
                                    color: AppColors.blueNormal,
                                  )
                                : const Icon(
                                    Icons.keyboard_arrow_right_rounded,
                                    color: AppColors.blueNormal,
                                  ))
                      ],
                    ),
                  ),
                ),

                ///==================== Ans Design =====================

                index == homeController.selectedFqw.value
                    ? CustomExpandedSection(
                        expand: index == homeController.selectedFqw.value
                            ? true
                            : false,
                        child: Container(
                          margin: const EdgeInsets.only(top: 8),
                          padding: EdgeInsets.all(8.r),
                          alignment: Alignment.center,
                          height: 100.h,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: AppColors.lightDarkActive,
                            borderRadius: BorderRadius.circular(8.r),
                          ),
                          child: CustomText(
                            textAlign: TextAlign.left,
                            text: faqList[index]["ans"]!,
                            maxLines: 6,
                          ),
                        ))
                    : const SizedBox()
              ],
            ),
          );
        }),
      );
    });
  }
}
