import 'package:flutter/material.dart';
import 'package:get/get.dart';

enum SnacbarStatus { Success, Failed, Info }

class Reusable {
  static void showSnackbar(String title, String content,
      {required SnacbarStatus status}) {
    late Color? color;
    switch (status) {
      case SnacbarStatus.Success:
        color = Colors.green;
        break;
      case SnacbarStatus.Failed:
        color = Colors.red;
        break;
      case SnacbarStatus.Info:
        color = Colors.blue;
        break;
      default:
        color = null;
    }
    Get.snackbar(title, content,
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: color,
        margin: EdgeInsets.only(bottom: 8, right: 12, left: 12),
        colorText: Colors.white);
  }

  static void showUnderMaintenanceSnackbar() {
    Get.snackbar("Fitur dalam pengembangan", "Saat ini fitur belum tersedia",
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.yellow[300]);
  }
}
