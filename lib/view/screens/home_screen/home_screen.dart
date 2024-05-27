import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:k9academy/utils/static_strings/static_strings.dart';
import 'package:k9academy/view/screens/community_post/community_post.dart';
import 'package:k9academy/view/widgets/custom_text/custom_text.dart';
import 'package:k9academy/view/widgets/nav_bar/nav_bar.dart';
import 'inner/home_appbar.dart';
import 'inner/side_drawer.dart';
import '../training_programms/training_programs.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,

      ///===================================Side Drawer=============================
      drawer: SideDrawer(),
      bottomNavigationBar: const NavBar(currentIndex: 0),
      body: SingleChildScrollView(
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
            CommunityPost()
          ],
        ),
      ),
    );
  }
}
