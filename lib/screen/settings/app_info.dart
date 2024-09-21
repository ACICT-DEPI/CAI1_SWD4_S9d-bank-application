import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controller/settings/app_info_controller.dart';

class AppInfoScreen extends StatelessWidget {
  const AppInfoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    AppInfoControllerImpl controller = Get.put(AppInfoControllerImpl());
    return Scaffold(
      appBar: AppBar(
        title: Text('App Info'),
        elevation: 0,
        centerTitle: true,
      ),
      body: Center(
        child: Text('App Info Screen'),
      ),
    );
  }
}
