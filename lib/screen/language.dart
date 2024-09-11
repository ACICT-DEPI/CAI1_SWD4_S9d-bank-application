import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../core/constant/routes.dart';
import '../core/localization/change_locale.dart';
import '../widget/language/custom_button_lang.dart';

class Language extends GetView<LocaleController> {
  const Language({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              '1'.tr,
              style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                    color: Theme.of(context).primaryColor,
                  ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 40),
            CustomButtonLang(
              textButton: '3'.tr,
              onPressed: () {
                controller.changeLang('ar');
                Get.toNamed(AppRoute.onboarding);
              },
              icon: Icons.language,
            ),
            CustomButtonLang(
              textButton: '2'.tr,
              onPressed: () {
                controller.changeLang('en');
                Get.toNamed(AppRoute.onboarding);
              },
              icon: Icons.language_outlined,
            ),
            const SizedBox(height: 20),
            const Divider(
              color: Colors.grey,
              thickness: 1,
            ),
            Text(
              '7'.tr,
              style: TextStyle(
                color: Colors.grey[600],
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
