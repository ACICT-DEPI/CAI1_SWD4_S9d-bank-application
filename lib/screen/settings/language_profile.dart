import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vaulta/controller/settings/language_page_controller.dart';

class LanguageProfileScreen extends StatelessWidget {
  const LanguageProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    LanguagePageControllerImpl controller =
        Get.put(LanguagePageControllerImpl());
    return Scaffold(
      appBar: AppBar(
        title: Text('Language'),
        elevation: 0,
        centerTitle: true,
      ),
      body: Center(
        child: Text('Language Screen'),
      ),
    );
  }
}
