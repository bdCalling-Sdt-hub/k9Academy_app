import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:k9academy/core/app_routes/app_routes.dart';
import 'package:k9academy/utils/app_img/app_img.dart';
import 'package:k9academy/utils/static_strings/static_strings.dart';
import 'package:k9academy/view/screens/home_screen/home_controller/home_controller.dart';
import 'package:k9academy/view/widgets/custom_community_post/custom_community_post.dart';
import 'package:k9academy/view/widgets/custom_text/custom_text.dart';
import 'package:k9academy/view/widgets/nav_bar/nav_bar.dart';
import 'inner/home_appbar.dart';
import 'inner/side_drawer.dart';
import '../training_programms/training_programs.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});
 final HomeController homeController = Get.find();
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,

      ///===================================Side Drawer=============================
      drawer: SideDrawer(),
      bottomNavigationBar: const NavBar(currentIndex: 0),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(vertical: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ///====================== Home AppBar and banner =======================
            HomeAppBar(scaffoldKey: scaffoldKey),
            SizedBox(
              height: 10.w,
            ),

            ///============================Training programs======================
            TrainingPrograms(),

            ///============================Community Post======================
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: CustomText(
                textAlign: TextAlign.start,
                text: AppStaticStrings.communityPost,
                fontSize: 18.sp,
                fontWeight: FontWeight.w700,
                bottom: 10,
                top: 10,
              ),
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
                            profileImage: AppImages.dog3,
                            popUpIcon: false,
                            coverImage:
                                homeController.communityPostItems[index],
                            text: "Jon Week",
                            dateTime: '3 may, 2024',
                          ),
                        ),
                      )),
            )
          ],
        ),
      ),
    );
  }
}
