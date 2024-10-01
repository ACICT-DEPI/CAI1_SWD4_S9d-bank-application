import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:vaulta/controller/unique12_number.dart';
import 'package:vaulta/core/services/sevices.dart';
import 'package:vaulta/data/model/user_logged_in.dart';

import '../core/functions/awesome_dialoge.dart';

abstract class AccountPageController extends GetxController {

}

class AccountPageControllerImp extends AccountPageController{
  MyServices myServices = Get.find();
  final firestore = FirebaseFirestore.instance;
  final numericRegex = RegExp(r'^[0-9]+$');


  Rx<String> username = ''.obs;
  Rx<String> profilePic = ''.obs;
  Rx<num> balance = 0.obs;
  Rx<String> accountNumber = ''.obs;
  String? userId;

  UserProfile userProfile = UserProfile();


  @override
  void onReady() {
    username.value = userProfile.username!;
    profilePic.value = userProfile.profilePictureUrl!;
    balance.value = userProfile.balance!;
    accountNumber.value = userProfile.accountNumber!;
    super.onReady();
  }


  @override
  void onInit() {

    getUid();
    retrieveUserData();

    everAll([username, profilePic, balance, accountNumber], (values){
      userProfile.balance = balance.value;
      userProfile.username = username.value;
      userProfile.profilePictureUrl = profilePic.value;
      userProfile.accountNumber = accountNumber.value;
    });

    super.onInit();
  }

  void getUid(){
    userId = myServices.sharedPreferences.getString('userid');
  }

  Future<void> retrieveUserData() async{

    try{
      if (userId != null) {
        DocumentSnapshot userData = await FirebaseFirestore.instance
            .collection('users')
            .doc(userId)
            .get();

        if (userData.exists) {
          this.username.value = userData['username'];
          this.balance.value = userData['balance'];
          this.profilePic.value = userData['profile_picture'];
          this.accountNumber.value = userData['account_number'];
          if(accountNumber.value.isEmpty){
            print("account number is empty!");
            accountNumber.value = await createUniqueAccountNumber();
            updateUserAccountNumber(accountNumber.value);
            print("account number is : ${accountNumber.value}");
          }
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

  Future<void> updateUserAccountNumber(String accountNumber) async{
    await firestore.collection('users').doc(userId).update({
      'account_number': accountNumber
    });
  }

  void validateAmount(String amount){
    if(amount.isEmpty){
      return;
    }
    if(numericRegex.hasMatch(amount)){
      updateBalance(amount);
    }
    else{
      print("not valid number");
      showAwesomeDialog(
        Get.context!,
        title: 'Error',
        desc: 'please enter a valid amount.',
        onOk: () {
          Get.back();
        },
        dialogType: DialogType.error,
      );
    }
  }

  Future<void> updateBalance(String amount) async{
    num newBalance = balance.value + int.tryParse(amount)!;
    userProfile.balance = newBalance;
    await firestore.collection('users').doc(userId).update({
      'balance': newBalance
    });
    print("not valid number");
    showAwesomeDialog(
      Get.context!,
      title: 'Success!',
      desc: 'Balance added successfully.',
      onOk: () {
        Get.back();
      },
      dialogType: DialogType.success,
    );
  }



}
