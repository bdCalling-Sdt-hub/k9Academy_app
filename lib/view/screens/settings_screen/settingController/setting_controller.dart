import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:k9academy/core/app_routes/app_routes.dart';
import 'package:k9academy/services/api_check.dart';
import 'package:k9academy/services/api_client.dart';
import 'package:k9academy/services/app_url.dart';
import 'package:k9academy/utils/toast_message/toast_message.dart';

class SettingController extends GetxController {
  RxBool isChangeLoading = false.obs;
  TextEditingController oldPasswordController = TextEditingController();
  TextEditingController newPasswordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();


  ///=================================Change Password ================================
  changePassword() async {
    isChangeLoading.value = true;
    refresh();
    Map<dynamic, String> body = {
      "oldPassword": oldPasswordController.text,
      "newPassword": newPasswordController.text,
      "confirmPassword": confirmPasswordController.text
    };
    var response =
        await ApiClient.patchData(AppUrl.changePassword, jsonEncode(body));
    isChangeLoading.value = false;
    refresh();
    if (response.statusCode == 200) {
      Get.back();
      toastMessage(message: response.body["message"]);

    } else {
      ApiChecker.checkApi(response);
    }
    isChangeLoading.value = false;
    refresh();
  }

  ///=====================================Delete Account======================

  RxBool isDeleteLoading = false.obs;
  deleteAccount() async {
    isDeleteLoading.value = true;
    refresh();
    Map<dynamic, String> body = {
      "email": emailController.text,
      "password": passwordController.text
    };
    var response =
        await ApiClient.deleteData(AppUrl.deleteAccount, body: body);
    isDeleteLoading.value = false;
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
