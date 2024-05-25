import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:k9academy/core/app_routes/app_routes.dart';
import 'package:k9academy/services/api_check.dart';
import 'package:k9academy/services/api_client.dart';
import 'package:k9academy/services/app_url.dart';
import 'package:k9academy/utils/toast_message/toast_message.dart';

class AuthenticationController extends GetxController {
  TextEditingController fullNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController signupEmailController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController signupPasswordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  TextEditingController newPasswordController = TextEditingController();

  ///=================================SignUp Controller========================
  RxBool isSignUpLoading = false.obs;

  signUpUser() async {
    isSignUpLoading.value = true;
    refresh();
    Map<String, String> body = {
      "name": fullNameController.text,
      "email": signupEmailController.text,
      "phone_number": phoneNumberController.text,
      "password": signupPasswordController.text,
      "confirm passwor": confirmPasswordController.text,
      "gender": "",
      "date_of_birth": ""
    };
    var response =
        await ApiClient.postData(AppUrl.signupAuth, jsonEncode(body));
    if (response.statusCode == 200) {
      isSignUpLoading.value = false;
      refresh();
      toastMessage(message: response.body["message"]);
      Get.toNamed(AppRoute.otpVerify);
    } else {
      ApiChecker.checkApi(response);
    }
    isSignUpLoading.value = false;
    refresh();
  }

  ///======================================SignUp Verify ============================
  var headers = {'Content-Type': 'application/json'};
  var activationCode = "";
  RxBool isOtpLoading = false.obs;
  TextEditingController pinController = TextEditingController();

  signupVerifyOTP() async {
    isOtpLoading.value = true;
    refresh();
    Map<dynamic, String> body = {
      "userEmail": emailController.text,
      "activation_code": activationCode
    };

    var response = await ApiClient.postData(
        AppUrl.otpVerificationEndPoint, jsonEncode(body));
    isOtpLoading.value = false;
    refresh();
    if (response.statusCode == 201) {
      toastMessage(message: response.body["message"]);
      emailController.clear();
      fullNameController.clear();
      phoneNumberController.clear();
      passwordController.clear();
      confirmPasswordController.clear();
      pinController.clear();
      Get.toNamed(AppRoute.subscription);
    } else {
      ApiChecker.checkApi(response);
    }
    isOtpLoading.value = false;
    refresh();
  }

  ///==================================================LogIn ================================
  RxBool isSignInLoading = false.obs;

  signInUser() async {
    isSignInLoading.value = true;
    refresh();
    Map<String, String> body = {
      "email": emailController.text,
      "password": passwordController.text
    };

    var response = await ApiClient.postData(AppUrl.logIn, jsonEncode(body),
        headers: headers);
    if (response.statusCode == 200) {
      toastMessage(message: response.body["message"]);
      Get.toNamed(AppRoute.homeScreen);
    } else {
      ApiChecker.checkApi(response);
    }
    isSignInLoading.value = false;
    refresh();
  }

  ///==================================================Forget Password==========================

  RxBool isForgetLoading = false.obs;

  forgetPassword() async {
    isForgetLoading.value = true;
    refresh();
    Map<String, String> body = {"email": emailController.text};

    var response = await ApiClient.postData(AppUrl.forgetOtp, jsonEncode(body),
        headers: headers);
    if (response.statusCode == 200) {

      toastMessage(message: response.body["message"]);
      Get.toNamed(AppRoute.forgetOtpVerify);
    } else {
      ApiChecker.checkApi(response);
    }
    isForgetLoading.value = false;
    refresh();
  }

  ///====================================Forget verify Otp=======================
  var code = "";
  RxBool isForgetOtpLoading = false.obs;
  TextEditingController forgetOtpPinController = TextEditingController();

  forgetVerifyOTP() async {
    isForgetOtpLoading.value = true;
    refresh();
    Map<dynamic, String> body = {"code": code, "email": emailController.text};

    var response =
        await ApiClient.postData(AppUrl.forgetOtpVerify, jsonEncode(body));
    isForgetOtpLoading.value = false;
    refresh();
    if (response.statusCode == 200) {
      toastMessage(message: response.body["message"]);
      Get.toNamed(AppRoute.resetPass);

    } else {
      ApiChecker.checkApi(response);
    }
    isForgetOtpLoading.value = false;
    refresh();
  }

  ///========================================================reset Password========================
  RxBool isResetLoading = false.obs;

  resetPassword() async {
    isResetLoading.value = true;
    refresh();
    Map<String, String> body = {
      "email": emailController.text,
      "newPassword": newPasswordController.text,
      "confirmPassword": confirmPasswordController.text
    };

    var response = await ApiClient.postData(
        AppUrl.resetPassword, jsonEncode(body),
        headers: headers);
    if (response.statusCode == 200) {
      toastMessage(message: response.body["message"]);
      Get.toNamed(AppRoute.signIn);
    } else {
      ApiChecker.checkApi(response);

    }
    isResetLoading.value = false;
  }

  ///========================================================Change Password=========================
  RxBool isChangeLoading = false.obs;

  changePassword() async {
    isChangeLoading.value = true;
    refresh();
    Map<String, String> body = {
      "oldPassword": passwordController.text,
      "newPassword": confirmPasswordController.text
    };

    var response = await ApiClient.patchData(
        AppUrl.changePassword, jsonEncode(body),
        headers: headers);
    if (response.statusCode == 200) {
      toastMessage(message: response.body["message"]);
      Get.toNamed(AppRoute.signIn);
    } else {
      ApiChecker.checkApi(response);

    }
    isChangeLoading.value = false;
  }
}
