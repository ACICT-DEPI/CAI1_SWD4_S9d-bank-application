import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vaulta/screen/exchange.dart';
import 'package:vaulta/screen/home.dart';
import 'package:vaulta/screen/settings.dart';

abstract class HomePageController extends GetxController {
  void changeTab(int index);
}

class HomePageControllerImpl extends HomePageController {
  // Use RxInt to observe changes in the selected tab index
  RxInt selectedIndex = 0.obs;

  // Define your tab screens in a list
  List<Widget> tabs = [HomeScreen(), ExchangeScreen(), SettingsScreen()];

  @override
  void changeTab(int index) {
    selectedIndex.value = index;
  }
}
