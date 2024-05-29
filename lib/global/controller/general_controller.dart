import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:k9academy/helper/shared_prefe/shared_prefe.dart';
import 'package:k9academy/services/api_check.dart';
import 'package:k9academy/services/api_client.dart';
import 'package:k9academy/services/app_url.dart';
import 'package:k9academy/utils/app_const/app_const.dart';
import 'package:k9academy/view/widgets/custom_loader/custom_loader.dart';

class GeneralController extends GetxController {
  final rxRequestStatus = Status.loading.obs;
  void setRxRequestStatus(Status value) => rxRequestStatus.value = value;

  ///========================== Show Popup Loader ========================
  showPopUpLoader() {
    return showDialog(
        barrierColor: Colors.transparent,
        context: Get.context!,
        builder: (_) {
          return const SizedBox(
            height: 70,
            child: AlertDialog(
              elevation: 0,
              backgroundColor: Colors.transparent,
              content: CustomLoader(),
            ),
          );
        });
  }

  ///========================== Get User ID ========================
  RxString userId = "".obs;

  getId() async {
    String id = await SharePrefsHelper.getString(AppConstants.profileID);

    userId.value = id;

    debugPrint("User Id Controller ======================>>>>>>>>>>>>$id");
    refresh();
  }

  ///========================== Pick Image ========================
  Rx<File> imageFile = File("").obs;
  RxString imagePath = "".obs;

  selectImage() async {
    final ImagePicker picker = ImagePicker();
    final XFile? getImages =
        await picker.pickImage(source: ImageSource.gallery, imageQuality: 15);
    if (getImages != null) {
      imageFile.value = File(getImages.path);
      imagePath.value = getImages.path;
    }
  }

  ///============================== Get Content (About us, Privacy Policy, Terms) ============================

  RxString about = "".obs;
  RxString privacy = "".obs;
  RxString terms = "".obs;

  getContent() async {
    setRxRequestStatus(Status.loading);
    var aboutRes = await ApiClient.getData(ApiUrl.aboutUs);
    var privacyRes = await ApiClient.getData(ApiUrl.privacy);
    var termsRes = await ApiClient.getData(ApiUrl.terms);

    if (aboutRes.statusCode == 200 &&
        privacyRes.statusCode == 200 &&
        termsRes.statusCode == 200) {
      about.value = aboutRes.body["data"]["description"];
      privacy.value = aboutRes.body["data"]["description"];
      terms.value = aboutRes.body["data"]["description"];
      setRxRequestStatus(Status.completed);
      refresh();
    } else {
      if (aboutRes.statusText == ApiClient.noInternetMessage ||
          privacyRes.statusText == ApiClient.noInternetMessage ||
          termsRes.statusText == ApiClient.noInternetMessage) {
        setRxRequestStatus(Status.internetError);
      } else {
        setRxRequestStatus(Status.error);
      }
      ApiChecker.checkApi(aboutRes);
      ApiChecker.checkApi(privacyRes);
      ApiChecker.checkApi(termsRes);
    }
  }

  @override
  void onInit() {
    getContent();
    getId();
    super.onInit();
  }
}
