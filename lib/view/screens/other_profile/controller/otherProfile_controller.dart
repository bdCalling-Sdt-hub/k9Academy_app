import 'package:get/get.dart';
import 'package:k9academy/services/api_check.dart';
import 'package:k9academy/services/api_client.dart';
import 'package:k9academy/services/app_url.dart';
import 'package:k9academy/utils/app_const/app_const.dart';
import 'package:k9academy/view/screens/other_profile/model/otherProfile_model.dart';

class OtherProfileController extends GetxController{

  final rxRequestStatus = Status.loading.obs;
  void setRxRequestStatus(Status value) => rxRequestStatus.value = value;
  // Rx<OtherProfileData> otherProfile = OtherProfileData().obs;
  RxList<OtherProfileData> otherPost = <OtherProfileData>[].obs;

  getOtherProfile() async {
    setRxRequestStatus(Status.loading);
    refresh();
    var response = await ApiClient.getData(ApiUrl.otherProfile);
    setRxRequestStatus(Status.completed);
    if (response.statusCode == 200) {
      otherPost.value = List<OtherProfileData>.from(
          response.body["data"].map((x) => OtherProfileData.fromJson(x)));
      // otherProfile.value = OtherProfileData.fromJson(response.body["data"]);
      print("==================================${response.body}");
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
    getOtherProfile();
    super.onInit();
  }
}