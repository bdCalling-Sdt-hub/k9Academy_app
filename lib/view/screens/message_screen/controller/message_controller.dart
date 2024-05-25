import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MessageController extends GetxController {
  RxBool isChat = true.obs;
  RxDouble dragabbleHorizontal = 20.0.obs;
  RxDouble dragabbleVerticel = 100.0.obs;
  ScrollController scrollController = ScrollController();

  List<Map<String, dynamic>> inboxChat = [
    {"sender": "0", "message": "Hii, hello", "messageType": "text"},
    {
      "sender": "0",
      "message":
          "We will meet soon  sorry  babe. i promise upcoming sun we will meet for sure. See you again. bye bye",
      "messageType": "text"
    },
    {"sender": "1", "message": "okk", "messageType": "text"},
    {"sender": "0", "message": "Iam Fine, hello", "messageType": "text"},
    {"sender": "1", "message": "hii", "messageType": "text"},
    {"sender": "1", "message": "Bye", "messageType": "text"},
  ];

  RxList selectedMembers = [].obs;
}
