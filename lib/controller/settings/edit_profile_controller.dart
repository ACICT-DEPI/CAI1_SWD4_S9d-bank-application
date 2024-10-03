import 'dart:typed_data';

import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:vaulta/data/model/user_logged_in.dart';

import '../../core/functions/awesome_dialoge.dart';

abstract class EditProfileController extends GetxController {
  gotToProfileInformation();
}

class EditProfileControllerImpl extends EditProfileController {
  final firebaseStorage = FirebaseStorage.instance;
  final firestore = FirebaseFirestore.instance;

  bool isUsernameValid = true;
  bool isEmailValid = true;
  bool isPhoneValid = true;

  Set<String> usernames = {};
  Set<String> emails = {};
  Set<String> phones = {};
  String? uid;
  Rx<UserProfile> userProfile = UserProfile().obs;

  void getUid() {
    User? user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      uid = user.uid;
    }
  }

  @override
  void onInit() {
    getUid();
    super.onInit();
  }

  pickImage(ImageSource source) async {
    final ImagePicker _picker = ImagePicker();
    final XFile? pickedImage =
        await _picker.pickImage(source: ImageSource.gallery);

    if (pickedImage != null) {
      return await pickedImage.readAsBytes();
    }
  }

  Future<String> uploadImageToFirebase(Uint8List image) async {
    try {
      Reference storageRef = firebaseStorage.ref().child('images/${uid!}.jpg');
      UploadTask uploadTask = storageRef.putData(image);
      TaskSnapshot snapshot = await uploadTask;
      if (snapshot.state == TaskState.success) {
        String downloadUrl = await snapshot.ref.getDownloadURL();
        return downloadUrl;
      } else {
        print("Upload failed: ${snapshot.state}");
        return '';
      }
      // String downloadUrl = await snapshot.ref.getDownloadURL();
      // return downloadUrl;
    } catch (e) {
      print("Error uploading image: $e");
      return '';
    }
  }

  Future<bool> checkUsernameValidity(String newUsername) async{
    print("retrieving usernames");
    try{
      if(usernames.isEmpty){
        QuerySnapshot querySnapshot = await firestore.collection('users').get();

        for(var doc in querySnapshot.docs){
          Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
          if(data.containsKey('username')){
            usernames.add(data['username']);
          }
        }
      }
      for(String name in usernames){
        if(name == newUsername){
          isUsernameValid = false;
          break;
        }
      }
      return isUsernameValid;
      
    }catch (e){
      print("error fetching usernames");
      return false;
    }

  }

  Future<bool> checkEmailValidity(String newEmail) async{
    print("retrieving emails");
    try{
      if(emails.isEmpty){
        QuerySnapshot querySnapshot = await firestore.collection('users').get();

        for(var doc in querySnapshot.docs){
          Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
          if(data.containsKey('email')){
            emails.add(data['email']);
          }
        }
      }
      for(String email in emails){
        if(email == newEmail){
          isEmailValid = false;
          break;
        }
      }
      return isEmailValid;
    }catch (e){
      print("error fetching emails");
      return false;
    }

  }

  Future<bool> checkPhoneValidity(String newPhone) async{
    print("retrieving phones");
    try{
      if(phones.isEmpty){
        QuerySnapshot querySnapshot = await firestore.collection('users').get();

        for(var doc in querySnapshot.docs){
          Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
          if(data.containsKey('phone')){
            phones.add(data['phone']);
          }
        }
      }
      for(String phone in phones){
        if(phone == newPhone){
          isPhoneValid = false;
          break;
        }
      }
      return isPhoneValid;
    }catch (e){
      print("error fetching phones");
      return false;
    }

  }

  Future<String> saveData(
      {required Uint8List? image,
      required newEmail,
      required newUsername,
      required newPhone}) async {
    String response = "failed to update";

    if(newEmail == userProfile.value.email &&
    newUsername == userProfile.value.username &&
    newPhone == userProfile.value.phoneNumber){
      gotToProfileInformation();
      return response;
    }


    try {
      String imageUrl = "";
      image != null
          ? imageUrl = await uploadImageToFirebase(image)
          : imageUrl = userProfile.value.profilePictureUrl!;
      await firestore.collection('users').doc(uid).update({
        'profile_picture': imageUrl,
        'username': newUsername,
        'phone': newPhone,
        'email': newEmail
      });

      usernames.remove(userProfile.value.username);
      emails.remove(userProfile.value.email);
      phones.remove(userProfile.value.phoneNumber);

      userProfile.value.updateProfile(
          username: newUsername,
          email: newEmail,
          phoneNumber: newPhone,
          profilePictureUrl: imageUrl);

      usernames.add(userProfile.value.username!);
      emails.add(userProfile.value.email!);
      phones.add(userProfile.value.phoneNumber!);

      gotToProfileInformation();
      response = "successful";
    } catch (e) {
      response = e.toString();
    }
    isUsernameValid = true;
    isEmailValid = true;
    isPhoneValid = true;
    return response;
  }

  @override
  gotToProfileInformation() {
    Get.back();
  }
}
