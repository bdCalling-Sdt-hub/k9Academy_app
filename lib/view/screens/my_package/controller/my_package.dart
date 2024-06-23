import 'package:get/get.dart';
import 'package:k9academy/global/controller/general_controller.dart';
import 'package:k9academy/services/api_check.dart';
import 'package:k9academy/services/api_client.dart';
import 'package:k9academy/services/app_url.dart';
import 'package:k9academy/utils/app_const/app_const.dart';
import 'package:k9academy/view/screens/my_package/model/mypackage_model.dart';

class MyPackageController extends GetxController {
  final rxRequestStatus = Status.loading.obs;
  void setRxRequestStatus(Status value) => rxRequestStatus.value = value;
  GeneralController generalController = Get.find<GeneralController>();

  ///========================= Get My Package ===========================
  Rx<MyPackageData> myPackage = MyPackageData().obs;

  getMyPackage() async {
    // if (generalController.hasSubsCription.value == false) {
    //   setRxRequestStatus(Status.completed);
    //   refresh();
    //   return;
    // }
    setRxRequestStatus(Status.loading);
    refresh();
    var response = await ApiClient.getData(ApiUrl.myPlan);
    setRxRequestStatus(Status.completed);
    if (response.statusCode == 200) {
      myPackage.value = MyPackageData.fromJson(response.body["data"]);
      setRxRequestStatus(Status.completed);
      refresh();
    } else {
      if (response.statusText == ApiClient.noInternetMessage) {
        setRxRequestStatus(Status.internetError);
      } else {
        setRxRequestStatus(Status.error);
      }
      ApiChecker.checkApi(response);
    }
  }

  @override
  void onInit() {
    getMyPackage();
    super.onInit();
  }
}
