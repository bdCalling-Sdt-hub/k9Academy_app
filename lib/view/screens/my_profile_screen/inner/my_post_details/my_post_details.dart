import 'package:flutter/material.dart';
import 'package:k9academy/utils/app_colors/app_colors.dart';

import 'package:k9academy/view/widgets/custom_community_post_details/custom_community_post_details.dart';

class MyPostDetails extends StatelessWidget {
  const MyPostDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
        backgroundColor: AppColors.blackyDarkHover,
        body: CustomCommunityPostDetails());
  }
}
