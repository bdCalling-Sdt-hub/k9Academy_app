import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:k9academy/utils/app_colors/app_colors.dart';
import 'package:k9academy/utils/app_const/app_const.dart';
import 'package:k9academy/view/screens/message_screen/controller/message_controller.dart';
import 'package:k9academy/view/screens/net_connection_screen/net_connection_screen.dart';
import 'package:k9academy/view/widgets/custom_loader/custom_loader.dart';
import 'package:k9academy/view/widgets/custom_text/custom_text.dart';
import 'package:k9academy/view/widgets/general_error/general_error.dart';

class ChatBubbleMessage extends StatefulWidget {
  const ChatBubbleMessage({
    super.key,
  });

  @override
  State<ChatBubbleMessage> createState() => _ChatBubbleMessageState();
}

class _ChatBubbleMessageState extends State<ChatBubbleMessage> {
  final MessageController messageController = Get.find<MessageController>();
  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.all(8.0),
        child: Obx(() {
          switch (messageController.rxRequestStatus.value) {
            case Status.loading:
              return const CustomLoader();
            case Status.internetError:
              return NoInternetScreen(
                onTap: () {
                  messageController.getMessageList();
                },
              );
            case Status.error:
              return GeneralErrorScreen(
                onTap: () {
                  messageController.getMessageList();
                },
              );

            case Status.completed:
              return ListView.builder(
                  reverse: true,
                  controller: messageController.scrollController,
                  itemCount: messageController.messageList.length,
                  itemBuilder: (context, index) {
                    var data = messageController.messageList[index];
                    if (index < messageController.messageList.length) {
                      return Column(
                        ///=======================Align the text based on user=================
                        crossAxisAlignment:
                        data.senderId == messageController.profileID.value
                            ? CrossAxisAlignment.end
                            : CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(bottom: 15),
                            child: Row(
                              mainAxisAlignment: data.senderId ==
                                  messageController.profileID.value
                                  ? MainAxisAlignment.end
                                  : MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const SizedBox(
                                  width: 8,
                                ),
                                if (data.messageType == "text")
                                  Flexible(
                                    child: Row(
                                      mainAxisAlignment: data.senderId ==
                                          messageController.profileID.value
                                          ? MainAxisAlignment.end
                                          : MainAxisAlignment.start,
                                      children: [
                                        ///=======================Show time if Getting Message=================

                                        if (data.senderId ==
                                            messageController.profileID.value)
                                          CustomText(
                                            right: 10.w,
                                            text: "3.20",
                                            color: AppColors.redLight,
                                            fontSize: 10.w,
                                            fontWeight: FontWeight.w200,
                                          ),

                                        ///============================Message Body==============================

                                        Flexible(
                                          child: Container(
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 16, vertical: 10),
                                            margin: const EdgeInsets.symmetric(
                                                horizontal: 16, vertical: 10),
                                            decoration: BoxDecoration(
                                                border: Border.all(
                                                    color: AppColors.redLight),
                                                borderRadius: BorderRadius.only(
                                                  topLeft: Radius.circular(8.r),
                                                  topRight:
                                                  Radius.circular(8.r),
                                                  bottomLeft: data.senderId ==
                                                      messageController
                                                          .profileID.value
                                                      ? Radius.circular(8.r)
                                                      : Radius.circular(0.r),
                                                  bottomRight: data.senderId ==
                                                      messageController
                                                          .profileID.value
                                                      ? Radius.circular(8.r)
                                                      : Radius.circular(0.r),
                                                ),
                                                color: data.senderId ==
                                                    messageController
                                                        .profileID.value
                                                    ? AppColors.redLightActive
                                                    : AppColors
                                                    .blueLightActive),
                                            child: CustomText(
                                              maxLines: 10,
                                              textAlign: TextAlign.left,
                                              fontSize: 12,
                                              fontWeight: FontWeight.w400,
                                              text: data.message ?? "",
                                              color: data.senderId ==
                                                  messageController
                                                      .profileID.value
                                                  ? AppColors.messageText
                                                  : AppColors.messageText,
                                            ),
                                          ),
                                        ),

                                        ///=======================Show time if Sending Message=================

                                        if (data.senderId !=
                                            messageController.profileID.value)
                                          CustomText(
                                            left: 10.w,
                                            text: "3.20",
                                            fontSize: 10.w,
                                            fontWeight: FontWeight.w200,
                                          ),
                                      ],
                                    ),
                                  ),
                                const SizedBox(
                                  width: 8,
                                ),
                              ],
                            ),
                          ),
                        ],
                      );
                    } else {
                      return const Center(child: CircularProgressIndicator());
                    }
                  });
          }
        }));
  }
}