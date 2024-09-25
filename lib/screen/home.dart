import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vaulta/controller/home_controller.dart';
import 'package:vaulta/core/constant/routes.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    HomeControllerImpl controller = Get.put(HomeControllerImpl());
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
        elevation: 0,
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {
              controller.signOut();
            },
            icon: const Icon(Icons.logout),
          ),
        ],
      ),
      body: Center(
        child: Column(
          children: [
            ElevatedButton(
                onPressed: () {
                  Get.offAllNamed(AppRoute.transfer);
                },
                child: Text('Go to Transfer')),
            ElevatedButton(
                onPressed: () {
                  Get.offAllNamed(AppRoute.transactionReport);
                },
                child: Text('Go to Transaction Report')),
            ElevatedButton(
                onPressed: () {
                  Get.offAllNamed(AppRoute.withdrawScreen);
                },
                child: Text('Go to deposit')),
          ],
        ),
      ),
    );
  }
}
