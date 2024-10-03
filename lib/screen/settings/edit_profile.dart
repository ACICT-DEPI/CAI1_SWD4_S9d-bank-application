import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:vaulta/controller/settings/edit_profile_controller.dart';
import 'package:vaulta/core/constant/color.dart';

class EditProfileScreen extends StatefulWidget {
  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {

  bool isUsernameValid = true;
  bool isEmailValid = true;
  bool isPhoneValid = true;


  late TextEditingController nameController;
  String usernameTxt = "";

  late TextEditingController phoneController;
  String phoneTxt = "";

  late TextEditingController emailController;
  String emailTxt = "";

  Uint8List? _imagePicked;

  void selectImage(EditProfileControllerImpl controller) async {
    Uint8List image = await controller.pickImage(ImageSource.gallery);
    setState(() {
      _imagePicked = image;
    });
  }

  void initState() {
    super.initState();
    nameController = TextEditingController();
    phoneController = TextEditingController();
    emailController = TextEditingController();
    EditProfileControllerImpl controller = Get.put(EditProfileControllerImpl());
    usernameTxt = controller.userProfile.value.username!;
    phoneTxt = controller.userProfile.value.phoneNumber!;
    emailTxt = controller.userProfile.value.email!;
  }

  @override
  void dispose() {
    nameController.dispose();
    phoneController.dispose();
    emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    EditProfileControllerImpl controller = Get.put(EditProfileControllerImpl());

    setState(() {
      nameController.text = usernameTxt;
      emailController.text = emailTxt;
      phoneController.text = phoneTxt;
    });

    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColor.primaryColor,
        leading: IconButton(
            onPressed: () {
              controller.gotToProfileInformation();
            },
            icon: Icon(
              Icons.arrow_back_ios_new_rounded,
              color: Colors.white,
            )),
        title: Text(
          '58'.tr,
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        elevation: 0,
      ),
      body: Obx(() {
        return SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                TextButton(
                  onPressed: () {
                    selectImage(controller);
                  },
                  child: Stack(
                    alignment: Alignment.bottomRight,
                    children: [
                      _imagePicked != null
                          ? CircleAvatar(
                              radius: 60,
                              backgroundImage: MemoryImage(_imagePicked!),
                            )
                          : controller.userProfile.value.profilePictureUrl ==
                                      null ||
                                  controller.userProfile.value
                                          .profilePictureUrl ==
                                      ""
                              ? CircleAvatar(
                                  radius: 60,
                                  child: Text(
                                    controller.userProfile.value.username![0]
                                        .toUpperCase(),
                                    style: TextStyle(
                                        fontSize: 50,
                                        color: AppColor.primaryColor),
                                  ),
                                )
                              : CircleAvatar(
                                  radius: 60,
                                  backgroundImage: NetworkImage(controller
                                      .userProfile.value.profilePictureUrl!),
                                ),
                      CircleAvatar(
                        radius: 15,
                        backgroundColor: AppColor.primaryColor,
                        child: Icon(
                          Icons.add,
                          color: Colors.white,
                        ),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  padding: EdgeInsets.only(top: 30),
                  decoration: BoxDecoration(
                      border:
                          Border(top: BorderSide(color: Colors.grey.shade400))),
                  child: Center(),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(8.0, 10, 8, 15),
                  child: Row(
                    children: [
                      Expanded(
                          flex: 2,
                          child: Text(
                            "21".tr,
                            style: TextStyle(
                              fontSize: 18,
                              color: Colors.black.withOpacity(0.7),
                            ),
                          )),
                      Expanded(
                          flex: 3,
                          child: TextFormField(
                            onChanged: (value) {
                              usernameTxt = value;
                            },
                            controller: nameController,
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.normal,
                                overflow: TextOverflow.ellipsis),
                            decoration: InputDecoration(
                              errorText: isUsernameValid? null : "this username is not valid!",
                              enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(30.0),
                                  borderSide: BorderSide(
                                      color: AppColor.primaryColor
                                          .withOpacity(0))),
                              focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(30.0),
                                  borderSide: BorderSide(
                                      color: AppColor.primaryColor
                                          .withOpacity(0))),
                              filled: true,
                              fillColor: AppColor.primaryColor.withOpacity(0.2),
                            ),

                          ))
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(8.0, 10, 8, 15),
                  child: Row(
                    children: [
                      Expanded(
                          flex: 2,
                          child: Text(
                            "27".tr,
                            style: TextStyle(
                              fontSize: 18,
                              color: Colors.black.withOpacity(0.7),
                            ),
                          )),
                      Expanded(
                          flex: 3,
                          child: TextFormField(
                            onChanged: (value) {
                              phoneTxt = value;
                            },
                            controller: phoneController,
                            keyboardType: TextInputType.phone,
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.normal,
                                overflow: TextOverflow.ellipsis),
                            decoration: InputDecoration(
                              errorText: isPhoneValid? null : "this phone is not valid!",
                              enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(30.0),
                                  borderSide: BorderSide(
                                      color: AppColor.primaryColor
                                          .withOpacity(0))),
                              focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(30.0),
                                  borderSide: BorderSide(
                                      color: AppColor.primaryColor
                                          .withOpacity(0))),
                              filled: true,
                              fillColor: AppColor.primaryColor.withOpacity(0.2),
                            ),
                          ))
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(8.0, 10, 8, 40),
                  child: Row(
                    children: [
                      Expanded(
                          flex: 2,
                          child: Text(
                            "23".tr,
                            style: TextStyle(
                              fontSize: 18,
                              color: Colors.black.withOpacity(0.7),
                            ),
                          )),
                      Expanded(
                          flex: 3,
                          child: TextFormField(
                            onChanged: (value) {
                              emailTxt = value;
                            },
                            keyboardType: TextInputType.emailAddress,
                            controller: emailController,
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.normal,
                                overflow: TextOverflow.ellipsis),
                            decoration: InputDecoration(
                              errorText: isEmailValid? null : "this email is not valid!",
                              enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(30.0),
                                  borderSide: BorderSide(
                                      color: AppColor.primaryColor
                                          .withOpacity(0))),
                              focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(30.0),
                                  borderSide: BorderSide(
                                      color: AppColor.primaryColor
                                          .withOpacity(0))),
                              filled: true,
                              fillColor: AppColor.primaryColor.withOpacity(0.2),
                            ),
                          ))
                    ],
                  ),
                ),
                Container(
                  alignment: Alignment.centerRight,
                  child: Container(
                    width: screenWidth / 2,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: AppColor.primaryColor),
                    child: TextButton(
                        onPressed: () async{

                          bool isUsernameValidTmp = await controller
                              .checkUsernameValidity(nameController.text);
                          bool isPhoneValidTmp = await controller
                              .checkPhoneValidity(phoneController.text);
                          bool isEmailValidTmp = await controller
                              .checkEmailValidity(emailController.text);

                          //save logic
                          setState((){
                            if(emailController.text == controller.userProfile.value.email){
                              isEmailValidTmp = true;
                            }
                            if(phoneController.text == controller.userProfile.value.phoneNumber){
                              isPhoneValidTmp = true;
                            }
                            if(nameController.text == controller.userProfile.value.username){
                              isUsernameValidTmp = true;
                            }
                            isUsernameValid = isUsernameValidTmp;
                            isPhoneValid =isPhoneValidTmp;
                            isEmailValid = isEmailValidTmp;
                            print("is usernameValid: ${isUsernameValid}");
                          });

                          if(isUsernameValid && isPhoneValid && isEmailValid){
                            controller.saveData(
                                image: _imagePicked,
                                newEmail: emailController.text,
                                newUsername: nameController.text,
                                newPhone: phoneController.text);
                          }

                        },
                        child: Text(
                          "59".tr,
                          style: TextStyle(
                              color: Colors.white, fontWeight: FontWeight.bold),
                        )),
                  ),
                )
              ],
            ),
          ),
        );
      }),
    );
  }
}
