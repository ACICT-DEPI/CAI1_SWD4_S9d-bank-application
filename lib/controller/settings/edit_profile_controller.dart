import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:vaulta/data/model/user_logged_in.dart';

abstract class EditProfileController extends GetxController {
  gotToProfileInformation();
}

class EditProfileControllerImpl extends EditProfileController {

  // Rx<String> username =''.obs;
  // Rx<String> email=''.obs;
  // Rx<String> phone=''.obs;
  // Rx<String> profilePic=''.obs;

  UserProfile userProfile = UserProfile();

  @override
  void onInit() {
    print("username: ${userProfile.username}");
    super.onInit();
  }

  @override
  gotToProfileInformation() {
    Get.back();
  }

  // void retrieveUserData() async {
  //   User? user = FirebaseAuth.instance.currentUser;
  //
  //   if(user != null){
  //     String userId = user.uid;
  //
  //     DocumentSnapshot userData = await FirebaseFirestore.instance
  //         .collection('users')
  //         .doc(userId)
  //         .get();
  //
  //     if(userData.exists){
  //       this.username = userData['username'];
  //       this.email= userData['email'];
  //       this.phone = userData['phone'];
  //       this.profilePic = userData.get('profile_picture') ?? '';
  //
  //     }
  //     else{
  //       print("no userdata in firestore");
  //     }
  //   }
  //   else{
  //     print("no user is signed in");
  //   }
  //
  // }




}
