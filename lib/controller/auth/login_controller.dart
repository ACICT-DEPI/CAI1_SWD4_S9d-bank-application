import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:vaulta/core/functions/awesome_dialoge.dart';
import 'package:vaulta/core/services/sevices.dart';

import '../../core/constant/routes.dart';

abstract class LogInController extends GetxController {
  void logIn();
  goToSignUp();
  goToForgetPassword();
  Future signInWithGoogle();
}

class LogInControllerImpl extends LogInController {
  late TextEditingController emailController;
  late TextEditingController passwordController;
  late GlobalKey<FormState> formKey;
  bool isShowPassword = true;
  MyServices myServices = Get.find();
  showPassword() {
    isShowPassword = !isShowPassword;
    update();
  }

  @override
  void logIn() async {
    var form = formKey.currentState;
    if (form!.validate()) {
      try {
        final credential = await FirebaseAuth.instance
            .signInWithEmailAndPassword(
                email: emailController.text, password: passwordController.text);
        myServices.sharedPreferences.setString('userid', credential.user!.uid);
        if (credential.user!.emailVerified) {
          Get.offAllNamed(AppRoute.homePage);
        } else {
          FirebaseAuth.instance.currentUser!.sendEmailVerification();

          showAwesomeDialog(
            Get.context!,
            title: '182'.tr,
            desc: '187'.tr,
            onOk: () {
              Get.back();
            },
            dialogType: DialogType.error,
          );
        }
        update();
      } on FirebaseAuthException catch (e) {
        if (e.code == 'user-not-found') {
          showAwesomeDialog(
            Get.context!,
            title: '182'.tr,
            desc: '188'.tr,
            onOk: () {
              Get.back();
            },
            dialogType: DialogType.error,
          );
        } else if (e.code == 'wrong-password') {
          showAwesomeDialog(
            Get.context!,
            title: '182'.tr,
            desc: '189'.tr,
            onOk: () {
              Get.back();
            },
            dialogType: DialogType.error,
          );
        } else if (e.code == 'invalid-email') {
          showAwesomeDialog(
            Get.context!,
            title: '182'.tr,
            desc: '190'.tr,
            onOk: () {
              Get.back();
            },
            dialogType: DialogType.error,
          );
        } else if (e.code == 'user-disabled') {
          showAwesomeDialog(
            Get.context!,
            title: '182'.tr,
            desc: '191'.tr,
            onOk: () {
              Get.back();
            },
            dialogType: DialogType.error,
          );
        } else if (e.code == 'invalid-credential') {
          showAwesomeDialog(
            Get.context!,
            title: '182'.tr,
            desc: '192'.tr,
            onOk: () {
              Get.back();
            },
            dialogType: DialogType.error,
          );
        } else {
          showAwesomeDialog(
            Get.context!,
            title: '193'.tr,
            desc: '${'194'.tr}${e.code}',
            onOk: () {
              Get.back();
            },
            dialogType: DialogType.error,
          );
        }
      } catch (e) {
        showAwesomeDialog(
          Get.context!,
          title: '182'.tr,
          desc: '${'195'.tr}$e',
          onOk: () {
            Get.back();
          },
          dialogType: DialogType.error,
        );
      }
    } else {
      print('Form validation failed');
    }
  }

