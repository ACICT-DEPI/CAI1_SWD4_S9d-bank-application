import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vaulta/widget/home/grid_view_item.dart';

import '../../controller/home_controller.dart';
import '../../core/constant/imageAssets.dart';

class HomeGridview extends StatelessWidget {
  const HomeGridview({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    HomeControllerImpl controller = Get.put(HomeControllerImpl());
    return Expanded(
      child: GridView.count(
        crossAxisCount: 2,
        mainAxisSpacing: 16,
        crossAxisSpacing: 44,
        childAspectRatio: 1, // Ensures square items
        children: [
          GridViewItem(
              onTap: () {
                controller.goToWithdrawScreen();
              },
              imagePath: AppImageassets.withdrawImage,
              label: '70'.tr),
          GridViewItem(
              onTap: () {
                controller.goToTransferScreen();
              },
              imagePath: AppImageassets.transferImage,
              label: '71'.tr),
          GridViewItem(
              onTap: () {
                controller.goToTransactionScreen();
              },
              imagePath: AppImageassets.reportImage,
              label: '72'.tr),
          GridViewItem(
              onTap: () {
                controller.goToAccountScreen();
              },
              imagePath: AppImageassets.accountImage,
              label: '73'.tr),
          GridViewItem(
              onTap: () {
                controller.goToBillScreen();
              },
              imagePath: AppImageassets.billImage,
              label: '74'.tr),
        ],
      ),
    );
  }
}
