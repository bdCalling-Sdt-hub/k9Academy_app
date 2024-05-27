import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:k9academy/core/app_routes/app_routes.dart';
import 'package:k9academy/helper/network_img/network_img.dart';
import 'package:k9academy/utils/app_img/app_img.dart';
import 'package:k9academy/view/screens/home_screen/home_controller/home_controller.dart';
import 'package:k9academy/view/widgets/custom_community_post/custom_community_post.dart';

class TabBarPostScreen extends StatelessWidget {
  TabBarPostScreen({super.key});

  final HomeController homeController = Get.find<HomeController>();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
            children: List.generate(
          homeController.communityPostItems.length,
          (index) => Padding(
            padding: const EdgeInsets.symmetric(vertical: 15),
            child: CustomCommunityPost(
              comment: false,
              onTap: () {
                Get.toNamed(AppRoute.myPostDetails);
              },
              coverImage: homeController.communityPostItems[index],
              text: 'masum',
              profileImage: ClipRRect(
                borderRadius: BorderRadius.circular(30),
                child: CustomNetworkImage(
                  imageUrl: AppImages.dog3,
                  height: 30,
                  width: 30,
                ),
              ),
              dateTime: '10',
              popUpIcon: PopupMenuButton<String>(
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(10),
                      bottomLeft: Radius.circular(10),
                      bottomRight: Radius.circular(10)),
                ),
                onSelected: (value) {
                  // Handle the menu selection
                  print('Selected: $value');
                },
                itemBuilder: (BuildContext context) => <PopupMenuEntry<String>>[
                  PopupMenuItem<String>(
                    onTap: () {
                      Get.toNamed(AppRoute.postScreen);
                    },
                    value: 'edit',
                    child: Text('Edit'),
                  ),
                  const PopupMenuItem<String>(
                    value: 'delete',
                    child: Text('Delete'),
                  ),
                ],
                icon: const Icon(Icons.more_vert, color: Colors.white),
              ),
            ),
          ),
        )),
      ),
    );
  }
}
