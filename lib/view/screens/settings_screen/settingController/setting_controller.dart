import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:k9academy/services/api_check.dart';
import 'package:k9academy/services/api_client.dart';
import 'package:k9academy/services/app_url.dart';
import 'package:k9academy/utils/toast_message/toast_message.dart';

class SettingController extends GetxController {
  RxBool isChangeLoading = false.obs;
  TextEditingController oldPasswordController = TextEditingController();
  TextEditingController newPasswordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

  changePassword() async {
    isChangeLoading.value = true;
    refresh();
    Map<dynamic, String> body = {
      "oldPassword": oldPasswordController.text,
      "newPassword": newPasswordController.text,
      "confirm Password": confirmPasswordController.text
    };
    var response =
        await ApiClient.patchData(AppUrl.changePassword, jsonEncode(body));
    isChangeLoading.value = false;
    refresh();
    if (response.statusCode == 200) {
      // Get.toNamed(AppRoute.resetPass);
      toastMessage(message: response.body["message"]);
    } else {
      ApiChecker.checkApi(response);
    }
    isChangeLoading.value = false;
    refresh();
  }
}
