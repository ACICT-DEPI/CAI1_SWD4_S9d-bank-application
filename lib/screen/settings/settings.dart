import 'package:flutter/material.dart';
import 'package:focus_detector/focus_detector.dart';
import 'package:get/get.dart';
import 'package:vaulta/controller/settings/settings_controller.dart';
import 'package:vaulta/core/constant/color.dart';

class SettingsScreen extends StatelessWidget {
  SettingsScreen({super.key});

  onPause() {}

  @override
  Widget build(BuildContext context) {
    SettingsControllerImpl controller = Get.put(SettingsControllerImpl());
    onResume() {
      controller.onReady();
    }

    return FocusDetector(
      onFocusGained: onResume,
      onFocusLost: onPause,
      child: Scaffold(
          appBar: AppBar(
            backgroundColor: AppColor.primaryColor,
            title: Text(
              '55'.tr,
              style:
                  TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
            ),
            elevation: 0,
          ),
          body: Container(
            padding: EdgeInsets.only(top: 20),
            color: AppColor.primaryColor,
            child: Stack(
              alignment: Alignment.topCenter,
              children: [
                Container(
                  padding: EdgeInsets.only(top: 50),
                  child: Container(
                    padding: EdgeInsets.fromLTRB(24, 110, 24, 0),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(25),
                            topRight: Radius.circular(25)),
                        color: Colors.white),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Center(),
                        Container(
                          padding: EdgeInsets.symmetric(vertical: 5),
                          width: double.infinity,
                          alignment: Alignment.centerLeft,
                          decoration: BoxDecoration(
                              border: Border(
                                  bottom:
                                      BorderSide(color: Colors.grey.shade300))),
                          child: TextButton(
                              onPressed: () {
                                controller.gotToProfileInformation();
                              },
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Expanded(
                                    child: Text(
                                      '56'.tr,
                                      style: TextStyle(
                                          fontSize: 18, color: Colors.black),
                                    ),
                                  ),
                                  Icon(Icons.arrow_forward_ios_rounded,
                                      size: 16, color: Colors.grey.shade300)
                                ],
                              )),
                        ),
                        Container(
                          padding: EdgeInsets.symmetric(vertical: 5),
                          width: double.infinity,
                          alignment: Alignment.centerLeft,
                          decoration: BoxDecoration(
                              border: Border(
                                  bottom:
                                      BorderSide(color: Colors.grey.shade300))),
                          child: TextButton(
                              onPressed: () {
                                controller.goToLanguage();
                              },
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Expanded(
                                    child: Text(
                                      '50'.tr,
                                      style: TextStyle(
                                          fontSize: 18, color: Colors.black),
                                    ),
                                  ),
                                  Icon(Icons.arrow_forward_ios_rounded,
                                      size: 16, color: Colors.grey.shade300)
                                ],
                              )),
                        ),
                        Container(
                          padding: EdgeInsets.symmetric(vertical: 5),
                          width: double.infinity,
                          alignment: Alignment.centerLeft,
                          decoration: BoxDecoration(
                              border: Border(
                                  bottom:
                                      BorderSide(color: Colors.grey.shade300))),
                          child: TextButton(
                              onPressed: () {
                                controller.goToAppInfo();
                              },
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Expanded(
                                    child: Text(
                                      '51'.tr,
                                      style: TextStyle(
                                          fontSize: 18, color: Colors.black),
                                    ),
                                  ),
                                  Icon(Icons.arrow_forward_ios_rounded,
                                      size: 16, color: Colors.grey.shade300)
                                ],
                              )),
                        ),
                        Container(
                            padding: EdgeInsets.symmetric(
                                vertical: 10, horizontal: 7),
                            width: double.infinity,
                            alignment: Alignment.centerLeft,
                            decoration: BoxDecoration(
                                border: Border(
                                    bottom: BorderSide(
                                        color: Colors.grey.shade300))),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Expanded(
                                  child: Text(
                                    '57'.tr,
                                    style: TextStyle(
                                        fontSize: 18, color: Colors.black),
                                  ),
                                ),
                                Text(
                                  '123456',
                                  style: TextStyle(
                                      fontSize: 18,
                                      color: Colors.grey.shade500),
                                ),
                              ],
                            ))
                      ],
                    ),
                  ),
                ),
                Obx(() {
                  return Column(
                    children: [
                      controller.profilePicture.value.isNotEmpty
                          ? CircleAvatar(
                              radius: 50,
                              backgroundImage:
                                  NetworkImage(controller.profilePicture.value),
                            )
                          : CircleAvatar(
                              // backgroundColor: Colors.grey,
                              child: Text(
                                style: TextStyle(
                                    fontSize: 40, color: AppColor.primaryColor),
                                controller.username.value.substring(0, 1),
                              ),
                              radius: 50,
                            ),
                      Text(
                        controller.username.value.isNotEmpty
                            ? controller.username.value
                            : "",
                        style: TextStyle(
                            fontSize: 20,
                            color: AppColor.primaryColor,
                            fontWeight: FontWeight.w600),
                      )
                    ],
                  );
                }),
              ],
            ),
          )),
    );
    ;
  }
}
