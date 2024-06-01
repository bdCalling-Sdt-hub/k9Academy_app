import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:k9academy/helper/network_img/network_img.dart';
import 'package:k9academy/utils/app_colors/app_colors.dart';
import 'package:k9academy/utils/app_const/app_const.dart';
import 'package:k9academy/utils/app_img/app_img.dart';
import 'package:k9academy/utils/static_strings/static_strings.dart';
import 'package:k9academy/view/screens/net_connection_screen/net_connection_screen.dart';
import 'package:k9academy/view/screens/other_profile/controller/otherProfile_controller.dart';
import 'package:k9academy/view/widgets/custom_community_post/custom_community_post.dart';
import 'package:k9academy/view/widgets/custom_loader/custom_loader.dart';
import 'package:k9academy/view/widgets/custom_text/custom_text.dart';
import 'package:k9academy/view/widgets/error/genarel_error.dart';

class OtherProfile extends StatefulWidget {
  const OtherProfile({super.key});

  @override
  State<OtherProfile> createState() => _OtherProfileState();
}

class _OtherProfileState extends State<OtherProfile> {
  ///=================================CoverImage Widget===================================
  Widget buildCoverImage() => Container(
        color: Colors.grey,
        child: Stack(
          children: [
            CustomNetworkImage(
              imageUrl: otherProfileController
                      .otherProfile.value.userInfo?.coverImage ??
                  "",
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

  final OtherProfileController otherProfileController =
      Get.put(OtherProfileController());

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

  OtherProfileController otherProfile = Get.find<OtherProfileController>();

  String id = Get.arguments;

  double top = 0.0;

  @override
  void initState() {
    otherProfile.getOtherProfile(id: id);

    top = 171 - profileHeight / 1.5;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
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
        body: Obx(() {
          switch (otherProfileController.rxRequestStatus.value) {
            case Status.loading:
              return const CustomLoader();
            case Status.internetError:
              return NoInternetScreen(
                onTap: () {
                  otherProfileController.getOtherProfile(id: id);
                  // otherProfileController.getOtherProfile(id);
                },
              );
            case Status.error:
              return GeneralErrorScreen(
                onTap: () {
                  otherProfileController.getOtherProfile(id: id);
                  // otherProfileController.getOtherProfile(id);
                },
              );

            case Status.completed:
              return SingleChildScrollView(
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
                        Positioned(
                            left: 10, top: top, child: buildProfileImage()),
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
                      children: List.generate(4, (index) {
                        // var data = otherProfileController.otherPost[index];
                        return Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 20, vertical: 16),
                          child: GestureDetector(
                            onTap: () {
                              // Get.toNamed(
                              //     AppRoute.communityPostDetails);
                            },

                            ///=======================================CustomCommunity PostDesign====================
                            child: CustomCommunityPost(
                              userId: "",
                              profileImage: AppImages.dog3,
                              coverImage: AppImages.dogImage,
                              text: "masum",
                              dateTime: '3 may, 2024',
                              comment: false,
                            ),
                          ),
                        );
                      }),
                    )
                  ],
                ),
              );
          }
        }));
  }
}
