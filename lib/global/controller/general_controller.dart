import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:k9academy/view/widgets/custom_loader/custom_loader.dart';

class GeneralController extends GetxController {
  showPopUpLoader() {
    return showDialog(
        barrierColor: Colors.transparent,
        context: Get.context!,
        builder: (_) {
          return const SizedBox(
            height: 70,
            child: AlertDialog(
              elevation: 0,
              backgroundColor: Colors.transparent,
              content: CustomLoader(),
            ),
          );
        });
  }
}
