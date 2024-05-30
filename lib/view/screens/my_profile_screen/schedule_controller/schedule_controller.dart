import 'package:get/get.dart';

class ScheduleController extends GetxController {
  var dates = <DateTime>[].obs;

  void updateDates(List<DateTime> newDates) {
    dates.value = newDates;
  }
}
