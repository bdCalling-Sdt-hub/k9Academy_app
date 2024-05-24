import 'package:flutter/material.dart';
import 'package:k9academy/utils/app_colors/app_colors.dart';
import 'package:k9academy/utils/static_strings/static_strings.dart';
import 'package:k9academy/view/widgets/custom_faq_design/custom_faq_design.dart';
import 'package:k9academy/view/widgets/custom_text/custom_text.dart';

class FAQScreen extends StatelessWidget {
  FAQScreen({super.key});

  final List<Map<String, String>> faqList = [
    {"que": "Question no 1", "ans": "This is an dummy answer, To show in UI"},
    {"que": "Question no 2", "ans": "This is an dummy answer, To show in UI"},
    {"que": "Question no 3", "ans": "This is an dummy answer, To show in UI"},
    {"que": "Question no 5", "ans": "This is an dummy answer, To show in UI"},
    {"que": "Question no 5", "ans": "This is an dummy answer, To show in UI"},
    {"que": "Question no 6", "ans": "This is an dummy answer, To show in UI"},
    {
      "que": "Question no 3",
      "ans":
          "This is an dummy answer, To show in UI, This is an dummy answer, To show in UI, This is an dummy answer, To show in UI, "
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.blackyDarkHover,
      appBar: AppBar(
        centerTitle: true,
        title: const CustomText(
          text: AppStaticStrings.fAQ,
          fontSize: 18,
          fontWeight: FontWeight.w500,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 24),
        child: FaqDesign(faqList: faqList),
      ),
    );
  }
}
