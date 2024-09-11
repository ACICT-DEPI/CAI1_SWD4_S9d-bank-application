import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vaulta/routes.dart';

import 'core/localization/change_locale.dart';
import 'core/localization/translation.dart';
import 'core/services/sevices.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initServices();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    LocaleController controller = Get.put(LocaleController());
    return GetMaterialApp(
      translations: MyTranslation(),
      // routes: routes,
      getPages: routes,
      debugShowCheckedModeBanner: false,
      locale: controller.language,
      title: 'Flutter Demo',
      theme: controller.appTheme,
      // home: const Language(),
    );
  }
}
