
import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart';
import 'package:vaulta/data/model/user_logged_in.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'dart:io'; // For handling file uploads

abstract class EditProfileController extends GetxController {
  gotToProfileInformation();
}

class EditProfileControllerImpl extends EditProfileController {

  final firebaseStorage = FirebaseStorage.instance;
  final firestore = FirebaseFirestore.instance;
  String? uid;
  Rx<UserProfile> userProfile = UserProfile().obs;

  void getUid(){
    User? user = FirebaseAuth.instance.currentUser;
    if(user != null){
      uid = user.uid;
    }
  }
  @override
  void onInit(){
    getUid();
    super.onInit();
  }

  pickImage(ImageSource source) async {
    final ImagePicker _picker = ImagePicker();
    final XFile? pickedImage = await _picker.pickImage(source: ImageSource.gallery);

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

  Future<String> saveData({
    required Uint8List? image,
    required newEmail,
    required newUsername,
    required newPhone}) async{
    String response = "failed to update";
    try{
      String imageUrl = "";
      image != null ? imageUrl = await uploadImageToFirebase(image) : imageUrl = userProfile.value.profilePictureUrl!;
      await firestore.collection('users').doc(uid).update({
        'profile_picture': imageUrl,
        'username': newUsername,
        'phone': newPhone,
        'email': newEmail
      });
      userProfile.value.updateProfile(username: newUsername,
          email: newEmail, phoneNumber: newPhone, profilePictureUrl: imageUrl);
      gotToProfileInformation();
      response = "successful";

    }catch(e){
      response = e.toString();
    }
    return response;

  }


  @override
  gotToProfileInformation() {
    Get.back();
  }




}
