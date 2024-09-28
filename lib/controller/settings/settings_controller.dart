import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:vaulta/core/services/sevices.dart';
import 'package:vaulta/data/model/user_logged_in.dart';

import '../../core/constant/routes.dart';

abstract class SettingsController extends GetxController {
  gotToProfileInformation();
  goToLanguage();
  goToAppInfo();
  Future<void> retrieveUserData();
  signOut();
}

class SettingsControllerImpl extends SettingsController {
  Rx<String> username = ''.obs;
  Rx<String> profilePicture = ''.obs;
  UserProfile userProfile = UserProfile();
  MyServices myServices = Get.find();

  @override
  void onReady() {
    // Check if the userProfile values are null before assigning them
    if (userProfile.username != null) {
      username.value = userProfile.username!;
    } else {
      // Provide a default value in case username is null
      username.value = "Unknown User";
    }

    if (userProfile.profilePictureUrl != null) {
      profilePicture.value = userProfile.profilePictureUrl!;
    } else {
      // Provide a default value in case profilePictureUrl is null
      profilePicture.value = "";
    }

    super.onReady();
  }

  @override
  void onInit() {
    retrieveUserData();
    everAll([username, profilePicture], (values) {
      userProfile.username = username.value;
      userProfile.profilePictureUrl = profilePicture.value;
    });
    // saveUserData();
    super.onInit();
  }

  @override
  Future<void> retrieveUserData() async {
    try {
      User? user = FirebaseAuth.instance.currentUser;

      if (user != null) {
        String userId = user.uid;

        DocumentSnapshot userData = await FirebaseFirestore.instance
            .collection('users')
            .doc(userId)
            .get();

        if (userData.exists) {
          this.username.value = userData['username'];
          this.profilePicture.value = userData.get('profile_picture') ?? '';
        } else {
          print("no userdata in firestore");
        }
      } else {
        print("no user is signed in");
      }
    } on FirebaseAuthException catch (e) {
      print("Error retrieving user data: ${e.message}");
    }
  }

  @override
  goToAppInfo() {
    Get.toNamed(AppRoute.appInfoScreen);
  }

  @override
  goToLanguage() {
    Get.toNamed(AppRoute.languageProfileScreen);
  }

  @override
  gotToProfileInformation() {
    Get.toNamed(AppRoute.profileInfromationScreen);
  }

  @override
  signOut() {
    myServices.sharedPreferences.remove('userid');
    FirebaseAuth.instance.signOut();
    Get.offAllNamed(AppRoute.login);
  }
}
