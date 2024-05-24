import 'package:get/get.dart';

class SubscriptionController extends GetxController {

RxBool isPromoCode= false.obs;
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
}
