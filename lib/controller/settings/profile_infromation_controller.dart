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
  UserProfile userProfile = UserProfile();


  @override
  void onReady() {
    username.value = userProfile.username!;
    email.value = userProfile.email!;
    phone.value = userProfile.phoneNumber!;
    profilePicture.value = userProfile.profilePictureUrl ?? "";
    super.onReady();
  }
  @override
  void onInit(){
    // print("username is null: ${userProfile.username}");
    // print("username is null: ${userProfile.phoneNumber}");
    // print("username is null: ${userProfile.email}");
    username.value = userProfile.username!;
    // email.value = userProfile.email!;
    // phone.value = userProfile.phoneNumber!;
    profilePicture.value = userProfile.profilePictureUrl ?? "";
    retrieveUserData();
    everAll([email, phone], (values){
      userProfile.email = email.value;
      userProfile.phoneNumber = phone.value;
    });
    super.onInit();
  }

  @override
  goToEditProfile() {
    Get.toNamed(AppRoute.editProfileScreen);
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
          this.email.value = userData['email'];
          this.phone.value = userData['phone'];

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

  //
  // Future<void> saveUserData() async {
  //   await retrieveUserData();
  //   UserProfile userLoggedIn = UserProfile();
  //   userLoggedIn.updateProfile(
  //       username: this.username.value,
  //       email: this.email.value,
  //       phoneNumber: this.phone.value,
  //       profilePictureUrl: this.profilePicture.value);
  // }

}
