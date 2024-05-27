import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:k9academy/core/app_routes/app_routes.dart';
import 'package:k9academy/helper/network_img/network_img.dart';
import 'package:k9academy/utils/app_colors/app_colors.dart';
import 'package:k9academy/utils/app_const/app_const.dart';
import 'package:k9academy/utils/app_img/app_img.dart';
import 'package:k9academy/utils/static_strings/static_strings.dart';
import 'package:k9academy/view/screens/home_screen/home_controller/home_controller.dart';
import 'package:k9academy/view/screens/my_profile_screen/profile_controller/profile_controller.dart';
import 'package:k9academy/view/widgets/custom_community_post/custom_community_post.dart';
import 'package:k9academy/view/widgets/custom_text/custom_text.dart';

class OtherProfile extends StatelessWidget {
  OtherProfile({super.key});

  ///=================================ProfileController===================================
  final ProfileController profileController = Get.find<ProfileController>();
  final HomeController homeController = Get.find<HomeController>();

  ///=================================CoverImage Widget===================================
  Widget buildCoverImage() => Container(
        color: Colors.grey,
        child: Stack(
          children: [
            CustomNetworkImage(
              imageUrl: AppConstants.onlineImage,
              width: double.infinity,
              height: 171,
            ),
            Positioned(
                bottom: 10,
                right: 120,
                child: CustomText(
                  text: "Masum Raj",
                  fontSize: 17.sp,
                  fontWeight: FontWeight.w600,
                ))
          ],
        ),
      );

  ///=================================profileImage===================================
  final double profileHeight = 120;

  Widget buildProfileImage() => CircleAvatar(
        radius: profileHeight / 2,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(100),
          child: CustomNetworkImage(
            imageUrl: AppConstants.onlineImage,
            height: profileHeight,
            width: 140,
          ),
        ),
      );

  @override
  Widget build(BuildContext context) {
    final top = 171 - profileHeight / 1.5;
    return Scaffold(
      backgroundColor: AppColors.blackyDarkHover,

      ///=================================ProfileAppbar===================================
      appBar: AppBar(
        backgroundColor: AppColors.blackyDarker,
        centerTitle: true,
        title: CustomText(
          text: AppStaticStrings.othersProfile,
          color: AppColors.lightNormal,
          fontSize: 18.sp,
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              clipBehavior: Clip.none,
              alignment: Alignment.center,
              children: [
                ///=================================Declaring cover image===================================
                buildCoverImage(),

                ///=================================Declaring Profile Image===================================
                Positioned(left: 10, top: top, child: buildProfileImage()),
              ],
            ),
            CustomText(
              top: 55,
              left: 15,
              text: AppStaticStrings.posts,
              fontSize: 14.sp,
              fontWeight: FontWeight.w500,
              bottom: 12,
            ),
            const Divider(
              color: Colors.black,
            ),
            Column(
              children: List.generate(
                  homeController.communityPostItems.length,
                  (index) => Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 16),
                        child: GestureDetector(
                          onTap: () {
                            Get.toNamed(AppRoute.communityPostDetails);
                          },

                          ///=======================================CustomCommunity PostDesign====================
                          child: CustomCommunityPost(
                              coverImage:
                                  homeController.communityPostItems[index],
                              text: "Jon Week",

                              dateTime: '3 may, 2024',
                              comment: false),
                        ),
                      )),
            )
          ],
        ),
      ),
    );
  }
}
