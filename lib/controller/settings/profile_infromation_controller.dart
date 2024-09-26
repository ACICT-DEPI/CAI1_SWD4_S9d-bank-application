import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:vaulta/core/constant/routes.dart';
import 'package:vaulta/data/model/user_logged_in.dart';

abstract class ProfileInfromationController extends GetxController {
  goToEditProfile();
}

class ProfileInfromationControllerImpl extends ProfileInfromationController {
  Rx<String> username = ''.obs;
  Rx<String> email = ''.obs;
  Rx<String> phone = ''.obs;
  Rx<String> profilePicture = ''.obs;

  @override
  void onInit() {
    retrieveUserData();
    saveUserData();
    super.onInit();
  }

  @override
  goToEditProfile() {
    Get.toNamed(AppRoute.editProfileScreen);
  }

  Future<void> retrieveUserData() async {
    User? user = FirebaseAuth.instance.currentUser;

    if(user != null){
      String userId = user.uid;

      DocumentSnapshot userData = await FirebaseFirestore.instance
          .collection('users')
          .doc(userId)
          .get();

      if(userData.exists){
        this.username.value = userData['username'];
        this.email.value = userData['email'];
        this.phone.value = userData['phone'];
        this.profilePicture.value = userData.get('profile_picture') ?? '';

      }
      else{
        print("no userdata in firestore");
      }
    }
    else{
      print("no user is signed in");
    }

  }

  Future<void> saveUserData() async {
    await retrieveUserData();
    UserProfile userLoggedIn = UserProfile();
    userLoggedIn.updateProfile(
        username: username.value,
        email: email.value,
        phoneNumber: phone.value,
        profilePictureUrl: profilePicture.value);
  }

}
