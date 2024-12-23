import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:k9academy/global/controller/general_controller.dart';
import 'package:k9academy/services/api_check.dart';
import 'package:k9academy/services/api_client.dart';
import 'package:k9academy/services/app_url.dart';
import 'package:k9academy/services/socket.dart';
import 'package:k9academy/utils/app_const/app_const.dart';
import 'package:k9academy/view/screens/message_screen/model/message_model.dart';

class MessageController extends GetxController {
  ScrollController scrollController = ScrollController();
  GeneralController generalController = Get.find<GeneralController>();
  RxInt totalPage = 0.obs;
  RxInt currentPage = 0.obs;
  final rxRequestStatus = Status.loading.obs;
  void setRxRequestStatus(Status value) => rxRequestStatus.value = value;

  RxString profileID = "".obs;

  getProfileID() {
    profileID.value = generalController.userId.value;
    debugPrint("User Id ======================>>>>>>>>>>>>${profileID.value}");
  }

  ///========================= Get Conversation List ============================

  RxList<MessageDatum> messageList = <MessageDatum>[].obs;

  getMessageList() async {
    setRxRequestStatus(Status.loading);
    refresh();
    var response = await ApiClient.getData(
        ApiUrl.getConversations(id: generalController.conversationID.value));

    if (response.statusCode == 200) {
      messageList.value = List<MessageDatum>.from(response.body["data"]
              ["messages"]
          .map((x) => MessageDatum.fromJson(x)));

      if (messageList.isNotEmpty) {
        currentPage.value = response.body['data']['meta']['page'];
        totalPage.value = response.body['data']['meta']['totalPage'];
      }

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

  ///============================= Load More Data ============================

  var isLoadMoreRunning = false.obs;
  RxInt page = 1.obs;

  loadMore() async {
    debugPrint("============== Load More Message ================");
    if (rxRequestStatus.value != Status.loading &&
        isLoadMoreRunning.value == false &&
        totalPage != currentPage) {
      isLoadMoreRunning(true);
      page.value += 1;

      Response response = await ApiClient.getData(
        "${ApiUrl.getConversations(id: generalController.conversationID.value)}?page=$page",
      );
      currentPage.value = response.body['data']['meta']['page'];
      totalPage.value = response.body['data']['meta']['totalPage'];

      if (response.statusCode == 200) {
        var demoList = List<MessageDatum>.from(response.body["data"]["messages"]
            .map((x) => MessageDatum.fromJson(x)));
        messageList.addAll(demoList);

        messageList.refresh();
        refresh();
      } else {
        ApiChecker.checkApi(response);
      }
      isLoadMoreRunning(false);
    }
  }

  //===================Pagination Scroll Controller===============

  Future<void> addScrollListener() async {
    if (scrollController.position.pixels ==
        scrollController.position.maxScrollExtent) {
      loadMore();
    }
  }

  ///========================= Listen to Socket =======================
  socketConnect() async {
    SocketApi.socket.on("getMessage", (data) {
      debugPrint("Socket Res=================>>>>>>>>>>>>>$data");

      MessageDatum newMsg = MessageDatum.fromJson(data);

      messageList.insert(0, newMsg);
      messageList.refresh();
    });
  }

  ///========================= Send Message =======================
  Rx<TextEditingController> sendController = TextEditingController().obs;
  sendMessage() async {
    if (sendController.value.text.isEmpty &&
        generalController.imagePath.value.isEmpty) {
      return;
    }
    generalController.showPopUpLoader();

    var body = {
      "message": sendController.value.text,
      "conversationId": generalController.conversationID.value
    };

    var response = generalController.imagePath.isEmpty
        ? await ApiClient.postData(ApiUrl.sendMessage, jsonEncode(body))
        : await ApiClient.postMultipartData(ApiUrl.sendMessage, body,
            multipartBody: [
                MultipartBody("image", File(generalController.imagePath.value))
              ]);

    if (response.statusCode == 200) {
      sendController.value.clear();
      generalController.imagePath.value = "";
      navigator!.pop();
    } else {
      navigator!.pop();
      ApiChecker.checkApi(response);
    }
  }

  ///=======================- Socket Join Chat ============================
  socketJoinChat() {
    SocketApi.socket
        .emit("join-chat", {"id": generalController.conversationID.value});
  }

  @override
  void onInit() {
    socketJoinChat();
    scrollController.addListener(addScrollListener);
    getMessageList();
    getProfileID();
    socketConnect();
    super.onInit();
  }
}
