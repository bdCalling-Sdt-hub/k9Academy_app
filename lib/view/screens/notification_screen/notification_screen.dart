import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:k9academy/utils/app_colors/app_colors.dart';
import 'package:k9academy/utils/static_strings/static_strings.dart';
import 'package:k9academy/view/widgets/custom_text/custom_text.dart';

class NotificationScreen extends StatelessWidget {
  NotificationScreen({super.key});

  final List<Map<String, String>> notifications = [
    {
      "title": "New Post  Published",
      "sub": "Toothache how and why?",
      "time": "20-Dec-2024, 3:00 PM"
    },
    {
      "title": "xmas greetings message",
      "sub": "Dr.Adit is available for your consultation.",
      "time": "30-Dec-2024, 6:00 PM"
    },
    {
      "title": "New Post  Published",
      "sub": "Toothache how and why?",
      "time": "18-Dec-2027, 9:00 PM"
    },
    {
      "title":
          "New Post  Published Dr.Adit is available for your consultation.",
      "sub": "Dr.Adit is available for your consultation.",
      "time": "01-Dec-2024, 3:00 PM"
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.blackyDarkHover,
      appBar: AppBar(
        centerTitle: true,
        title: const CustomText(
          text: AppStaticStrings.notifications,
          fontSize: 18,
          fontWeight: FontWeight.w500,
        ),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 24),
        itemCount: notifications.length,
        itemBuilder: (context, index) {
          var data = notifications[index];
          return Container(
            margin: const EdgeInsets.only(bottom: 15),
            decoration: BoxDecoration(
              boxShadow: const [
                BoxShadow(
                  color: Colors.grey,
                  offset: Offset(0.1, 1.0), //(x,y)
                  blurRadius: 1,
                ),
              ],
              borderRadius: BorderRadius.circular(14),
              color: AppColors.lightDarkActive,
            ),
            padding: EdgeInsets.all(20.r),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ///======================== Title ========================

                CustomText(
                  textAlign: TextAlign.left,
                  maxLines: 3,
                  text: data["title"] ?? "",
                  color: AppColors.lightNormal,
                  fontWeight: FontWeight.w500,
                  fontSize: 14,
                ),

                ///======================= Sub Title ======================

                CustomText(
                  textAlign: TextAlign.left,
                  maxLines: 3,
                  top: 6,
                  bottom: 6,
                  text: data["sub"] ?? "",
                  fontWeight: FontWeight.w500,
                ),

                ///======================= Time ======================

                CustomText(
                  text: data["time"] ?? "",
                  fontWeight: FontWeight.w300,
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
