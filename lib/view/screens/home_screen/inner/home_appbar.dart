import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:k9academy/core/app_routes/app_routes.dart';
import 'package:k9academy/utils/app_colors/app_colors.dart';
import 'package:k9academy/view/screens/home_screen/home_controller/home_controller.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import '../../../../helper/network_img/network_img.dart';
import '../../../../utils/app_const/app_const.dart';
import '../../../../utils/static_strings/static_strings.dart';
import '../../../widgets/custom_text/custom_text.dart';
import '../../../widgets/custom_text_field/custom_text_field.dart';

class HomeAppBar extends StatelessWidget {
  HomeAppBar({
    super.key,
    required this.scaffoldKey,
  });

  final GlobalKey<ScaffoldState> scaffoldKey;
  final HomeController homeController = Get.find<HomeController>();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      color: AppColors.homeScreenBackground,
      margin: EdgeInsets.only(
        top: 32.h,
      ),
      padding: const EdgeInsets.symmetric(horizontal: 17, vertical: 8),
      child: Column(
        children: [
          ///====================================Top Section================================
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  ///==================== Profile =====================
                  CustomNetworkImage(
                      boxShape: BoxShape.circle,
                      imageUrl: AppConstants.onlineImage,
                      height: 60,
                      width: 60),

                  SizedBox(
                    width: 16.w,
                  ),

                  const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomText(
                        text: AppStaticStrings.welcome,
                        color: AppColors.blueNormal,
                        fontSize: 14,
                      ),
                      CustomText(
                        text: AppStaticStrings.mrDogLover,
                        fontWeight: FontWeight.w600,
                        fontSize: 16,
                      )
                    ],
                  )
                ],
              ),
              Row(
                children: [
                  ///<==================== notification ====================>
                  IconButton(
                      onPressed: () {
                        Get.toNamed(AppRoute.notificationScreen);
                      },
                      icon: const Icon(
                        Icons.notifications,
                        color: AppColors.lightNormal,
                      )),

                  ///<==================== Menu Bar ====================>
                  IconButton(
                      onPressed: () {
                        scaffoldKey.currentState?.openDrawer();
                      },
                      icon: const Icon(
                        Icons.menu,
                        color: AppColors.lightNormal,
                      ))
                ],
              )
            ],
          ),

          ///====================================Search Section================================

          SizedBox(
            height: 16.h,
          ),
          CustomTextField(
              fillColor: AppColors.lightDarkActive,
              onTapClick: () {
                Get.toNamed(AppRoute.searchScreen);
              },
              readOnly: true,
              hintText: AppStaticStrings.searchHere,
              hintStyle: const TextStyle(color: AppColors.lightNormalActive),
              isPrefixIcon: true,
              borderRadius: 25),

          ///====================== Banner =======================
          Obx(() => Column(
                children: [
                  CarouselSlider(
                    options: CarouselOptions(
                      height: 160.0.h,
                      autoPlay: true,
                      autoPlayCurve: Curves.ease,
                      pageSnapping: false,
                      onPageChanged: (int index, reason) {
                        homeController.bannerIndex.value = index;
                        homeController.pageController.value = PageController(
                            initialPage: homeController.bannerIndex.value);
                      },
                    ),
                    items: homeController.bannerImg.map((imagePath) {
                      return Builder(
                        builder: (BuildContext context) {
                          return Container(
                            width: 300.w,
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                    image: AssetImage(imagePath))),
                          );
                        },
                      );
                    }).toList(),
                  ),
                  SmoothPageIndicator(
                    controller: homeController.pageController.value,
                    count: homeController.bannerImg.length,
                    axisDirection: Axis.horizontal,
                    effect: const ExpandingDotsEffect(
                      expansionFactor: 3,
                      spacing: 8.0,
                      dotWidth: 28.0,
                      dotHeight: 6.0,
                      paintStyle: PaintingStyle.fill,
                      strokeWidth: 1.5,
                      dotColor: AppColors.redLight,
                      activeDotColor: AppColors.redNormal,
                    ),
                  ),
                ],
              )),
        ],
      ),
    );
  }
}
