import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:k9academy/services/api_check.dart';
import 'package:k9academy/services/api_client.dart';
import 'package:k9academy/services/app_url.dart';
import 'package:k9academy/utils/app_const/app_const.dart';
import 'package:k9academy/view/screens/my_profile_screen/get_profile_model/get_profile_model.dart';

class ProfileController extends GetxController {
  var selectedIndex = 0.obs;

  void changeTab(int index) {
    selectedIndex.value = index;
  }

  var isAddItem = true.obs;

  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController contactController = TextEditingController();
  TextEditingController dateController = TextEditingController();
  TextEditingController ageController = TextEditingController();
  TextEditingController genderController = TextEditingController();

  ///==============================Select Calender Show Method=============================
  Rx<DateTime> selectedDate = DateTime.now().obs;
  Rx<DateTime> newSelectedDate = DateTime.now().obs;
  DateTime lastDate = DateTime.now();

  Future<void> calenderShow(BuildContext context, Rx<DateTime> value) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: lastDate,
        firstDate: DateTime(2000, 8),
        lastDate: DateTime(2201));
    if (picked != null) {
      lastDate = picked;
      value.value = lastDate;

      debugPrint("Selected Date===============>>>>>>>>>>>>>>$value");
      value.refresh();
    }
  }

  ///=================================profile Image Picker==================================
  RxString image = "".obs;

  Rx<File> imageFile = File("").obs;

  selectImage() async {
    final ImagePicker picker = ImagePicker();
    final XFile? getImages =
        await picker.pickImage(source: ImageSource.gallery, imageQuality: 15);
    if (getImages != null) {
      imageFile.value = File(getImages.path);
      image.value = getImages.path;
    }
  }

  ///=================================Cover Image Picker==================================

  RxString coverImage = "".obs;

  Rx<File> coverImageFile = File("").obs;

  selectCoverImage() async {
    final ImagePicker picker = ImagePicker();
    final XFile? getImages =
        await picker.pickImage(source: ImageSource.gallery, imageQuality: 15);
    if (getImages != null) {
      coverImageFile.value = File(getImages.path);
      coverImage.value = getImages.path;
    }
  }

  ///===============================GetProfile Method=========================

  final rxRequestStatus = Status.loading.obs;
  void setRxRequestStatus(Status value) => rxRequestStatus.value = value;


  Rx<ProfileModel> profileModel = ProfileModel().obs;


  getProfile() async {
    setRxRequestStatus(Status.loading);
 //  refresh();
    var response = await ApiClient.getData(ApiUrl.getProfile);
    setRxRequestStatus(Status.completed);

    if (response.statusCode == 200) {
      // final data = await json.decode(response.body);
       profileModel.value =  ProfileModel.fromJson(response.body);

       print(profileModel.value.data!.userInfo!.name);
     // userInfo.value = profileModel.data!.userInfo!;
       profileModel.refresh();
      refresh();
    } else {
      if (response.statusText == ApiClient.noInternetMessage) {
        setRxRequestStatus(Status.internetError);
      } else {
        setRxRequestStatus(Status.error);
      }
      ApiChecker.checkApi(response);
    }
    refresh();


  }




  @override
  void onInit() {
    getProfile();
    super.onInit();
  }
}
