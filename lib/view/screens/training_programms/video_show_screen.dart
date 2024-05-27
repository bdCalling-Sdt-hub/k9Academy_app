import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:k9academy/helper/network_img/network_img.dart';
import 'package:k9academy/utils/app_colors/app_colors.dart';
import 'package:k9academy/utils/app_const/app_const.dart';
import 'package:k9academy/view/widgets/custom_text/custom_text.dart';

class VideoShowScreen extends StatelessWidget {
  const VideoShowScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.blackyDarkHover,

      ///=========================Appbar=========================
      appBar: AppBar(
        backgroundColor: AppColors.blackyDarker,
        title: CustomText(
          text: "We provide e-collar",
          fontSize: 20.sp,
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ///==============================Video Image=========================
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              margin: const EdgeInsets.only(top: 15),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  color: AppColors.blackyDarker),
              child: CustomNetworkImage(
                  imageUrl: AppConstants.videoImage,
                  height: 150,
                  width: double.infinity),
            ),
            SizedBox(
              height: 20.w,
            ),

            ///====================================Text Design==========================
            Container(
              padding: const EdgeInsets.all(20),
              width: double.infinity,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(16),
                    topRight: Radius.circular(16)),
                color: AppColors.blackyDarker,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomText(
                    text: "Article on e-collar training",
                    color: AppColors.lightNormal,
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w500,
                    bottom: 15,
                  ),
                  CustomText(
                    textAlign: TextAlign.start,
                    maxLines: 40,
                    text:
                        "Sed tincidunt quis tortor. non quam Quisque placerat commodo laoreet Nunc ipsum hendrerit Ut ex amet, dui turpis malesuada laoreet tincidunt amet, Vestibulum lacus, Donec quam id at, sodales. Nullam sollicitudin. ipsum commodo felis, sed faucibus tincidunt efficitur. Nam efficitur. ipsum tempor Morbi odio tempor dui. luctus quam eu non ex viverra orci hendrerit Praesent placerat Ut non, Sed sed lobortis, fringilla enim. turpis Sed nisl. volutpat non, Quisque fringilla sodales. Donec est. eliteget viverra quam sapien Nam amet, amet, efficitur. maximus Nullam lorem. hendrerit viverra Lorem ullamcorper quis convallis. varius tincidunt convallis. eget non, at, non tincidunt Nullam ex facilisis viverra ac odio viverra nibh Cras risus sollicitudin. sodales. at malesuada faucibus amet, massa ipsum est. Nam urna vitae diam tincidunt lorem. sit placerat. Sed volutpat non ac Nam est. sodales. facilisis ex maximus tincidunt tincidunt faucibus ex Nam luctus adipiscing elit placerat. QuisqueDonec Nunc Praesent ultrices faucibus lacus nulla, In Ut Vestibulum tempor tincidunt laoreet ullamcorper sodales. ullamcorper amet, quis urna lacus facilisis malesuada vitae ex elementum elementum faucibus Nunc sodales. lorem. urna. elementum tincidunt placerat. vitae at elementum Vestibulum ac non. Praesent elit. scelerisque Ut dui. lobortis, dolor elit quis tincidunt ex venenatis Nam quis sollicitudin. In viverra quam volutpat dignissim, gravida ullamcorper malesuada lorem. tincidunt Morbi",
                    color: AppColors.lightNormal,
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w400,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
