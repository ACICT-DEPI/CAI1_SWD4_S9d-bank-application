import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:vaulta/core/constant/routes.dart';
import 'package:vaulta/core/services/sevices.dart';
import 'package:vaulta/data/model/user_logged_in.dart';

abstract class ProfileInfromationController extends GetxController {
  goToEditProfile();
  Future<void> retrieveUserData();
}

class ProfileInfromationControllerImpl extends ProfileInfromationController {
  bool dataIsEdited = false;
  Rx<String> username = ''.obs;
  Rx<String> email = ''.obs;
  Rx<String> phone = ''.obs;
  Rx<String> profilePicture = ''.obs;
  UserProfile userProfile = UserProfile();
  MyServices myServices = Get.find();

  @override
  void onReady() {
    // Using null-aware operators to avoid the null check error
    username.value = userProfile.username ?? ''; // Provide a fallback if null
    email.value = userProfile.email ?? '';
    phone.value = userProfile.phoneNumber ?? '';
    profilePicture.value = userProfile.profilePictureUrl ?? '';

    super.onReady();
  }

  @override
  void onInit() {
    username.value = userProfile.username ?? ''; // Updated
    profilePicture.value = userProfile.profilePictureUrl ?? '';
    retrieveUserData();
    everAll([email, phone, profilePicture], (values) {
      userProfile.email = email.value;
      userProfile.phoneNumber = phone.value;
      userProfile.profilePictureUrl = profilePicture.value;
    });
    super.onInit();
  }

  @override
  goToEditProfile() {
    Get.offNamed(AppRoute.editProfileScreen);
  }

  // @override
  // Future<void> retrieveUserData() async {
  //   try {
  //     String? userId = myServices.sharedPreferences.getString('userid');
  //     if (userId == null) {
  //       print("User ID is null");
  //       return;
  //     }
  //
  //     DocumentSnapshot userData = await FirebaseFirestore.instance
  //         .collection('users')
  //         .doc(userId)
  //         .get();
  //
  //     if (userData.exists) {
  //       this.email.value = userData['email'] ?? '';
  //       this.phone.value = userData['phone'] ?? '';
  //       // this.profilePicture.value = userData['profile_picture'] ?? '';
  //     } else {
  //       print("No user data in Firestore");
  //     }
  //   } on FirebaseAuthException catch (e) {
  //     print("Error retrieving user data: ${e.message}");
  //   }
  // }
  @override
  Future<void> retrieveUserData() async {
    try {
      String? userId = myServices.sharedPreferences.getString('userid');

      if (userId != null) {
        // String userId = user.uid;

        DocumentSnapshot userData = await FirebaseFirestore.instance
            .collection('users')
            .doc(userId)
            .get();

        if (userData.exists) {
          this.email.value = userData['email'];
          this.phone.value = userData['phone'];
          this.profilePicture.value = userData['profile_picture'];
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
}
