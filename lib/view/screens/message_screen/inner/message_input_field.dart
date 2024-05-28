import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:k9academy/utils/app_colors/app_colors.dart';
import 'package:k9academy/view/widgets/custom_text_field/custom_text_field.dart';

class MessageInputField extends StatelessWidget {
  const MessageInputField(
      {super.key,
      required this.writeMsgController,
      required this.onTap,
      this.isComment = true});

  final TextEditingController writeMsgController;

  final VoidCallback onTap;
  final bool isComment;

  @override
  Widget build(BuildContext context) {
    return AnimatedPadding(
      padding: MediaQuery.of(context).viewInsets,
      duration: const Duration(milliseconds: 100),
      curve: Curves.decelerate,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Row(
          children: [
            //=============================== Gallery Button ==========================

            if (!isComment)
              IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.image_outlined,
                  size: 36,
                ),
              ),
            //============================Text Input Field=====================

            Expanded(
                child: SizedBox(
              height: 50,
              child: CustomTextField(
                textEditingController: writeMsgController,
                textInputAction: TextInputAction.done,
                hintText: "write your message",
                fieldBorderColor: AppColors.blueNormal,
                focusBorderColor: AppColors.blueNormal,
                fillColor: Colors.transparent,
                borderRadius: 10.r,
              ),
            )),

            //=============================== Send Button ==========================

            GestureDetector(
              onTap: () {
                onTap();
              },
              child: Container(
                margin: EdgeInsets.only(left: 4.w),
                height: 48,
                width: 48,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(4.r),
                    color: AppColors.redNormal),
                child: const Icon(
                  Icons.send_sharp,
                  color: AppColors.lightNormal,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
