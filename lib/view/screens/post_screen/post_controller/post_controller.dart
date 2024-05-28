import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:k9academy/services/api_check.dart';
import 'package:k9academy/services/api_client.dart';
import 'package:k9academy/services/app_url.dart';
import 'package:k9academy/utils/toast_message/toast_message.dart';

class PostController extends GetxController {
  RxString image = "".obs;

  Rx<File> imageFile = File("").obs;

  selectImage() async {
    final ImagePicker picker = ImagePicker();
    final XFile? getImages =
        await picker.pickImage(source: ImageSource.gallery, imageQuality: 15);
    if (getImages != null) {
      imageFile.value = File(getImages.path);
      image.value = getImages.path;
    }
  }

  ///=============================PostMethod======================

  TextEditingController descriptionController = TextEditingController();
  RxBool isPostLoading = false.obs;

  Future<void> multipartRequest({Map<String, String>? header}) async {
    isPostLoading.value = true;
    update();
    try {
      var body = {
        "description": descriptionController.text,
      };
      var response = await ApiClient.postMultipartData(
          ApiUrl.postEndpoint, body,
          multipartBody: [
            MultipartBody("image", File(image.value)),
          ]);

      if (response.statusCode == 200) {
        toastMessage(message: response.body["message"]);
        isPostLoading.value = false;
        update();
      } else {
        ApiChecker.checkApi(response);
      }
    } catch (e) {
      debugPrint("============> $e");
    }
  }
}
