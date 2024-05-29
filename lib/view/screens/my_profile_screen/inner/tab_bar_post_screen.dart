import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:k9academy/core/app_routes/app_routes.dart';
import 'package:k9academy/helper/time_converter/time_converter.dart';
import 'package:k9academy/services/app_url.dart';
import 'package:k9academy/utils/app_const/app_const.dart';
import 'package:k9academy/utils/app_img/app_img.dart';
import 'package:k9academy/view/screens/home_screen/home_controller/home_controller.dart';
import 'package:k9academy/view/screens/net_connection_screen/net_connection_screen.dart';
import 'package:k9academy/view/screens/post_screen/post_controller/post_controller.dart';
import 'package:k9academy/view/widgets/custom_community_post/custom_community_post.dart';
import 'package:k9academy/view/widgets/custom_loader/custom_loader.dart';
import 'package:k9academy/view/widgets/error/genarel_error.dart';

class TabBarPostScreen extends StatelessWidget {
  TabBarPostScreen({super.key});

  final HomeController homeController = Get.find<HomeController>();
  final PostController postController = Get.find<PostController>();

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      switch (postController.rxRequestStatus.value) {
        case Status.loading:
          return const CustomLoader();
        case Status.internetError:
          return NoInternetScreen(
            onTap: () {
              postController.getMyPost();
            },
          );
        case Status.error:
          return GeneralErrorScreen(
            onTap: () {
              postController.getMyPost();
            },
          );

        case Status.completed:
          return SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                  children:
                      List.generate(postController.postData.length, (index) {
                var data = postController.postData[index];
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 15),
                  child: CustomCommunityPost(
                    profileImage:  "${ApiUrl.baseUrl}${data.user?.profileImage ?? ""}",
                    comment: false,
                    onTap: () {
                      Get.toNamed(AppRoute.myPostDetails);

                    },
                    coverImage: "${ApiUrl.baseUrl}${data.image ?? ""}",
                    text: data.user?.name ?? "",
                    dateTime: DateConverter.formatTime(
                        "${data.createdAt ?? DateTime.now()}"),
                  ),
                );
              })),
            ),
          );
      }
    });
  }
}
