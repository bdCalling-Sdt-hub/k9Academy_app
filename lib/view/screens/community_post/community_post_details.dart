import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:k9academy/utils/app_colors/app_colors.dart';
import 'package:k9academy/utils/app_icons/app_icons.dart';
import 'package:k9academy/utils/static_strings/static_strings.dart';
import 'package:k9academy/view/screens/message_screen/inner/message_input_field.dart';
import 'package:k9academy/view/widgets/custom_community_post_details/custom_community_post_details.dart';
import 'package:k9academy/view/widgets/custom_image/custom_image.dart';
import 'package:k9academy/view/widgets/custom_text/custom_text.dart';

class CommunityPostDetails extends StatelessWidget {
  const CommunityPostDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.blackyDarkHover,
        body: CustomCommunityPostDetails(
          comment: GestureDetector(
            onTap: () {
              showModalBottomSheet(
                  backgroundColor: AppColors.lightDarkActive,
                  context: context,
                  builder: (context) {
                    return const MessageInputField();
                  });
            },
            child: Container(
              margin: const EdgeInsets.only(top: 10),
              width: MediaQuery.of(context).size.width / 2.5,
              padding: const EdgeInsets.all(7),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25),
                  color: AppColors.lightDarkActive),
              child: Row(
                children: [
                  CustomImage(
                    imageSrc: AppIcons.comment,
                    imageType: ImageType.svg,
                    size: 20.sp,
                  ),
                  CustomText(
                    text: AppStaticStrings.comments,
                    left: 10,
                    fontSize: 14.sp,
                  )
                ],
              ),
            ),
          ),
        ));
  }
}
