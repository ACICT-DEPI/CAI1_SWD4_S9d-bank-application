import 'package:flutter/material.dart';
import 'package:focus_detector/focus_detector.dart';
import 'package:get/get.dart';
import 'package:vaulta/controller/settings/profile_infromation_controller.dart';
import 'package:vaulta/core/constant/color.dart';
import 'package:vaulta/data/model/user_logged_in.dart';

class ProfileInfromationScrenn extends StatelessWidget {
  const ProfileInfromationScrenn({super.key});

  @override
  Widget build(BuildContext context) {
    ProfileInfromationControllerImpl controller =
    Get.put(ProfileInfromationControllerImpl());

    onResume(){
      controller.onReady();
    }
    onPause(){}
    return FocusDetector(
      onFocusGained: onResume,
      onFocusLost: onPause,
      child: Scaffold(
          appBar: AppBar(
            backgroundColor: AppColor.primaryColor,
            leading: IconButton(
                onPressed: (){Navigator.pop(context);},
                icon: Icon(Icons.arrow_back_ios_new_rounded, color: Colors.white,)
            ),
            title: Text('56'.tr, style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),),
            elevation: 0,
          ),
          body: Obx((){
            if(controller.username.value.isEmpty){
              return Center(
                child: CircularProgressIndicator(),
              );
            }
            else{
              return Container(
                padding: EdgeInsets.symmetric(horizontal: 24, vertical: 30),
                child: Column(
                  children: [
                    Center(
                      child: Column(
                        children: [
                          Obx((){
                            return CircleAvatar(
                              radius: 60,
                              backgroundColor: Colors.grey,
                              backgroundImage: controller.profilePicture.value.isNotEmpty? NetworkImage(controller.profilePicture.value) : null,
                              child: controller.profilePicture.value.isEmpty? Text(controller.username.value.isNotEmpty? controller.username.value.substring(0,1) : "A", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 32, color: Colors.white),) : null,
                            );
                          }),
                          SizedBox(height: 30,),
                        ],
                      ),
                    ),
                    Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                          border: Border(
                              bottom: BorderSide(color: Colors.grey.shade300)
                          )
                      ),
                      child: Center(
                        child: Obx((){
                          return Text(
                            controller.username.value.isNotEmpty? controller.username.value : "",
                            style: TextStyle(fontSize: 20, color: AppColor.primaryColor, fontWeight: FontWeight.bold),
                          );
                        }),
                      ),
                    ),
                    SizedBox(height: 20,),
                    Container(
                      padding: EdgeInsets.symmetric(vertical: 10),
                      child: Row(
                        children: [
                          Expanded(
                              child: Text(
                                "27".tr,
                                style: TextStyle(fontSize: 18, color: Colors.black.withOpacity(0.7)),
                              )
                          ),
                          Obx((){
                            return Text(
                              controller.phone.value.isNotEmpty? controller.phone.value : "",
                              style: TextStyle(fontSize: 18, color: Colors.black.withOpacity(0.7), fontWeight: FontWeight.bold),
                              maxLines: 3, overflow: TextOverflow.ellipsis,
                            );
                          })
                        ],
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(vertical: 10),
                      child: Row(
                        children: [
                          Expanded(
                              flex: 2,
                              child: Text(
                                "23".tr,
                                style: TextStyle(fontSize: 18, color: Colors.black.withOpacity(0.7)),
                              )
                          ),
                          Expanded(
                            flex: 6,
                            child: Obx((){
                              return Text(
                                controller.email.value.isNotEmpty? controller.email.value : "",
                                style: TextStyle(fontSize: 18, color: Colors.black.withOpacity(0.7), fontWeight: FontWeight.bold),
                                overflow: TextOverflow.ellipsis,
                                maxLines: 2,
                              );
                            }),
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 30, left: 170),
                      child: Container(
                        width: double.infinity,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: AppColor.primaryColor
                        ),
                        child: TextButton(onPressed: (){
                          controller.goToEditProfile();
                        },
                            child: Text(
                              "58".tr,
                              style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),)),
                      ),
                    )

                  ],
                ),
              );
            }
          })
      ),
    );
  }


}
