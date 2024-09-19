import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:vaulta/core/functions/awesome_dialoge.dart';
import 'package:vaulta/core/functions/show_loading.dart';

import '../../core/constant/routes.dart';

abstract class SignupController extends GetxController {
  void signUp();
  goToSignIn();
}

class SignupControllerImpl extends SignupController {
  late TextEditingController emailController;
  late TextEditingController passwordController;
  late TextEditingController usernameController;
  late TextEditingController PhoneController;
  late GlobalKey<FormState> formKey;

  @override
  void signUp() async {
    var formData = formKey.currentState;
    if (formData!.validate()) {
      print('signUp');

      showLoading(Get.context!);

      try {
        // final usernameCheck = await FirebaseFirestore.instance
        //     .collection('users')
        //     .where('username', isEqualTo: usernameController.text)
        //     .get();
        //
        // if (usernameCheck.docs.isNotEmpty) {
        //   hideLoading(Get.context!);
        //   showAwesomeDialog(Get.context!,
        //       title: 'Error',
        //       desc: 'The username is already in use.', onOk: () {
        //     Get.back();
        //   }, dialogType: DialogType.error);
        //   return;
        // }

        final credential = await FirebaseAuth.instance
            .createUserWithEmailAndPassword(
                email: emailController.text, password: passwordController.text);
        await FirebaseFirestore.instance
            .collection('users')
            .doc(credential.user!.uid)
            .set({
          'username': usernameController.text,
          'email': emailController.text,
          'phone': PhoneController.text,
          'uid': credential.user!.uid,
          'balance': 0,
        });
        await credential.user!.sendEmailVerification();
        hideLoading(Get.context!);
        Get.offNamed(AppRoute.successSignUp);
        update();
      } on FirebaseAuthException catch (e) {
        hideLoading(Get.context!); // Hide loading on error
        print(e.code);
        if (e.code == 'weak-password') {
          print('The password provided is too weak.');
          showAwesomeDialog(Get.context!,
              title: 'Error',
              desc: 'The password provided is too weak.', onOk: () {
            Get.back();
          }, dialogType: DialogType.error);
        } else if (e.code == 'email-already-in-use') {
          showAwesomeDialog(Get.context!,
              title: 'Error',
              desc: 'The account already exists for that email.', onOk: () {
            Get.back();
          }, dialogType: DialogType.error);
          print('The account already exists for that email.');
        }
      } catch (e) {
        hideLoading(Get.context!);
        print(e);
      }
    } else {
      print('not signUp');
    }
  }

  @override
  goToSignIn() {
    Get.offNamed(AppRoute.login);
  }

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    emailController = TextEditingController();
    passwordController = TextEditingController();
    usernameController = TextEditingController();
    PhoneController = TextEditingController();
    formKey = GlobalKey<FormState>();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    emailController.dispose();
    passwordController.dispose();
    usernameController.dispose();
    PhoneController.dispose();
  }
}
