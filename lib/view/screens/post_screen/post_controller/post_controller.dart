import 'dart:convert';
import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:k9academy/core/app_routes/app_routes.dart';
import 'package:k9academy/services/api_check.dart';
import 'package:k9academy/services/api_client.dart';
import 'package:k9academy/services/app_url.dart';
import 'package:k9academy/utils/app_const/app_const.dart';
import 'package:k9academy/utils/toast_message/toast_message.dart';
import 'package:k9academy/view/screens/post_screen/model/post_model.dart';

class PostController extends GetxController {
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

  ///=============================PostMethod======================

  TextEditingController descriptionController = TextEditingController();
  RxBool isPostLoading = false.obs;

  Future<void> multipartRequest({Map<String, String>? header}) async {
    isPostLoading.value = true;
    update();
    try {
      var body = {
        "description": descriptionController.text,
      };
      var response = await ApiClient.postMultipartData(
          ApiUrl.postEndpoint, body,
          multipartBody: [
            MultipartBody("image", File(image.value)),
          ]);

      if (response.statusCode == 200) {
        Get.toNamed(AppRoute.myProfileScreen);
        toastMessage(message: response.body["message"]);
        isPostLoading.value = false;
        update();
      } else {
        ApiChecker.checkApi(response);
      }
    } catch (e) {
      debugPrint("============> $e");
    }
  }


  ///==================================GetPost===========================
  final rxRequestStatus = Status.loading.obs;

  void setRxRequestStatus(Status value) => rxRequestStatus.value = value;

  // RxList<PostModel> postList = <PostModel>[].obs;
  Rx<User>? postModel ;

  getPost() async {
    setRxRequestStatus(Status.loading);
    var response = await ApiClient.getData(ApiUrl.getPostEndPoint);
    setRxRequestStatus(Status.completed);
    if (response.statusCode == 200) {
      final Map<String, dynamic> data = json.decode(response.body);
      return Post.fromJson(data['data'][0]);
      // postModel.value = PostModel.fromJson(response.body);
      // print("getpost==================================${response.body}");
      // postList = RxList<PostModel>.from(
      //     response.body["data"][0].map((x) => PostModel.fromJson(x)));
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
}
