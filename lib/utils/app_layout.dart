import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class AppLayout {
  static getSize(BuildContext context) => MediaQuery.of(context).size;

  static getScreenheight() {
    return Get.height;
  }

  static getScreenwidth() {
    return Get.width;
  }

  static getHeight(double pixels) {
    double x = getScreenheight() / pixels;
    return getScreenheight() / x;
  }

  static getWidth(double pixels) {
    double x = getScreenwidth() / pixels;
    return getScreenwidth() / x;
  }
}
