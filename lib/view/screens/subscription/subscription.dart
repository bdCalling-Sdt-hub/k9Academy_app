import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:k9academy/core/app_routes/app_routes.dart';
import 'package:k9academy/utils/app_colors/app_colors.dart';
import 'package:k9academy/utils/app_icons/app_icons.dart';
import 'package:k9academy/utils/app_img/app_img.dart';
import 'package:k9academy/utils/static_strings/static_strings.dart';
import 'package:k9academy/view/screens/subscription/subscription_controller/subscription_controller.dart';
import 'package:k9academy/view/widgets/custom_button/custom_button.dart';
import 'package:k9academy/view/widgets/custom_image/custom_image.dart';
import 'package:k9academy/view/widgets/custom_text/custom_text.dart';
import 'package:k9academy/view/widgets/custom_text_field/custom_text_field.dart';

class Subscription extends StatelessWidget {
  Subscription({super.key});

  final SubscriptionController subscriptionController =
      Get.find<SubscriptionController>();

  void showDialogBox(BuildContext context, int index) {
    Get.dialog(
      barrierDismissible: false,
      AlertDialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
          side: BorderSide(
            color: Colors.white.withOpacity(0.2), // Set your border color here
            width: 2,
          ),
        ),
        backgroundColor: AppColors.blackyDarker.withOpacity(0.3),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            CustomText(
              text: AppStaticStrings.enterYourPromocodeHere,
              fontSize: 16.sp,
              fontWeight: FontWeight.w600,
              bottom: 30,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: List.generate(
                subscriptionController
                    .subscriptionList[index]["features"].length,
                (featureIndex) => Padding(
                  padding: const EdgeInsets.only(bottom: 10),
                  child: Row(
                    children: [
                      CustomImage(
                        imageSrc: AppIcons.checkDone,
                        size: 30.sp,
                      ),
                      CustomText(
                        text: subscriptionController.subscriptionList[index]
                            ["features"][featureIndex],
                        left: 10,
                        fontWeight: FontWeight.w400,
                        fontSize: 14.sp,
                      ),
                    ],
                  ),
                ),
              ),
            ),
            ///=============================Enter Your Promocode here Text Field=================
            const CustomTextField(
              inputTextStyle: TextStyle(color: Colors.black),
              fillColor: Colors.white,
              hintText: AppStaticStrings.enterYourPromocodeHere,
            ),
            SizedBox(
              height: 15.h,
            ),
            ///=============================Confirm Button=================
            CustomButton(
              onTap: () {
                subscriptionController.isPromoCode.value =
                    !subscriptionController.isPromoCode.value;

                subscriptionController.isPromoCode.refresh();
                navigator!.pop();
              },
              title: AppStaticStrings.confirm,
              fillColor: AppColors.blueNormal,
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const CustomText(
          text: AppStaticStrings.subscriptionPlan,
          fontSize: 16,
          fontWeight: FontWeight.w500,
        ),
      ),
      body: Obx(() {
        var data= subscriptionController.subscription.value.title;
        return Stack(
          children: [
            ///=====================================BackGround Images=====================
            Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage(AppImages.packageBG),
                ),
              ),
            ),
            if (!subscriptionController.isPromoCode.value)
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: List.generate(
                      subscriptionController.subscriptionList.length, (index) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 25),
                      child: Container(
                        padding: const EdgeInsets.all(25),
                        width: MediaQuery.of(context).size.width / 1.3,
                        decoration: BoxDecoration(
                          color: AppColors.blackyDarker.withOpacity(0.3),
                          borderRadius: BorderRadius.circular(15.0),
                          border: Border.all(
                            color: Colors.white.withOpacity(0.2),
                          ),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            ///===========================Title================
                            CustomText(
                              text: subscriptionController
                                  .subscriptionList[index]["category"],
                              fontSize: 24.sp,
                              fontWeight: FontWeight.w500,
                              bottom: 16,
                              top: 20,
                            ),
                            ///==========================Amount=================
                            CustomText(
                              text: subscriptionController
                                  .subscriptionList[index]["amount"],
                              fontSize: 24.sp,
                              fontWeight: FontWeight.w500,
                              bottom: 16,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: List.generate(
                                subscriptionController
                                    .subscriptionList[index]["features"].length,
                                (featureIndex) => Padding(
                                  padding: const EdgeInsets.only(bottom: 10),
                                  child: Row(
                                    children: [
                                      CustomImage(
                                        imageSrc: AppIcons.checkDone,
                                        size: 30.sp,
                                      ),
                                      CustomText(
                                        text: subscriptionController
                                                .subscriptionList[index]
                                            ["features"][featureIndex],
                                        left: 10,
                                        fontWeight: FontWeight.w400,
                                        fontSize: 14.sp,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 15.h,
                            ),
                            ///================================Make Payment Button============
                            Align(
                              alignment: Alignment.center,
                              child: CustomButton(
                                fillColor: AppColors.redNormal,
                                width: MediaQuery.of(context).size.width / 2,
                                onTap: () {
                                  print("=========================title $data");
                                  subscriptionController.getSubscription();
                                },
                                title: AppStaticStrings.makePayment,
                              ),
                            ),
                            SizedBox(
                              height: 24.h,
                            ),
                          ],
                        ),
                      ),
                    );
                  }),
                ),
              ),
            Positioned(
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    ///=====================================Have you Promo Code=============
                    CustomText(
                      text: AppStaticStrings.haveYourPromoCode,
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w600,
                      color: AppColors.light,
                      bottom: 20,
                    ),

                    ///===================================Use Promo  Code button==============

                    CustomButton(
                      fillColor: AppColors.blueNormal,
                      width: MediaQuery.of(context).size.width / 2,
                      onTap: () {
                        subscriptionController.isPromoCode.value =
                            !subscriptionController.isPromoCode.value;

                        subscriptionController.isPromoCode.refresh();
                        showDialogBox(
                            context, 0); // Pass the correct index here
                      },
                      title: AppStaticStrings.usePromoCode,
                    ),
                    ///=============================Skip Button========================
                    GestureDetector(
                      onTap: () {
                        Get.toNamed(AppRoute.homeScreen);
                      },
                      child: CustomText(
                        text: "Skip",
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w600,
                        color: AppColors.light,
                        bottom: 20,
                        top: 15,
                        decoration: TextDecoration.underline,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        );
      }),
    );
  }
}
