import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vaulta/controller/settings/profile_infromation_controller.dart';

class ProfileInfromationScrenn extends StatelessWidget {
  const ProfileInfromationScrenn({super.key});

  @override
  Widget build(BuildContext context) {
    ProfileInfromationControllerImpl controller =
        Get.put(ProfileInfromationControllerImpl());
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile Information'),
        elevation: 0,
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          children: [
            ElevatedButton(
                onPressed: () {
                  controller.goToEditProfile();
                },
                child: Text('Go to Edit Profile')),
          ],
        ),
      ),
    );
  }
}
