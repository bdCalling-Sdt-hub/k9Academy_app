import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:k9academy/core/app_routes/app_routes.dart';
import 'package:k9academy/helper/network_img/network_img.dart';
import 'package:k9academy/utils/app_colors/app_colors.dart';
import 'package:k9academy/utils/app_const/app_const.dart';
import 'package:k9academy/utils/static_strings/static_strings.dart';
import 'package:k9academy/view/screens/post_screen/post_controller/post_controller.dart';
import 'package:k9academy/view/widgets/custom_text/custom_text.dart';
import 'package:k9academy/view/widgets/custom_text_field/custom_text_field.dart';
import 'package:k9academy/view/widgets/nav_bar/nav_bar.dart';

class PostScreen extends StatelessWidget {
  PostScreen({super.key});

  final PostController postController = Get.find<PostController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: const NavBar(currentIndex: 2),
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: () {
                Get.toNamed(AppRoute.myProfileScreen);
              },
              icon: Container(
                decoration: BoxDecoration(
                    color: AppColors.blueNormal,
                    borderRadius: BorderRadius.circular(8.r)),
                padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 15.w),
                child: const CustomText(
                  text: AppStaticStrings.post,
                  fontWeight: FontWeight.w500,
                ),
              ))
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 24),
        child: Column(
          children: [
            const CustomTextField(
              maxLines: 10,
            ),

            const SizedBox(
              height: 20,
            ),

            ///=========================== Image Picker =============================

            Obx(() {
              return GestureDetector(
                  onTap: () {
                    postController.selectImage();
                  },
                  child: postController.image.isNotEmpty
                      ? ClipRRect(
                          borderRadius: BorderRadius.circular(15),
                          child: Image.file(
                            File(postController.image.value),
                            fit: BoxFit.cover,
                          ),
                        )
                      : ClipRRect(
                          borderRadius: BorderRadius.circular(15),
                          child: CustomNetworkImage(
                            imageUrl: AppConstants.onlineImage,
                            height: MediaQuery.of(context).size.height / 2.5,
                            width: MediaQuery.of(context).size.width / 1,
                          ),
                        ));
            }),
          ],
        ),
      ),
    );
  }
}
