import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:k9academy/utils/app_img/app_img.dart';

class HomeController extends GetxController {
  ///================================BannerImage=========================
  final List<String> bannerImg = [
    AppImages.banner1,
    AppImages.banner2,
    AppImages.banner3,
  ];

  ///=========================Training Programs details List======================
  final List<String> trainingPrograms = [
    AppImages.dogImage,
    AppImages.dog2,
    AppImages.dog3,
    AppImages.dogImage,
    AppImages.dog2,
    AppImages.dog3,
  ];

  ///=========================communityPostItems======================

  final List<String> communityPostItems = [
    AppImages.dogImage,
    AppImages.dog2,
    AppImages.dog3,
    AppImages.dogImage,
    AppImages.dog2,
    AppImages.dog3,
  ];

  ///=========================communityProfileItems======================
  final List<String> communityProfileItems = [
    AppImages.dogImage,
    AppImages.dog2,
    AppImages.dog3,
    AppImages.dogImage,
    AppImages.dog2,
    AppImages.dog3,
  ];

  RxInt bannerIndex = 0.obs;
  Rx<PageController> pageController = PageController().obs;
  RxInt selectedFqw = 100000.obs;
  var isTab = false.obs;

  void toggleTab() {
    isTab.value = !isTab.value;
  }

  


}
