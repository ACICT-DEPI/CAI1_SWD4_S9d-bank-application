import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vaulta/controller/settings/profile_infromation_controller.dart';
import 'package:vaulta/core/constant/color.dart';

class ProfileInfromationScrenn extends StatelessWidget {
  const ProfileInfromationScrenn({super.key});

  @override
  Widget build(BuildContext context) {
    ProfileInfromationControllerImpl controller =
        Get.put(ProfileInfromationControllerImpl());
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColor.primaryColor,
        leading: IconButton(
            onPressed: (){Navigator.pop(context);},
            icon: Icon(Icons.arrow_back_ios_new_rounded, color: Colors.white,)
        ),
        title: Text('Profile Information', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),),
        elevation: 0,
      ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 24, vertical: 30),
        child: Column(
          children: [
            Center(
              child: Column(
                children: [
                  CircleAvatar(
                    radius: 60,
                    backgroundColor: Colors.grey,
                    child: Text("A", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 32, color: Colors.white),),
                  ),
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
                child: Text(
                  "Name",
                  style: TextStyle(fontSize: 20, color: AppColor.primaryColor, fontWeight: FontWeight.bold),
                ),
              ),
            ),
            SizedBox(height: 20,),
            Container(
              padding: EdgeInsets.symmetric(vertical: 10),
              child: Row(
                children: [
                  Expanded(
                      child: Text(
                    "Phone",
                    style: TextStyle(fontSize: 18, color: Colors.black.withOpacity(0.7)),
                    )
                  ),
                  Text(
                    "01234560089",
                    style: TextStyle(fontSize: 18, color: Colors.black.withOpacity(0.7), fontWeight: FontWeight.bold)
                  )
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(vertical: 10),
              child: Row(
                children: [
                  Expanded(
                      child: Text(
                        "Email",
                        style: TextStyle(fontSize: 18, color: Colors.black.withOpacity(0.7)),
                      )
                  ),
                  Text(
                      "email@gmail.com",
                      style: TextStyle(fontSize: 18, color: Colors.black.withOpacity(0.7), fontWeight: FontWeight.bold),
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2,
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
                      "Edit Profile",
                    style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),)),
              ),
            )

          ],
        ),
      ),
    );
  }
}
