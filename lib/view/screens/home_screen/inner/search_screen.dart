import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:k9academy/utils/app_colors/app_colors.dart';
import 'package:k9academy/utils/static_strings/static_strings.dart';
import 'package:k9academy/view/screens/home_screen/home_controller/home_controller.dart';
import 'package:k9academy/view/widgets/custom_text/custom_text.dart';
import 'package:k9academy/view/widgets/custom_text_field/custom_text_field.dart';
import 'package:k9academy/view/widgets/custom_widgets/custom_widgets.dart';

class SearchScreen extends StatelessWidget {
  SearchScreen({super.key});

  final HomeController homeController = Get.find<HomeController>();
  final CustomWidgets customWidget = CustomWidgets();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.blackyDarkHover,

      ///=============================Search Appbar=======================
      appBar: AppBar(
        backgroundColor: AppColors.blackyDarker,
        centerTitle: true,
        title: CustomText(
          text: AppStaticStrings.search,
          fontWeight: FontWeight.w600,
          fontSize: 20.sp,
        ),
      ),
      body: Column(
        children: [
          ///============================Search Field=======================
          Container(
            width: double.infinity,
            color: AppColors.blackyDark,
            child: const Padding(
              padding: EdgeInsets.symmetric(horizontal: 22, vertical: 12),
              child: CustomTextField(
                  fillColor: AppColors.lightDarkActive,
                  hintText: AppStaticStrings.searchHere,
                  hintStyle: TextStyle(color: AppColors.lightNormalActive),
                  isPrefixIcon: true,
                  borderRadius: 25),
            ),
          ),
          Expanded(
              child: ListView.builder(
                  itemCount: homeController.trainingPrograms.length,
                  itemBuilder: (context, index) {
                    return customWidget.customTrainingDetailsCard(
                        image: homeController.trainingPrograms[index],
                        text: "We provide e-collar",
                        onTap: () {});
                  }))
        ],
      ),
    );
  }
}
