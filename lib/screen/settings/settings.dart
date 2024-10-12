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
            style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
          ),
          elevation: 0,
          actions: [
            // New sign-out button placed at the top-right corner
            Padding(
              padding: EdgeInsets.only(right: 20),
              child: IconButton(
                icon: Icon(Icons.logout),
                color: Colors.white,
                onPressed: () {
                  controller.signOut();
                },
              ),
            ),
          ],
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
                      topRight: Radius.circular(25),
                    ),
                    color: Colors.white,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Center(),
                      // Profile Information Container
                      _buildSettingOption(
                        context,
                        title: '56'.tr,
                        onPressed: controller.gotToProfileInformation,
                      ),
                      // Language Settings
                      _buildSettingOption(
                        context,
                        title: '50'.tr,
                        onPressed: controller.goToLanguage,
                      ),
                      // App Info
                      _buildSettingOption(
                        context,
                        title: '51'.tr,
                        onPressed: controller.goToAppInfo,
                      ),
                      // Static Info
                      Container(
                        padding:
                            EdgeInsets.symmetric(vertical: 10, horizontal: 7),
                        width: double.infinity,
                        alignment: Alignment.centerLeft,
                        decoration: BoxDecoration(
                          border: Border(
                            bottom: BorderSide(color: Colors.grey.shade300),
                          ),
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Expanded(
                              child: Text(
                                '57'.tr,
                                style: TextStyle(
                                  fontSize: 18,
                                  color: Colors.black,
                                ),
                              ),
                            ),
                            Text(
                              '123456',
                              style: TextStyle(
                                fontSize: 18,
                                color: Colors.grey.shade500,
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 20),
                    ],
                  ),
                ),
              ),
              Obx(() {
                return Column(
                  children: [
                    // Profile Avatar and Username
                    controller.profilePicture.value.isNotEmpty
                        ? CircleAvatar(
                            radius: 50,
                            backgroundImage:
                                NetworkImage(controller.profilePicture.value),
                          )
                        : CircleAvatar(
                            child: Text(
                              controller.username.value.isNotEmpty
                                  ? controller.username.value[0].toUpperCase()
                                  : "",
                              style: TextStyle(
                                fontSize: 40,
                                color: AppColor.primaryColor,
                              ),
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
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                );
              }),
            ],
          ),
        ),
      ),
    );
  }

  // A helper method to build setting options
  Widget _buildSettingOption(
    BuildContext context, {
    required String title,
    required Function onPressed,
  }) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 5),
      width: double.infinity,
      alignment: Alignment.centerLeft,
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(color: Colors.grey.shade300),
        ),
      ),
      child: TextButton(
        onPressed: () => onPressed(),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Expanded(
              child: Text(
                title,
                style: TextStyle(fontSize: 18, color: Colors.black),
              ),
            ),
            Icon(
              Icons.arrow_forward_ios_rounded,
              size: 16,
              color: Colors.grey.shade300,
            ),
          ],
        ),
      ),
    );
  }
}
