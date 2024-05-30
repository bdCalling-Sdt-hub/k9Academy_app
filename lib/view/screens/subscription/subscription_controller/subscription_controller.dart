import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:k9academy/services/api_check.dart';
import 'package:k9academy/services/api_client.dart';
import 'package:k9academy/services/app_url.dart';
import 'package:k9academy/utils/app_const/app_const.dart';
import 'package:k9academy/utils/toast_message/toast_message.dart';
import 'package:k9academy/view/screens/subscription/model/promo_model.dart';
import 'package:k9academy/view/screens/subscription/model/subscription_model.dart';

class SubscriptionController extends GetxController {
  RxBool isPromoCode = false.obs;

  ///==================================GetSubscription===========================
  final rxRequestStatus = Status.loading.obs;
  void setRxRequestStatus(Status value) => rxRequestStatus.value = value;
  RxList<SubscriptionData> subscriptionLists = <SubscriptionData>[].obs;
  getSubscription() async {
    setRxRequestStatus(Status.loading);
    refresh();
    var response = await ApiClient.getData(ApiUrl.subscriptionPlanAll);

    if (response.statusCode == 200) {
      subscriptionLists.value = List<SubscriptionData>.from(
          response.body["data"].map((x) => SubscriptionData.fromJson(x)));
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

   ///=====================================PromoPackageGet==============================
  RxList<PromoData> promoData = <PromoData>[].obs;
  getPromoPackage() async {
    setRxRequestStatus(Status.loading);
    refresh();
    var response = await ApiClient.getData(ApiUrl.getPromoPackage);

    if (response.statusCode == 200) {
      promoData.value = List<PromoData>.from(
          response.body["data"].map((x) => PromoData.fromJson(x)));
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
  ///==================================== Promo Code  Post=========================
  RxBool isPromoLoading = false.obs;
  TextEditingController promoController = TextEditingController();
  promoCode() async {
    isPromoLoading.value = true;
    refresh();
    Map<String, String> body = {
      "promo_code": promoController.text
    };

    var response =
    await ApiClient.postData(ApiUrl.promoCode, jsonEncode(body));
    if (response.statusCode == 200) {
      toastMessage(message: response.body["message"]);
      isPromoCode.value =
      !isPromoCode.value;
      isPromoCode.refresh();
      navigator!.pop();
      promoController.clear();
    } else {
      ApiChecker.checkApi(response);
    }
    isPromoLoading.value = false;
  }


  @override
  void onInit() {
    getSubscription();
    getPromoPackage();
    super.onInit();
  }
}
