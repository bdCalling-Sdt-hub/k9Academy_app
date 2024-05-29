import 'package:get/get.dart';
import 'package:k9academy/services/api_check.dart';
import 'package:k9academy/services/api_client.dart';
import 'package:k9academy/services/app_url.dart';
import 'package:k9academy/utils/app_const/app_const.dart';
import 'package:k9academy/view/screens/subscription/subscription_model/subscription_model.dart';

class SubscriptionController extends GetxController {
  RxBool isPromoCode = false.obs;



  ///==================================GetSubscription===========================
  final rxRequestStatus = Status.loading.obs;
  void setRxRequestStatus(Status value) => rxRequestStatus.value = value;

  RxList<SubscriptionData> subscriptionLists = <SubscriptionData>[].obs;
  RxList<Item> item = <Item>[].obs;



  getSubscription() async {
    setRxRequestStatus(Status.loading);
    refresh();
    var response = await ApiClient.getData(ApiUrl.subscriptionPlanAll);

    if (response.statusCode == 200) {
      // subscription.value = SubscriptionData.fromJson(response.body["data"]);
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


@override
  void onInit() {
  getSubscription();
    super.onInit();
  }

}
