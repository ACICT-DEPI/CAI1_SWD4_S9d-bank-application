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
}

class HomeControllerImpl extends HomeController {
  MyServices myServices = Get.find();

  RxString username = ''.obs;
  RxString imagePath = ''.obs; // For user image
  late String userId;
  late FirebaseFirestore firestore;
  final FirebaseAuth auth = FirebaseAuth.instance; // Initialize Firebase Auth

  fetchUsername() async {
    final user = await firestore.collection('users').doc(userId).get();
    username.value = user['username'];
    fetchUserImage(); // Fetch the user image based on Firebase Auth user
  }

  fetchUserImage() {
    User? currentUser = auth.currentUser; // Get the current user
    if (currentUser != null) {
      // Check if the user has a photo URL
      if (currentUser.photoURL != null) {
        imagePath.value = currentUser.photoURL!; // Fetch image URL if available
      } else {
        imagePath.value = ''; // Set to empty if no photo URL
      }
    } else {
      imagePath.value = ''; // Set to empty if no user is logged in
    }
  }

  @override
  goToTransferScreen() {
    Get.offNamed(AppRoute.transfer);
  }

  @override
  goToAccountScreen() {
    Get.offNamed(AppRoute.accountAndCardScreen);
  }

  @override
  goToTransactionScreen() {
    Get.offNamed(AppRoute.transactionReport);
  }

  @override
  goToWithdrawScreen() {
    Get.offNamed(AppRoute.withdrawScreen);
  }

  @override
  void onInit() {
    super.onInit();
    userId = myServices.sharedPreferences.getString('userid')!;
    firestore = FirebaseFirestore.instance;
    fetchUsername();
  }
}
