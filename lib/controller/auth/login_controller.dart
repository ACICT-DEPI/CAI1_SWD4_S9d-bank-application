import 'package:awesome_dialog/awesome_dialog.dart';
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
          Get.offNamed(AppRoute.home);
        } else {
          FirebaseAuth.instance.currentUser!.sendEmailVerification();

          showAwesomeDialog(
            Get.context!,
            title: 'Error',
            desc: 'Please verify your email',
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
            title: 'Error',
            desc: 'No user found for that email.',
            onOk: () {
              Get.back();
            },
            dialogType: DialogType.error,
          );
        } else if (e.code == 'wrong-password') {
          showAwesomeDialog(
            Get.context!,
            title: 'Error',
            desc: 'Wrong password provided for that user.',
            onOk: () {
              Get.back();
            },
            dialogType: DialogType.error,
          );
        } else if (e.code == 'invalid-email') {
          showAwesomeDialog(
            Get.context!,
            title: 'Error',
            desc: 'Invalid email provided.',
            onOk: () {
              Get.back();
            },
            dialogType: DialogType.error,
          );
        } else if (e.code == 'user-disabled') {
          showAwesomeDialog(
            Get.context!,
            title: 'Error',
            desc: 'The user account has been disabled by an administrator.',
            onOk: () {
              Get.back();
            },
            dialogType: DialogType.error,
          );
        } else if (e.code == 'invalid-credential') {
          showAwesomeDialog(
            Get.context!,
            title: 'Error',
            desc: 'Check your email or password',
            onOk: () {
              Get.back();
            },
            dialogType: DialogType.error,
          );
        } else {
          showAwesomeDialog(
            Get.context!,
            title: 'Login Failed',
            desc: 'Something went wrong: ${e.code}',
            onOk: () {
              Get.back();
            },
            dialogType: DialogType.error,
          );
        }
      } catch (e) {
        showAwesomeDialog(
          Get.context!,
          title: 'Error',
          desc: 'An unexpected error occurred: $e',
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
          title: 'Error',
          desc: 'Please enter your email address',
          onOk: () {
            Get.back();
          },
          dialogType: DialogType.error,
        );
        return;
      }

      final List<String> signInMethods = await FirebaseAuth.instance
          .fetchSignInMethodsForEmail(emailController.text);

      if (signInMethods.isEmpty) {
        showAwesomeDialog(
          Get.context!,
          title: 'Error',
          desc: 'No user found for that email.',
          onOk: () {
            Get.back();
          },
          dialogType: DialogType.error,
        );
      } else {
        await FirebaseAuth.instance
            .sendPasswordResetEmail(email: emailController.text);
        Get.offNamed(AppRoute.successResetPassword);
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'invalid-email') {
        showAwesomeDialog(
          Get.context!,
          title: 'Error',
          desc: 'Invalid email provided.',
          onOk: () {
            Get.back();
          },
          dialogType: DialogType.error,
        );
      } else {
        showAwesomeDialog(
          Get.context!,
          title: 'Error',
          desc: 'Something went wrong: ${e.code}',
          onOk: () {
            Get.back();
          },
          dialogType: DialogType.error,
        );
      }
    } catch (e) {
      showAwesomeDialog(
        Get.context!,
        title: 'Error',
        desc: 'An unexpected error occurred: $e',
        onOk: () {
          Get.back();
        },
        dialogType: DialogType.error,
      );
    }
  }

  @override
  Future signInWithGoogle() async {
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
    final GoogleSignInAuthentication googleAuth =
        await googleUser!.authentication;
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );

    final userCredential =
        await FirebaseAuth.instance.signInWithCredential(credential);
    myServices.sharedPreferences.setString('userid', userCredential.user!.uid);
    Get.offNamed(AppRoute.home);
  }
}
