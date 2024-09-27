import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:vaulta/data/model/user_logged_in.dart';

import '../../core/constant/routes.dart';

abstract class SettingsController extends GetxController {
  gotToProfileInformation();
  goToLanguage();
  goToAppInfo();
}

class SettingsControllerImpl extends SettingsController {

  Rx<String> username = ''.obs;
  Rx<String> profilePicture = ''.obs;
  UserProfile userProfile = UserProfile();




  @override
  void onReady() {
    print("on ready called");
    username.value = userProfile.username!;
    profilePicture.value = userProfile.profilePictureUrl!;
    print("username is null: ${username.value.isNotEmpty}");
    // print("phone is null: ${phone.value.isNotEmpty}");
    // print("email is null: ${email.value.isNotEmpty}");
    super.onReady();
  }

  @override
  void onInit() {
    retrieveUserData();
    ever(username, (values){
      print("updated username!!!");
      // print("phone ${phone.value}");
      // print("email ${email.value}");
      userProfile.username = username.value;
    });
    // saveUserData();
    super.onInit();
  }

  Future<void> retrieveUserData() async {
    try{
      User? user = FirebaseAuth.instance.currentUser;

      if(user != null){
        String userId = user.uid;

        DocumentSnapshot userData = await FirebaseFirestore.instance
            .collection('users')
            .doc(userId)
            .get();

        if(userData.exists){
          this.username.value = userData['username'];
          this.profilePicture.value = userData.get('profile_picture') ?? '';

        }
        else{
          print("no userdata in firestore");
        }
      }
      else{
        print("no user is signed in");
      }
    }on FirebaseAuthException catch(e){
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
}
