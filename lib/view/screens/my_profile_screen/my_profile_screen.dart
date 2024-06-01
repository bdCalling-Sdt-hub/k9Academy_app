import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:k9academy/helper/network_img/network_img.dart';
import 'package:k9academy/utils/app_colors/app_colors.dart';
import 'package:k9academy/utils/app_const/app_const.dart';
import 'package:k9academy/utils/app_icons/app_icons.dart';
import 'package:k9academy/utils/static_strings/static_strings.dart';
import 'package:k9academy/view/screens/my_profile_screen/inner/tab_bar_package_screen.dart';
import 'package:k9academy/view/screens/my_profile_screen/inner/tab_bar_post_screen.dart';
import 'package:k9academy/view/screens/my_profile_screen/profile_controller/profile_controller.dart';
import 'package:k9academy/view/screens/schedule_screen/schedule_screen.dart';
import 'package:k9academy/view/widgets/custom_image/custom_image.dart';
import 'package:k9academy/view/widgets/custom_text/custom_text.dart';
import 'package:k9academy/view/widgets/nav_bar/nav_bar.dart';

import 'inner/profile_section.dart';
import 'inner/tab_bar_widgets.dart';

class MyProfileScreen extends StatelessWidget {
  MyProfileScreen({super.key});

  final ProfileController profileController = Get.find<ProfileController>();

  Widget buildCoverImage() => Obx(
        () => Container(
          color: Colors.grey,
          child: Stack(
            children: [
              profileController.coverImage.isNotEmpty
                  ? Image.file(
                      File(profileController.coverImage.value),
                      width: double.infinity,
                      height: 171,
                      fit: BoxFit.cover,
                    )
                  : CustomNetworkImage(
                      imageUrl: AppConstants.onlineImage,
                      width: double.infinity,
                      height: 171,
                    ),
              Positioned(
                right: 5,
                top: 10,
                child: GestureDetector(
                  onTap: () {
                    profileController.selectCoverImage();
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100),
                    ),
                    child: profileController.isAddItem.value
                        ? const SizedBox()
                        : const CustomImage(imageSrc: AppIcons.cemera),
                  ),
                ),
              ),
              Positioned(
                bottom: 10,
                right: 120,
                child: CustomText(
                  text: AppStaticStrings.mrDogLover,
                  fontSize: 17.sp,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ),
      );

  final double profileHeight = 120;

  Widget buildProfileImage() => Positioned(
        bottom: 20.h,
        left: 10,
        child: GestureDetector(
          onTap: () {
            profileController.selectImage();
          },
          child: Obx(
            () {
              return profileController.image.isNotEmpty
                  ? Stack(
                      alignment: Alignment.bottomRight,
                      clipBehavior: Clip.none,
                      fit: StackFit.loose,
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(100),
                          child: Image.file(
                            File(profileController.image.value),
                            height: profileHeight,
                            width: profileHeight,
                            fit: BoxFit.cover,
                          ),
                        ),
                        if (!profileController.isAddItem.value)
                          const CustomImage(imageSrc: AppIcons.cemera),
                      ],
                    )
                  : Stack(
                      alignment: Alignment.bottomRight,
                      children: [
                        CustomNetworkImage(
                          boxShape: BoxShape.circle,
                          imageUrl: AppConstants.onlineImage,
                          height: profileHeight,
                          width: profileHeight,
                        ),
                        if (!profileController.isAddItem.value)
                          const CustomImage(imageSrc: AppIcons.cemera),
                      ],
                    );
            },
          ),
        ),
      );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: const NavBar(currentIndex: 3),
      backgroundColor: AppColors.blackyDarkHover,
      appBar: AppBar(
        centerTitle: true,
        title: CustomText(
          text: AppStaticStrings.myProfile,
          color: AppColors.lightNormal,
          fontSize: 18.sp,
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height / 4,
            child: Stack(
              clipBehavior: Clip.none,
              children: [
                buildCoverImage(),
                buildProfileImage(),
              ],
            ),
          ),
          TabBarWidgets(profileController: profileController),
          const Divider(),
          SizedBox(
            height: 15.h,
          ),
          Obx(() {
            return Expanded(
              child: IndexedStack(
                index: profileController.selectedIndex.value,
                children: [
                  ProfileSection(
                    profileController: profileController,
                  ),
                  TabBarPostScreen(),
                  const TabBarPackageScreen(),
                  ScheduleScreen(),
                ],
              ),
            );
          }),
        ],
      ),
    );
  }
}
