import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:k9academy/core/app_routes/app_routes.dart';
import 'package:k9academy/utils/app_colors/app_colors.dart';
import 'package:k9academy/utils/static_strings/static_strings.dart';
import 'package:k9academy/view/widgets/custom_button/custom_button.dart';
import 'package:k9academy/view/widgets/custom_text/custom_text.dart';
import 'package:k9academy/view/widgets/custom_text_field/custom_text_field.dart';

class ForgotPassWord extends StatelessWidget {
  ForgotPassWord({super.key});

  final fromKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const CustomText(
          text: AppStaticStrings.forgotPassWord,
          fontSize: 16,
          fontWeight: FontWeight.w500,
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 44.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ///<========================================Title text=========================================================>

              const Center(
                child: CustomText(
                  color: AppColors.blueNormal,
                  text: AppStaticStrings.emailConfirmation,
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),

              SizedBox(
                height: 77.h,
              ),
              Form(
                  key: fromKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ///<========================================Email Section=========================================================>
                      CustomText(
                        text: AppStaticStrings.email,
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                        bottom: 8.h,
                        top: 8.h,
                      ),
                      CustomTextField(
                        validator: (value) {
                          if (value.isEmpty) {
                            return AppStaticStrings.fieldCantBeEmpty;
                          } else if (value.length < 8) {
                            return AppStaticStrings.enterValidEmail;
                          } else if (!AppStaticStrings.emailRegexp
                              .hasMatch(value)) {
                            return AppStaticStrings.enterValidEmail;
                          } else {
                            return null;
                          }
                        },
                        hintText: AppStaticStrings.email,
                      ),
                    ],
                  )),

              Column(
                children: [
                  SizedBox(height: 76.h),

                  ///<==============================================Send Otp button===============================================>
                  CustomButton(
                    fillColor: AppColors.redNormal,
                    onTap: () {
                      Get.toNamed(AppRoute.otpVerify);
                    },
                    title: AppStaticStrings.sendACode,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
