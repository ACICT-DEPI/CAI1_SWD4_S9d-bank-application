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

  String? uid;
  Rx<UserProfile> userProfile = UserProfile().obs;
  File? _image;

  void getUid(){
    User? user = FirebaseAuth.instance.currentUser;
    if(user != null){
      uid = user.uid;
    }
  }
  @override
  void onInit(){
    getUid();
    print("username: ${userProfile.value.username}");
    super.onInit();
  }

  Future<void> pickImage() async {
    final ImagePicker _picker = ImagePicker();
    final XFile? pickedImage = await _picker.pickImage(source: ImageSource.gallery);

    if (pickedImage != null) {
      _image = File(pickedImage.path);  // Store the picked image as a File object
    }
  }
  Future<String> uploadImageToFirebase(File imageFile) async {
    try {
      // Create a reference to Firebase Storage
      Reference storageReference = FirebaseStorage.instance
          .ref()
          .child('profile_pictures/${DateTime.now().millisecondsSinceEpoch}');

      // Upload the file
      UploadTask uploadTask = storageReference.putFile(imageFile);
      TaskSnapshot taskSnapshot = await uploadTask;

      // Get the download URL
      String downloadUrl = await taskSnapshot.ref.getDownloadURL();

      return downloadUrl;  // Return the URL to be saved in Firestore
    } catch (e) {
      print("Error uploading image: $e");
      return '';
    }
  }
  Future<void> saveImageUrlToFirestore(String imageUrl, String userId) async {
    try {
      await FirebaseFirestore.instance.collection('users').doc(userId).update({
        'profile_picture': imageUrl,
      });
    } catch (e) {
      print("Error saving image URL to Firestore: $e");
    }
  }

  @override
  gotToProfileInformation() {
    Get.back();
  }

  Future<void> handleImageUploadAndSave() async {
    await pickImage();  // Step 1: Choose the image

    if (_image != null) {
      String imageUrl = await uploadImageToFirebase(_image!);  // Step 2: Upload to Firebase
      if (imageUrl.isNotEmpty) {
        await saveImageUrlToFirestore(imageUrl, uid!);  // Step 3: Save URL in Firestore
        print("Image uploaded and URL saved to Firestore!");
      }
    } else {
      print("No image selected");
    }
  }


  // Function to upload profile picture
  // Future<String> uploadProfilePicture(File imageFile, String uid) async {
  //   try {
  //     // Reference to Firebase Storage with the user's UID
  //     Reference storageReference =
  //     FirebaseStorage.instance.ref().child('profile_pictures/$uid');
  //
  //     // Upload the file
  //     UploadTask uploadTask = storageReference.putFile(imageFile);
  //
  //     // Wait for the upload to complete
  //     TaskSnapshot taskSnapshot = await uploadTask;
  //
  //     // Get the download URL
  //     String downloadUrl = await taskSnapshot.ref.getDownloadURL();
  //     _imageUrl.value = downloadUrl;
  //
  //     return downloadUrl;
  //   } catch (e) {
  //     print('Error uploading profile picture: $e');
  //     return '';
  //   }
  // }

  void updateUserData(String newEmail, String newUsername, String newPhone, ) async {
    User? user = FirebaseAuth.instance.currentUser;

    if (user != null) {
      try {
        await user.updateEmail(newEmail);
        await user.reload();
        user = FirebaseAuth.instance.currentUser;

        await FirebaseFirestore.instance
            .collection('users')
            .doc(user!.uid)
            .update({
          'username': newUsername,
          'phone': newPhone,
          'email':newEmail,
          // 'profile_picture': _imageUrl,
        });
      } catch (e) {
        print('Failed to update user information: $e');
      }
    } else {
      print('No user is signed in.');
    }
  }



}
