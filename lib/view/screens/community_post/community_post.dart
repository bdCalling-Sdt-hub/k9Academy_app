import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:k9academy/core/app_routes/app_routes.dart';
import 'package:k9academy/helper/network_img/network_img.dart';
import 'package:k9academy/utils/app_img/app_img.dart';
import 'package:k9academy/view/screens/home_screen/home_controller/home_controller.dart';
import 'package:k9academy/view/widgets/custom_community_post/custom_community_post.dart';

class CommunityPost extends StatelessWidget {
  CommunityPost({super.key});

  final HomeController homeController = Get.find<HomeController>();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: List.generate(
          homeController.communityPostItems.length,
          (index) => Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
                child: GestureDetector(
                  onTap: () {
                    Get.toNamed(AppRoute.communityPostDetails);
                  },

                  ///=======================================CustomCommunity PostDesign====================
                  child: CustomCommunityPost(
                    coverImage: homeController.communityPostItems[index],
                    text: "Jon Week",
                    profileImage: GestureDetector(
                      onTap: () {
                        Get.toNamed(AppRoute.otherProfile);
                      },
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(30),
                        child: CustomNetworkImage(
                          imageUrl: AppImages.dog3,
                          height: 30,
                          width: 30,
                        ),
                      ),
                    ),
                    dateTime: '3 may, 2024',
                  ),
                ),
              )),
    );
  }
}
