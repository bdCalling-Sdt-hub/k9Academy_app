import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:k9academy/core/app_routes/app_routes.dart';
import 'package:k9academy/utils/app_colors/app_colors.dart';
import 'package:k9academy/utils/static_strings/static_strings.dart';
import 'package:k9academy/view/widgets/custom_button/custom_button.dart';
import 'package:k9academy/view/widgets/custom_text/custom_text.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class OtpVerify extends StatelessWidget {
  const OtpVerify({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 44.h),
        child: Column(
          children: [
            ///<=================================Title Text=====================================>
            const Center(
                child: CustomText(
              color: AppColors.blueNormal,
              text: AppStaticStrings.checkYourEmail,
              fontSize: 18,
              fontWeight: FontWeight.w500,
            )),
            const CustomText(
              text: AppStaticStrings.wehaveSendAnOTP,
              fontWeight: FontWeight.w400,
              fontSize: 12,
              maxLines: 3,
              top: 8,
            ),

            SizedBox(
              height: 68.h,
            ),

            ///<======================================Pin Code Field============================>

            Form(
              // key: fromKey,
              child: PinCodeTextField(
                cursorColor: AppColors.blackyDarkActive,
                keyboardType: TextInputType.number,
                // controller: pinController,
                enablePinAutofill: true,
                appContext: (context),
                onCompleted: (value) {
                  // controller.otp=value;
                },
                autoFocus: true,
                textStyle: const TextStyle(color: AppColors.blackyDarker),
                pinTheme: PinTheme(
                  disabledColor: Colors.transparent,
                  shape: PinCodeFieldShape.box,
                  borderRadius: BorderRadius.circular(12),
                  fieldHeight: 49.h,
                  fieldWidth: 47,
                  activeFillColor: AppColors.lightActive,
                  selectedFillColor: AppColors.light,
                  inactiveFillColor: AppColors.lightNormalActive,
                  borderWidth: 0.5,
                  errorBorderColor: Colors.red,
                  activeBorderWidth: 0.8,
                  selectedColor: AppColors.lightDarkHover,
                  inactiveColor: AppColors.lightDarkHover,
                  activeColor: AppColors.lightNormalHover,
                ),
                length: 4,
                enableActiveFill: true,
              ),
            ),

            SizedBox(
              height: 28.h,
            ),

            ///<==============================Resend Button=============================>

            Align(
              alignment: Alignment.centerRight,
              child: TextButton(
                  onPressed: () {},
                  child: TextButton(
                      onPressed: () {},
                      child:
                          const CustomText(text: AppStaticStrings.resendOTP))),
            ),

            SizedBox(
              height: 30.h,
            ),

            ///<================================== Verify Button ===========================>

            CustomButton(
              fillColor: AppColors.redNormal,
              onTap: () {
                Get.toNamed(AppRoute.subscription);
              },
              title: AppStaticStrings.verifyCode,
            ),
          ],
        ),
      ),
    );
  }
}
