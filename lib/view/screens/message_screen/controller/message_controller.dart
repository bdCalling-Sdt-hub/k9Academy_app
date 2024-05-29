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

  final rxRequestStatus = Status.loading.obs;
  void setRxRequestStatus(Status value) => rxRequestStatus.value = value;

  RxString profileID = "".obs;

  getProfileID() {
    profileID.value = generalController.userId.value;
  }

  // List<Map<String, dynamic>> inboxChat = [
  //   {"sender": "0", "message": "Hii, hello", "messageType": "text"},
  //   {
  //     "sender": "0",
  //     "message":
  //         "We will meet soon  sorry  babe. i promise upcoming sun we will meet for sure. See you again. bye bye",
  //     "messageType": "text"
  //   },
  //   {"sender": "1", "message": "okk", "messageType": "text"},
  //   {"sender": "0", "message": "Iam Fine, hello", "messageType": "text"},
  //   {"sender": "1", "message": "hii", "messageType": "text"},
  //   {"sender": "1", "message": "Bye", "messageType": "text"},
  // ];

  ///========================= Get Conversation List ============================

  RxList<MessageDatum> messageList = <MessageDatum>[].obs;

  getMessageList() async {
    setRxRequestStatus(Status.loading);
    refresh();
    var response = await ApiClient.getData(ApiUrl.getConversations);

    if (response.statusCode == 200) {
      messageList.value = List<MessageDatum>.from(
          response.body["data"].map((x) => MessageDatum.fromJson(x)));

      setRxRequestStatus(Status.completed);
    } else {
      if (response.statusText == ApiClient.noInternetMessage) {
        setRxRequestStatus(Status.internetError);
      } else {
        setRxRequestStatus(Status.error);
      }
      ApiChecker.checkApi(response);
    }
  }

  ///========================= Listen to Socket =======================
  socketConnect() async {
    SocketApi.socket.on("getMessage", (data) {
      debugPrint("Socket Res=================>>>>>>>>>>>>>$data");
    });
  }

  ///========================= Send Message =======================
  Rx<TextEditingController> sendController = TextEditingController().obs;
  sendMessage() async {
    generalController.showPopUpLoader();

    var body = {"message": sendController.value.text};

    var response = ApiClient.postMultipartData(ApiUrl.sendMessage, body,
        multipartBody: [
          MultipartBody("image", generalController.imageFile.value)
        ]);
  }

  @override
  void onInit() {
    getMessageList();
    getProfileID();
    socketConnect();
    super.onInit();
  }
}
