import 'package:get/get.dart';

class ScheduleController extends GetxController {
  Rx<DateTime> today = DateTime.now().obs;
  Rx<DateTime> focusedDay = DateTime.now().obs;

  void onDaySelected(DateTime selected, DateTime focused) {
    today.value = selected;
    focusedDay.value = focused;
  }
}
