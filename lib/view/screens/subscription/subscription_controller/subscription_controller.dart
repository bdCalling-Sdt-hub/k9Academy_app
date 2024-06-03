import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:get/get.dart';
import 'package:k9academy/helper/shared_prefe/shared_prefe.dart';
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


  ///==============================================payment===============================


  ///========================= Create Payment Intent =========================
  Map<String, dynamic>value = {};

  Future<Map<String,dynamic>> createPaymentIntent (
      {required int price}) async {
    var bearerToken =
    await SharePrefsHelper.getString(AppConstants.bearerToken);

    var mainHeaders = {
      'Content-Type': 'application/json',
      //'Accept': 'application/json',
      'Authorization': 'Bearer $bearerToken'
    };
    var body = {
      "price": price,

    };
    try {
      var response = await ApiClient.postData(
          ApiUrl.payment,
          jsonEncode(body),
          headers: mainHeaders
      );
      debugPrint("Payment Intent body ${response.body}");

      if(response.statusCode==200){

        value =  response.body["data"];
        return value;

      }else{
        ApiChecker.checkApi(response);
        return {};
      }

    } catch (error) {
      Get.snackbar("Error", error.toString());
      print(error);
      return {};

    }
  }





  Future<void> makePayment({
    required int amount,
    required int totalItem,
    required int points,
    required int deliveryFee,
    required String orderId,
    required String cartId,
    required String deliveryDate,
    required bool isPickedUp,
  }) async {

    try {

      Map<String,dynamic>  paymentIntentData = await createPaymentIntent(price: amount);

      print('===========-------------------------${paymentIntentData}');
      if (paymentIntentData.isNotEmpty) {
        await Stripe.instance.initPaymentSheet(
            paymentSheetParameters:  SetupPaymentSheetParameters(
              merchantDisplayName: 'Masum',
              paymentIntentClientSecret: paymentIntentData['client_secret'],
              allowsDelayedPaymentMethods: true,
              style: ThemeMode.light,
            ));
        await Stripe.instance.presentPaymentSheet();

        /// >><><><><><><<><><><><><><> Send response in server <><><><><><><><><><<><><><><><><<

        makeOrder(
            orderId: orderId,
            totalItem: totalItem,
            price: amount,
            deliveryDate:  deliveryDate,
            deliveryFee: deliveryFee,
            cart:  cartId,
            points: points,
            paymentMethod: 'online',
            transactionId: paymentIntentData['transactionId'] ?? "", isPicked: isPickedUp
        );
        /*  requiterSubscription(
          packageID: packageID,
          currency: currency,
          transactionId: paymentIntentData["id"],
          amount:amount,
          email:homeController.profileModel.value.data!.email.toString(),
          name:homeController.profileModel.value.data!.fullName.toString(),
          paymentType:paymentType,
          status:"successful",
        );*/
        toastMessage(message:"Payment Successful");
      }
    } catch (e) {
      debugPrint("Error ================>>>>>>>>>>>>>${e.toString()}");
      toastMessage(message: "Error $e");
    }
  }

  ///============================ Send Response to server ==============================

  makeOrder({
    required String orderId,
    required int totalItem,
    required int price,
    required String deliveryDate,
    required int deliveryFee,
    required String cart,
    required int points,
    required String paymentMethod,
    required String transactionId,
    required bool isPicked,
  }) async {

    var bearerToken =
    await SharePrefsHelper.getString(AppConstants.bearerToken);

    var mainHeaders = {
      'Content-Type': 'application/json',
      //'Accept': 'application/json',
      'Authorization': 'Bearer $bearerToken'
    };

    Map<String, dynamic> body = {
      "orderId":orderId,
      "totalItem":totalItem ,
      "price":price ,
      "deliveryDate":deliveryDate,
      "deliveryFee":deliveryFee ,
      "cart":cart,
      "points":points ,
      "transactionId":transactionId ,
      "callForPickup": isPicked,
      "paymentMethod":paymentMethod,
    };
    var response =
    await ApiClient.postData(ApiUrl.payment,jsonEncode(body),headers: mainHeaders);
    if (response.statusCode == 200){
      // Get.toNamed(AppRoute.orderHistoryScreen);
      toastMessage(message: response.body["message"]);
    } else {
      ApiChecker.checkApi(response);
    }
  }






  @override
  void onInit() {
    getSubscription();
    getPromoPackage();
    super.onInit();
  }
}
