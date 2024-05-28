import 'package:flutter/material.dart';
import 'package:k9academy/utils/app_colors/app_colors.dart';
import 'package:k9academy/utils/static_strings/static_strings.dart';
import 'package:k9academy/view/screens/message_screen/inner/chart_bubble.dart';
import 'package:k9academy/view/screens/message_screen/inner/message_input_field.dart';
import 'package:k9academy/view/widgets/custom_text/custom_text.dart';

class MessageScreen extends StatelessWidget {
  const MessageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      ///============================== App Bar ==============================

      appBar: AppBar(
        centerTitle: true,
        title: const CustomText(
          fontWeight: FontWeight.w600,
          text: AppStaticStrings.consultation,
          fontSize: 20,
        ),
      ),
      backgroundColor: AppColors.blackyDarkHover,
      bottomNavigationBar: MessageInputField(
        onTap: () {},
        writeMsgController: TextEditingController(),
      ),
      body: const Column(children: [
        //============================== Chat Bubble ==============================

        Expanded(child: ChatBubbleMessage()),
      ]),
    );
  }
}
