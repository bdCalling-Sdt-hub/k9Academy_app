import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:k9academy/core/app_routes/app_routes.dart';
import 'package:k9academy/utils/app_img/app_img.dart';
import 'package:k9academy/view/screens/home_screen/home_controller/home_controller.dart';
import 'package:k9academy/view/screens/post_screen/post_controller/post_controller.dart';
import 'package:k9academy/view/widgets/custom_community_post/custom_community_post.dart';

class TabBarPostScreen extends StatelessWidget {
  TabBarPostScreen({super.key});

  final HomeController homeController = Get.find<HomeController>();
  final PostController postController = Get.find<PostController>();

  @override
  Widget build(BuildContext context) {
    var data = postController.postData.value.user?.name;
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
            children: List.generate(

          homeController.communityPostItems.length,
          (index) => Padding(

            padding: const EdgeInsets.symmetric(vertical: 15),
            child: CustomCommunityPost(

              profileImage: AppImages.dog3,

              comment: false,
              onTap: () {
                print("MyPost===================================================$data");
                postController.getMyPost();
                // Get.toNamed(AppRoute.myPostDetails);
              },
              coverImage: homeController.communityPostItems[index],
              text: 'masum',

              dateTime: '10',

            ),
          ),
        )),
      ),
    );
  }
}
