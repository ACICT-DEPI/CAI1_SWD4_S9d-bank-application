import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vaulta/controller/settings/settings_controller.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    SettingsControllerImpl controller = Get.put(SettingsControllerImpl());
    return Scaffold(
      appBar: AppBar(
        title: Text('Settings'),
        elevation: 0,
        centerTitle: true,
      ),
      body: Column(
        children: [
          Center(
            child: Text('Settings Screen'),
          ),
          ElevatedButton(
              onPressed: () {
                controller.gotToProfileInformation();
              },
              child: Text('Go to Profile Information')),
          ElevatedButton(
              onPressed: () {
                controller.goToLanguage();
              },
              child: Text('Go to Language')),
          ElevatedButton(
              onPressed: () {
                controller.goToAppInfo();
              },
              child: Text('Go to App Info')),
        ],
      ),
    );
  }
}
