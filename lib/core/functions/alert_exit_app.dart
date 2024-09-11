import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

Future<bool> alertExitApp() {
  Get.defaultDialog(
    title: 'Exit App',
    titleStyle: TextStyle(
      fontSize: 24,
      fontWeight: FontWeight.bold,
      color: Colors.redAccent,
    ),
    middleText: 'Are you sure you want to exit the app?',
    middleTextStyle: TextStyle(
      fontSize: 18,
      color: Colors.grey[700],
    ),
    backgroundColor: Colors.white,
    radius: 15,
    actions: [
      ElevatedButton(
        onPressed: () {
          Get.back();
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.greenAccent,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        child: Text(
          'No',
          style: TextStyle(color: Colors.white),
        ),
      ),
      ElevatedButton(
        onPressed: () {
          exit(0);
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.redAccent,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        child: Text(
          'Yes',
          style: TextStyle(color: Colors.white),
        ),
      ),
    ],
    barrierDismissible:
        false, // Disable dismissal when tapping outside the dialog
  );
  return Future.value(true);
}
