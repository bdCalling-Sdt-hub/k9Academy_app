import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:k9academy/helper/shared_prefe/shared_prefe.dart';
import 'package:k9academy/utils/app_const/app_const.dart';
import 'package:k9academy/view/widgets/custom_loader/custom_loader.dart';

class GeneralController extends GetxController {
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

  @override
  void onInit() {
    getId();
    super.onInit();
  }
}
