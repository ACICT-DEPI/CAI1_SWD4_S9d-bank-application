import 'dart:io';

import 'package:get/get.dart';
import 'package:path_provider/path_provider.dart';
import 'package:screenshot/screenshot.dart';
import 'package:share/share.dart';

import '../../core/constant/routes.dart';

abstract class SuccessTransferController extends GetxController {
  goToHomeScreen();
  takeScreenshot();
}

class SuccessTransferControllerImpl extends SuccessTransferController {
  late String toUsername;
  late int amount;
  late ScreenshotController screenshotController;
  @override
  goToHomeScreen() {
    Get.offAllNamed(AppRoute.homePage);
  }

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    toUsername = Get.arguments['to'] ?? '';
    amount = Get.arguments['amount'] ?? '';
    screenshotController = ScreenshotController();
  }

  @override
  takeScreenshot() async {
    // Capture the screenshot
    final imageFile = await screenshotController.capture();

    // Check if the imageFile is null
    if (imageFile == null) {
      // Handle the case where the screenshot fails
      print("Screenshot capture failed.");
      return;
    }

    // Get the temporary directory for saving the image
    final directory = await getTemporaryDirectory();

    // Create the image file path
    final imagePath = '${directory.path}/screenshot.png';

    // Save the image file
    final file = File(imagePath);
    await file.writeAsBytes(imageFile);

    // Share the image file
    Share.shareFiles([file.path], text: "Here is your transaction screenshot!");
  }
}
