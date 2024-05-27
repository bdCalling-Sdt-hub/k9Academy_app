import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:k9academy/services/api_check.dart';
import 'package:k9academy/services/api_client.dart';
import 'package:k9academy/services/app_url.dart';
import 'package:k9academy/utils/app_const/app_const.dart';
import 'package:k9academy/utils/app_img/app_img.dart';
import 'package:k9academy/view/screens/home_screen/model/training_details.dart';
import 'package:k9academy/view/screens/home_screen/model/training_programs.dart';

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

  ///========================== Training Programms ===========================
  RxList<TrainingDatum> trainingList = <TrainingDatum>[].obs;

  Future<bool> getTrainingProgramm() async {
    setRxRequestStatus(Status.loading);
    refresh();
    var response = await ApiClient.getData(ApiUrl.trainingPrograms);

    if (response.statusCode == 200) {
      trainingList.value = List<TrainingDatum>.from(
          response.body["data"].map((x) => TrainingDatum.fromJson(x)));

      return true;
    } else {
      if (response.statusText == ApiClient.noInternetMessage) {
        setRxRequestStatus(Status.internetError);
      } else {
        setRxRequestStatus(Status.error);
      }
      ApiChecker.checkApi(response);

      return false;
    }
  }

  ///========================== Training Programms Details ===========================

  RxList<TrainingDetailsDatum> trainingDetails = <TrainingDetailsDatum>[].obs;

  getTrainingDetails({required String id}) async {
    setRxRequestStatus(Status.loading);
    refresh();
    var response = await ApiClient.getData(ApiUrl.trainingDetails(id: id));

    if (response.statusCode == 200) {
      trainingDetails.value = List<TrainingDetailsDatum>.from(
          response.body["data"].map((x) => TrainingDetailsDatum.fromJson(x)));
      setRxRequestStatus(Status.completed);

      refresh();
    } else {
      if (response.statusText == ApiClient.noInternetMessage) {
        setRxRequestStatus(Status.internetError);
      } else {
        setRxRequestStatus(Status.error);
      }
      ApiChecker.checkApi(response);

      refresh();
    }
  }

//// ========================== All API Here ==============================

  homeScreenAPIs() async {
    bool training = await getTrainingProgramm();

    if (training) {
      setRxRequestStatus(Status.completed);
      refresh();
    }
  }

  void toggleTab() {
    isTab.value = !isTab.value;
  }

  @override
  void onInit() {
    homeScreenAPIs();
    super.onInit();
  }
}
