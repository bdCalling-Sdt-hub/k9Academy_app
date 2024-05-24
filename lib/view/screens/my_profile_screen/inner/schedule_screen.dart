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
import 'package:table_calendar/table_calendar.dart';

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
                text: "Meeting date: 25 may, 2024 / 8:00 pm",
                fontWeight: FontWeight.w400,
                color: AppColors.lightNormal,
                bottom: 14,
              ),
               CustomText(
                text: "Link",
                fontWeight: FontWeight.w500,
                fontSize: 14.sp,
                color: AppColors.lightNormalHover,
                bottom: 16,
              ),
              const CustomTextField(
                hintText: "https://marketplace.zoom ... link",
              ),
               CustomText(
                top: 16,
                text: "Password",
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

  final ScheduleController scheduleController = Get.find<ScheduleController>();

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
            child: Obx(
              () {
                return TableCalendar(
                  selectedDayPredicate: (day) =>
                      isSameDay(day, scheduleController.today.value),
                  onDaySelected: (selectedDay, focusedDay) {
                    scheduleController.onDaySelected(selectedDay, focusedDay);
                  },
                  rowHeight: 43,
                  focusedDay: scheduleController.focusedDay.value,
                  firstDay: DateTime.utc(2010),
                  lastDay: DateTime.utc(2050),
                );
              },
            ),
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
                          text: "Consultation",
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
