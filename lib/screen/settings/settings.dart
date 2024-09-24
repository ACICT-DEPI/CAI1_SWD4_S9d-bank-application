import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vaulta/controller/settings/settings_controller.dart';
import 'package:vaulta/core/constant/color.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    SettingsControllerImpl controller = Get.put(SettingsControllerImpl());
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColor.primaryColor,
        leading: IconButton(
            onPressed: (){},
            icon: Icon(
              Icons.arrow_back_ios_new,
              size: 20,
              color: Colors.white,
            )
        ),
        title: Text(
          'Settings',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.white
          ),
        ),
        elevation: 0,
      ),
      body: Container(
        padding: EdgeInsets.only(top: 20),
        color: AppColor.primaryColor,
        child: Stack(
          alignment: Alignment.topCenter,
          children: [
            Container(
              padding: EdgeInsets.only(top: 50),
              child: Container(
                padding: EdgeInsets.fromLTRB(24, 110, 24, 0),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(25),
                        topRight: Radius.circular(25)
                    ),
                    color: Colors.white
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Center(),
                    Container(
                      padding: EdgeInsets.symmetric(vertical: 5),
                      width: double.infinity,
                      alignment: Alignment.centerLeft,
                      decoration: BoxDecoration(
                        border: Border(
                          bottom: BorderSide(color: Colors.grey.shade300)
                        )
                      ),
                      child: TextButton(
                          onPressed: () {
                            controller.gotToProfileInformation();
                          },
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Expanded(
                                child: Text(
                                    'Profile Information',
                                  style: TextStyle(fontSize: 18, color: Colors.black),
                                ),
                              ),
                              Icon(Icons.arrow_forward_ios_rounded, size: 16, color: Colors.grey.shade300)
                            ],
                          )),
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(vertical: 5),
                      width: double.infinity,
                      alignment: Alignment.centerLeft,
                      decoration: BoxDecoration(
                          border: Border(
                              bottom: BorderSide(color: Colors.grey.shade300)
                          )
                      ),
                      child: TextButton(
                          onPressed: () {
                            controller.goToLanguage();
                          },
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Expanded(
                                child: Text(
                                  'Language',
                                  style: TextStyle(fontSize: 18, color: Colors.black),
                                ),
                              ),
                              Icon(Icons.arrow_forward_ios_rounded, size: 16, color: Colors.grey.shade300)
                            ],
                          )),
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(vertical: 5),
                      width: double.infinity,
                      alignment: Alignment.centerLeft,
                      decoration: BoxDecoration(
                          border: Border(
                              bottom: BorderSide(color: Colors.grey.shade300)
                          )
                      ),
                      child: TextButton(
                          onPressed: () {
                            controller.goToAppInfo();
                          },
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Expanded(
                                child: Text(
                                  'App Information',
                                  style: TextStyle(fontSize: 18, color: Colors.black),
                                ),
                              ),
                              Icon(Icons.arrow_forward_ios_rounded, size: 16, color: Colors.grey.shade300)
                            ],
                          )),
                    ),
                    Container(
                        padding: EdgeInsets.symmetric(vertical: 10, horizontal: 7),
                        width: double.infinity,
                        alignment: Alignment.centerLeft,
                        decoration: BoxDecoration(
                          border: Border(
                              bottom: BorderSide(color: Colors.grey.shade300)
                          )
                      ),
                      child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Expanded(
                                child: Text(
                                  'Customer Care',
                                  style: TextStyle(fontSize: 18, color: Colors.black),
                                ),
                              ),
                              Text(
                                '123456',
                                style: TextStyle(fontSize: 18, color: Colors.grey.shade500),
                              ),
                            ],
                          )
                    )
                  ],
                ),
              ),
            ),
            Column(
              children: [
                CircleAvatar(
                  backgroundColor: Colors.grey,
                  child: Text(
                    style: TextStyle(fontSize: 40, color: Colors.white),
                    "A",
                  ),
                  radius: 50,
                ),
                Text(
                  "Name",
                  style: TextStyle(
                      fontSize: 20,
                      color: AppColor.primaryColor,
                      fontWeight: FontWeight.w600
                  ),
                )
              ],
            ),

          ],
        ),
      ),
    );
  }
}
