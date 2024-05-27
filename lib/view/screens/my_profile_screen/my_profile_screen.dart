import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:k9academy/helper/network_img/network_img.dart';
import 'package:k9academy/utils/app_colors/app_colors.dart';
import 'package:k9academy/utils/app_const/app_const.dart';
import 'package:k9academy/utils/app_icons/app_icons.dart';
import 'package:k9academy/utils/static_strings/static_strings.dart';
import 'package:k9academy/view/screens/my_profile_screen/inner/schedule_screen.dart';
import 'package:k9academy/view/screens/my_profile_screen/inner/tab_bar_package_screen.dart';
import 'package:k9academy/view/screens/my_profile_screen/inner/tab_bar_post_screen.dart';
import 'package:k9academy/view/screens/my_profile_screen/profile_controller/profile_controller.dart';
import 'package:k9academy/view/widgets/custom_image/custom_image.dart';
import 'package:k9academy/view/widgets/custom_text/custom_text.dart';
import 'package:k9academy/view/widgets/nav_bar/nav_bar.dart';

import 'inner/profile_section.dart';
import 'inner/tab_bar_widgets.dart';

class MyProfileScreen extends StatelessWidget {
  MyProfileScreen({super.key});

  ///=================================ProfileController===================================
  final ProfileController profileController = Get.find<ProfileController>();

  ///=================================CoverImage Widget===================================
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
                    child: const CustomImage(imageSrc: AppIcons.cemera),
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

  ///=================================profileImage Widget===================================
  final double profileHeight = 120;
  Widget buildProfileImage() => Obx(
        () => CircleAvatar(
          radius: profileHeight / 2,
          child: GestureDetector(
            onTap: () {
              profileController.selectImage();
            },
            child: profileController.image.isNotEmpty
                ? Stack(
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
                      Positioned(
                        bottom: 0,
                        right: 0,
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(100),
                          ),
                          child: const CustomImage(imageSrc: AppIcons.cemera),
                        ),
                      ),
                    ],
                  )
                : Stack(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(100),
                        child: CustomNetworkImage(
                          imageUrl: AppConstants.onlineImage,
                          height: profileHeight,
                          width: profileHeight,
                        ),
                      ),
                      Positioned(
                        bottom: 0,
                        right: 0,
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(100),
                          ),
                          child: const CustomImage(imageSrc: AppIcons.cemera),
                        ),
                      ),
                    ],
                  ),
          ),
        ),
      );

  @override
  Widget build(BuildContext context) {
    final top = 171 - profileHeight / 1.5;
    return Scaffold(
      bottomNavigationBar: const NavBar(currentIndex: 3),
      backgroundColor: AppColors.blackyDarkHover,

      ///=================================ProfileAppbar===================================
      appBar: AppBar(
        backgroundColor: AppColors.blackyDarker,
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
          Stack(
            clipBehavior: Clip.none,
            alignment: Alignment.center,
            children: [
              ///=================================Calling cover image===================================
              buildCoverImage(),

              ///=================================Calling Profile Image===================================
              Positioned(left: 10, top: top, child: buildProfileImage()),
            ],
          ),
          SizedBox(
            height: 50.h,
          ),

          ///================================= Inner 4 TabBar Widgets ===================================
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
                  ProfileSection(),
                  TabBarPostScreen(),
                  const TabBarPackageScreen(),
                  ScheduleScreen()
                ],
              ),
            );
          }),
        ],
      ),
    );
  }
}
