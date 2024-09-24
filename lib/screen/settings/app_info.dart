import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vaulta/core/constant/color.dart';

import '../../controller/settings/app_info_controller.dart';

class AppInfoScreen extends StatelessWidget {
  const AppInfoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    AppInfoControllerImpl controller = Get.put(AppInfoControllerImpl());
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: (){Navigator.pop(context);},
            icon: Icon(Icons.arrow_back_ios_new_rounded)
        ),
        title: Text('App Information', style: TextStyle(fontWeight: FontWeight.bold),),
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
                          'Date of manufacture',
                          style: TextStyle(fontSize: 18, color: Colors.black),
                        ),
                      ),
                      Text(
                        'Sept 2024',
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
                        'Version',
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
                        'Language',
                        style: TextStyle(fontSize: 18, color: Colors.black),
                      ),
                    ),
                    Text(
                      'English',
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
