import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:k9academy/utils/app_colors/app_colors.dart';
import 'package:k9academy/utils/static_strings/static_strings.dart';
import 'package:k9academy/view/widgets/custom_button/custom_button.dart';
import 'package:k9academy/view/widgets/custom_text/custom_text.dart';
import 'package:k9academy/view/widgets/custom_text_field/custom_text_field.dart';

class ChangePasswordScreen extends StatelessWidget {
   ChangePasswordScreen({super.key});
 final formKey = GlobalKey<FormState>() ;
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: AppColors.blackyDarkHover,

      ///<<<<========================================Change Password AppBar======================================
      appBar: AppBar(
        title: CustomText(
          text: AppStaticStrings.changePassword,
          color: AppColors.lightNormal,
          fontSize: 18.sp,
        ),
        backgroundColor: AppColors.blackyDarker,
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 24),
          child: Form(
            // key: formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomText(
                  text: AppStaticStrings.oldPassword,
                  color: AppColors.lightNormal,
                  fontSize: 16.sp,
                  bottom: 10,
                ),

                ///<<<<========================================Current Password Field======================================
                const CustomTextField(
                  hintText: AppStaticStrings.password,
                  // textEditingController:profileController.currentPasswordController ,
                  keyboardType: TextInputType.name,
                  isPassword: true,
                  // validator: (value) {
                  //   if (value.isEmpty) {
                  //     return AppStrings.fieldCantBeEmpty;
                  //   } else if (value.length < 6 &&
                  //       !AppStrings.passRegExp.hasMatch(value)) {
                  //     return AppStrings.passwordValidatorString;
                  //   } else {
                  //     return null;
                  //   }
                  // },
                ),

                CustomText(
                  text: AppStaticStrings.newPassword,
                  color: AppColors.lightNormal,
                  fontSize: 16.sp,
                  bottom: 10,
                  top: 27,
                ),

                ///<<<<========================================NewPassword Field======================================
                const CustomTextField(
                  isPassword: true,
                  // textEditingController: profileController.newPasswordController,
                  keyboardType: TextInputType.name,
                  hintText: AppStaticStrings.password,
                  // validator: (value) {
                  //   if (value.isEmpty) {
                  //     return AppStrings.fieldCantBeEmpty;
                  //   } else if (value.length < 6 &&
                  //       !AppStrings.passRegExp.hasMatch(value)) {
                  //     return AppStrings.passwordValidatorString;
                  //   } else {
                  //     return null;
                  //   }
                  // },
                ),

                CustomText(
                  text: AppStaticStrings.confirmPassword,
                  color: AppColors.lightNormal,
                  fontSize: 16.sp,
                  bottom: 10,
                  top: 27,
                ),

                ///<<<<========================================Confirm Password Field======================================
                const CustomTextField(
                  // textEditingController: profileController.confirmPasswordController,
                  keyboardType: TextInputType.name,
                  hintText: AppStaticStrings.password,
                  isPassword: true,
                  // validator: (value) {
                  //   if (value.isEmpty) {
                  //     return AppStrings.fieldCantBeEmpty;
                  //   } else if (value != profileController.newPasswordController.text) {
                  //     return " Password should match";
                  //   }
                  //   return null;
                  // },
                ),
                SizedBox(
                  height: 40.h,
                ),

                ///<<<<========================================Save And Update Button======================================
                Center(
                  child: CustomButton(
                    fillColor: AppColors.redNormal,
                    width: 194,
                    onTap: () {},
                    title: AppStaticStrings.changePassword,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
