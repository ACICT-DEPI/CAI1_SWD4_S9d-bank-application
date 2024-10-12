import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart'; // Import Firebase Auth
import 'package:get/get.dart';
import 'package:vaulta/core/services/sevices.dart';

import '../core/constant/routes.dart';

abstract class HomeController extends GetxController {
  goToTransferScreen();
  goToTransactionScreen();
  goToWithdrawScreen();
  goToAccountScreen();
  goToBillScreen();
}

class HomeControllerImpl extends HomeController {
  MyServices myServices = Get.find();

  RxString username = ''.obs;
  RxString imagePath = ''.obs; // For user image
  late String userId;
  late FirebaseFirestore firestore;
  final FirebaseAuth auth = FirebaseAuth.instance; // Initialize Firebase Auth

  // Fetch the username from Firestore
  fetchUsername() async {
    final user = await firestore.collection('users').doc(userId).get();
    username.value = user['username'];
  }

  // Fetch the user image from Firestore or Firebase Auth
  fetchUserImage() async {
    User? currentUser = auth.currentUser; // Get the current user
    if (currentUser != null) {
      try {
        // Await the result of the Firestore query
        var userDoc =
            await firestore.collection('users').doc(currentUser.uid).get();
        if (userDoc.exists &&
            userDoc.data() != null &&
            userDoc['profile_picture'] != '') {
          imagePath.value = userDoc['profile_picture'] ?? '';
          print('User image fetched from Firestore');
        } else if (currentUser.photoURL != null) {
          imagePath.value = currentUser.photoURL!;
          print('User image fetched from Firebase Auth');
        } else {
          imagePath.value = ''; // Set to empty if no image is found
          print('No user image found');
        }
      } catch (e) {
        imagePath.value = ''; // Set to empty if there was an error
        print('Error fetching user image from Firestore: $e');
      }
    } else {
      imagePath.value = ''; // Set to empty if no user is logged in
    }
  }

  // Fetch both username and image (to use in onReady)
  fetchUserData() {
    fetchUsername();
    fetchUserImage();
  }

  @override
  void onReady() {
    super.onReady();
    // Fetch updated data when the screen is ready (e.g., after coming back from Settings)
    fetchUserData();
  }

  @override
  void onInit() {
    super.onInit();
    userId = myServices.sharedPreferences.getString('userid')!;
    firestore = FirebaseFirestore.instance;
    fetchUserData(); // Initially load the user data
  }

  @override
  goToTransferScreen() {
    Get.toNamed(AppRoute.transfer);
  }

  @override
  goToAccountScreen() {
    Get.toNamed(AppRoute.accountAndCardScreen);
  }

  @override
  goToTransactionScreen() {
    Get.toNamed(AppRoute.transactionReport);
  }

  @override
  goToWithdrawScreen() {
    Get.toNamed(AppRoute.withdrawScreen);
  }

  @override
  goToBillScreen() {
    Get.toNamed(AppRoute.billScreen);
  }
}
