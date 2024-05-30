import 'package:calendar_date_picker2/calendar_date_picker2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:k9academy/utils/app_colors/app_colors.dart';
import 'package:k9academy/utils/app_icons/app_icons.dart';
import 'package:k9academy/utils/static_strings/static_strings.dart';
import 'package:k9academy/view/screens/my_profile_screen/schedule_controller/schedule_controller.dart';
import 'package:k9academy/view/widgets/custom_image/custom_image.dart';
import 'package:k9academy/view/widgets/custom_text/custom_text.dart';
import 'package:k9academy/view/widgets/custom_text_field/custom_text_field.dart';

class ScheduleScreen extends StatelessWidget {
  ScheduleScreen({super.key});

  void showDialogBox(BuildContext context) {
    Get.dialog(
      AlertDialog(
        backgroundColor: AppColors.blackyDarkHover,
        content: SizedBox(
          height: 300,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  const SizedBox(),
                  const Spacer(),
                  GestureDetector(
                    onTap: () {
                      Get.back();
                    },
                    child: const CustomImage(
                      imageSrc: AppIcons.x,
                      imageType: ImageType.svg,
                    ),
                  )
                ],
              ),
              const CustomText(
                text: "Meeting date: 25 May, 2024 / 8:00 pm",
                fontWeight: FontWeight.w400,
                color: AppColors.lightNormal,
                bottom: 14,
              ),
              CustomText(
                text: AppStaticStrings.link,
                fontWeight: FontWeight.w500,
                fontSize: 14.sp,
                color: AppColors.lightNormalHover,
                bottom: 16,
              ),
              const CustomTextField(
                hintText: "https://marketplace.zoom ... link",
              ),
              CustomText(
                top: 16,
                text: AppStaticStrings.password,
                fontWeight: FontWeight.w500,
                fontSize: 14.sp,
                color: AppColors.lightNormalHover,
                bottom: 16,
              ),
              const CustomTextField(
                hintText: "123456",
              ),
            ],
          ),
        ),
      ),
    );
  }

  final ScheduleController scheduleController = Get.put(ScheduleController());

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 20),
            decoration: BoxDecoration(
              color: AppColors.blackyNormalActive,
              borderRadius: BorderRadius.circular(15),
            ),
            child: Obx(() {
              return CalendarDatePicker2(
                config: CalendarDatePicker2Config(
                  daySplashColor: AppColors.lightNormalActive,
                  controlsTextStyle: const TextStyle(color: AppColors.light),
                  dayTextStyle: const TextStyle(color: AppColors.lightDark),
                  monthTextStyle: const TextStyle(color: AppColors.light),
                  yearTextStyle: const TextStyle(color: AppColors.light),
                  weekdayLabelTextStyle: const TextStyle(color: AppColors.light),
                  selectedDayHighlightColor: AppColors.lightDarker,
                ),
                value: scheduleController.dates,
                onValueChanged: (dates) {
                  // scheduleController.updateDates(dates);
                },
              );
            }),
          ),
          SizedBox(
            height: 20.h,
          ),
          Column(
            children: List.generate(
              4,
                  (index) => Container(
                padding: const EdgeInsets.all(15),
                margin: const EdgeInsets.all(20),
                width: double.infinity,
                decoration: BoxDecoration(
                  color: AppColors.blackyNormalActive,
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CustomText(
                          text: "25 May, 2024",
                          color: AppColors.blueNormal,
                          bottom: 7,
                          fontWeight: FontWeight.w400,
                          fontSize: 14.sp,
                        ),
                        CustomText(
                          text: "8:00 pm",
                          color: AppColors.lightActive,
                          fontWeight: FontWeight.w400,
                          fontSize: 14.sp,
                        ),
                      ],
                    ),
                    SizedBox(
                      width: 10.w,
                    ),
                    Container(
                      height: 50.h,
                      decoration: const BoxDecoration(
                        border: Border(
                          left: BorderSide(
                            color: Colors.grey,
                            width: 1.0,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 10.w,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CustomText(
                          text: AppStaticStrings.consultation,
                          color: AppColors.lightNormalHover,
                          bottom: 7,
                          fontWeight: FontWeight.w500,
                          fontSize: 14.sp,
                        ),
                        ElevatedButton(
                          style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all<Color>(
                              AppColors.redNormal,
                            ),
                          ),
                          onPressed: () {
                            showDialogBox(context);
                          },
                          child: CustomText(
                            text: AppStaticStrings.meetingLink,
                            color: Colors.white,
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
