import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:k9academy/services/api_client.dart';
import 'package:k9academy/services/app_url.dart';
import 'package:k9academy/utils/app_const/app_const.dart';
import 'package:k9academy/utils/app_img/app_img.dart';

class HomeController extends GetxController {
  final rxRequestStatus = Status.loading.obs;
  void setRxRequestStatus(Status value) => rxRequestStatus.value = value;

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

  ///========================== Banner ===========================
  // Future<bool> getBanner() async {
  //   setRxRequestStatus(Status.loading);
  //   refresh();
  //   var response = await ApiClient.getData(ApiUrl.baseUrl);

  //   if (response.statusCode == 200) {
  //     formData.value =
  //         List<Datum>.from(response.body["data"].map((x) => Datum.fromJson(x)));

  //     originalFormLength.value = formData.length;

  //     formList.add({AppStrings.key: formData});

  //     debugPrint("Value data=>>>== ${formList[0][AppStrings.key]!.length}");

  //     debugPrint("Original Length ============>>>>>>>>>>> $originalFormLength");

  //     setRxRequestStatus(Status.completed);
  //   } else {
  //     if (response.statusText == ApiClient.noInternetMessage) {
  //       setRxRequestStatus(Status.internetError);
  //     } else {
  //       setRxRequestStatus(Status.error);
  //     }
  //     ApiChecker.checkApi(response);
  //   }
  // }

  void toggleTab() {
    isTab.value = !isTab.value;
  }
}