  @override
  goToSignUp() {
    Get.offNamed(AppRoute.signUp);
  }

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    emailController = TextEditingController();
    passwordController = TextEditingController();
    formKey = GlobalKey<FormState>();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    emailController.dispose();
    passwordController.dispose();
  }

  @override
  goToForgetPassword() async {
    try {
      if (emailController.text.isEmpty) {
        showAwesomeDialog(
          Get.context!,
          title: '182'.tr,
          desc: '196'.tr,
          onOk: () {
            Get.back();
          },
          dialogType: DialogType.error,
        );
        return;
      }
      final email = emailController.text;
      // final checkEmailAvailable =
      //     await FirebaseAuth.instance.fetchSignInMethodsForEmail(email);
      // print(checkEmailAvailable);

      final findEmail = await FirebaseFirestore.instance
          .collection('users')
          .where('email', isEqualTo: email)
          .get();
      if (findEmail.docs.isEmpty) {
        showAwesomeDialog(
          Get.context!,
          title: '182'.tr,
          desc: '197'.tr,
          onOk: () {
            Get.back();
          },
          dialogType: DialogType.error,
        );
        return;
      }

      await FirebaseAuth.instance
          .sendPasswordResetEmail(email: emailController.text);

      Get.offNamed(AppRoute.successResetPassword);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'invalid-email') {
        showAwesomeDialog(
          Get.context!,
          title: '182'.tr,
          desc: '198'.tr,
          onOk: () {
            Get.back();
          },
          dialogType: DialogType.error,
        );
      } else if (e.code == 'user-not-found') {
        showAwesomeDialog(
          Get.context!,
          title: '182'.tr,
          desc: '188'.tr,
          onOk: () {
            Get.back();
          },
          dialogType: DialogType.error,
        );
      } else {
        showAwesomeDialog(
          Get.context!,
          title: '182'.tr,
          desc: '${'194'.tr}${e.code}',
          onOk: () {
            Get.back();
          },
          dialogType: DialogType.error,
        );
      }
    } catch (e) {
      showAwesomeDialog(
        Get.context!,
        title: '182'.tr,
        desc: '${'195'.tr}$e',
        onOk: () {
          Get.back();
        },
        dialogType: DialogType.error,
      );
    }
  }

  @override
  signInWithGoogle() async {
    try {
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
      if (googleUser == null) return; // User canceled the sign-in

      final GoogleSignInAuthentication googleAuth =
          await googleUser.authentication;
      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      final userCredential =
          await FirebaseAuth.instance.signInWithCredential(credential);

      // Save the user ID to shared preferences
      myServices.sharedPreferences
          .setString('userid', userCredential.user!.uid);

      // Get user details
      String displayName = userCredential.user!.displayName ?? "User";
      String userId = userCredential.user!.uid;
      String email = userCredential.user!.email ?? "unknown@unknown.com";

      // Check if the user exists in Firestore (first-time login check)
      DocumentSnapshot userDoc = await FirebaseFirestore.instance
          .collection('users')
          .doc(userId)
          .get();

      if (!userDoc.exists) {
        // First-time user, generate a username based on their email and store them in Firestore
        String username = _generateUsernameFromEmail(email);

        // Check if the username already exists and ensure it's unique
        String uniqueUsername = await _ensureUniqueUsername(username);
        await FirebaseFirestore.instance.collection('users').doc(userId).set({
          'uid': userId,
          'email': email,
          'username': uniqueUsername,
          'phone': "",
          'balance': 0,
          'profile_picture': '',
        });
        // Show dialog with generated username
        showAwesomeDialog(Get.context!, title: uniqueUsername, desc: '199'.tr,
            onOk: () {
          Get.offAllNamed(AppRoute.homePage);
        }, dialogType: DialogType.success);

        // Add the user to the Firestore users' collection
      } else {
        // User already exists, no need to generate a username
        Get.offAllNamed(AppRoute.homePage);
      }

      // Navigate to home page
    } catch (e) {
      print("Error during Google Sign In: $e");
      // Handle the error appropriately
    }
  }

// Function to generate a username from the user's email
  String _generateUsernameFromEmail(String email) {
    String username = email.split('@')[0]; // Take part before @ in email
    username = username
        .replaceAll(RegExp(r'[^a-zA-Z0-9]'), '')
        .toLowerCase(); // Remove special characters, convert to lowercase
    String randomNum =
        (1000 + (1000 * (DateTime.now().millisecondsSinceEpoch % 1000)))
            .toString();
    return username + randomNum; // Example: johndoe1234
  }

// Ensure the generated username is unique by checking Firestore
  Future<String> _ensureUniqueUsername(String username) async {
    bool exists = await FirebaseFirestore.instance
        .collection('users')
        .where('username', isEqualTo: username)
        .get()
        .then((snapshot) => snapshot.docs.isNotEmpty);

    if (exists) {
      // If username exists, append random numbers or re-generate a new username
      return _generateUsernameFromEmail(username);
    }

    return username;
  }
}
