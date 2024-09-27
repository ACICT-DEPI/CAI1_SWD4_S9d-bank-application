import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vaulta/core/constant/color.dart';

import '../../controller/settings/app_info_controller.dart';
import '../../core/services/sevices.dart';

class AppInfoScreen extends StatelessWidget {
  const AppInfoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    MyServices myServices = Get.find();
    String? sharedPrefLang = myServices.sharedPreferences.getString('lang');
    AppInfoControllerImpl controller = Get.put(AppInfoControllerImpl());
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: (){Navigator.pop(context);},
            icon: Icon(Icons.arrow_back_ios_new_rounded)
        ),
        title: Text('51'.tr, style: TextStyle(fontWeight: FontWeight.bold),),
        elevation: 0,
      ),
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 30, horizontal: 25),
        child: Column(
          children: [
            Center(
              child: Text(
                  'CaBank E-mobile Banking',
              style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 22),),
            ),
            SizedBox(height: 10,),
            Container(
              padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
              width: double.infinity,
              alignment: Alignment.centerLeft,
              decoration: BoxDecoration(
                  border: Border(
                      bottom: BorderSide(color: Colors.grey.shade300)
                  )
              ),
              child:Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Expanded(
                        child: Text(
                          '52'.tr,
                          style: TextStyle(fontSize: 18, color: Colors.black),
                        ),
                      ),
                      Text(
                        '54'.tr,
                        style: TextStyle(fontSize: 17, color: AppColor.primaryColor, fontWeight: FontWeight.bold),
                      ),
                    ],
                  )
            ),
            Container(
                padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                width: double.infinity,
                alignment: Alignment.centerLeft,
                decoration: BoxDecoration(
                    border: Border(
                        bottom: BorderSide(color: Colors.grey.shade300)
                    )
                ),
                child:Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Expanded(
                      child: Text(
                        '53'.tr,
                        style: TextStyle(fontSize: 18, color: Colors.black),
                      ),
                    ),
                    Text(
                      '1.0.1',
                      style: TextStyle(fontSize: 17, color: AppColor.primaryColor, fontWeight: FontWeight.bold),
                    ),
                  ],
                )
            ),
            Container(
                padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                width: double.infinity,
                alignment: Alignment.centerLeft,
                decoration: BoxDecoration(
                    border: Border(
                        bottom: BorderSide(color: Colors.grey.shade300)
                    )
                ),
                child:Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Expanded(
                      child: Text(
                        '50'.tr,
                        style: TextStyle(fontSize: 18, color: Colors.black),
                      ),
                    ),
                    Text(
                      sharedPrefLang == 'en'? '2'.tr : '3'.tr,
                      style: TextStyle(fontSize: 17, color: AppColor.primaryColor, fontWeight: FontWeight.bold),
                    ),
                  ],
                )
            ),
          ],
        ),
      ),
    );
  }
}
