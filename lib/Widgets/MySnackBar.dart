import 'package:easyshop_app/Utils/AppConstants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void showSnackBar({required String title, required String message,
  Color? backgroundColor, Color? colorText, SnackPosition? snackPosition})
{
  Get.snackbar(
    title,
    message,
    snackPosition: SnackPosition.BOTTOM,
    backgroundColor: AppConstants.appMainColor,
    colorText: AppConstants.appTextColor,
    margin: const EdgeInsets.all(15.0),
    duration: const Duration(seconds: 3),
  );
}

