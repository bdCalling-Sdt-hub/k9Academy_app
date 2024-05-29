import 'package:get/get.dart';
import 'package:k9academy/services/api_check.dart';
import 'package:k9academy/services/api_client.dart';
import 'package:k9academy/services/app_url.dart';
import 'package:k9academy/utils/app_const/app_const.dart';
import 'package:k9academy/view/screens/subscription/subscription_model/subscription_model.dart';

class SubscriptionController extends GetxController {
  RxBool isPromoCode = false.obs;
  List<Map<String, dynamic>> subscriptionList = [
    {
      'category': "Silver monthly",
      'amount': '\$40',
      "features": [
        "60 day permission to use",
        "Free training tutorial",
        "Free jurnal",
        "Free consultations",
        "20 Community post",
      ]
    },
    {
      'category': "Gold monthly",
      'amount': '\$100',
      "features": [
        "120 day permission to use",
        "Free training tutorial",
        "Free jurnal",
        "Free consultations",
        "20 Community post",
      ]
    },
    {
      'category': "Platinum monthly",
      'amount': '\$120',
      "features": [
        "360 day permission to use",
        "Free training tutorial",
        "Free jurnal",
        "Free consultations",
        "20 Community post",
      ]
    },
  ];


  ///==================================GetSubscription===========================
  final rxRequestStatus = Status.loading.obs;
  void setRxRequestStatus(Status value) => rxRequestStatus.value = value;

  RxList<SubscriptionData> subscriptionLists = <SubscriptionData>[].obs;

  Rx<SubscriptionData> subscription = SubscriptionData().obs;

  Future<bool> getSubscription() async {
    setRxRequestStatus(Status.loading);
    refresh();
    var response = await ApiClient.getData(ApiUrl.subscriptionPlanAll);

    if (response.statusCode == 200) {
      subscriptionLists.value = List<SubscriptionData>.from(
          response.body["data"].map((x) => SubscriptionData.fromJson(x)));
      setRxRequestStatus(Status.completed);

      refresh();
      return true;
    } else {
      if (response.statusText == ApiClient.noInternetMessage) {
        setRxRequestStatus(Status.internetError);
      } else {
        setRxRequestStatus(Status.error);
      }
      ApiChecker.checkApi(response);

      refresh();

      return false;
    }
  }




}
