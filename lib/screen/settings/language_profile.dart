import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vaulta/controller/settings/language_page_controller.dart';

class LanguageProfileScreen extends StatelessWidget {
  const LanguageProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    LanguagePageControllerImpl controller =
        Get.put(LanguagePageControllerImpl());
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: (){Navigator.pop(context);},
            icon: Icon(Icons.arrow_back_ios_new_rounded)
        ),
        title: Text('Language', style: TextStyle(fontWeight: FontWeight.bold),),
        elevation: 0,
      ),
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 10, horizontal: 24),
          child: Column(
            children: [
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
                      //edit app's language
                    },
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Expanded(
                          child: Row(
                            children: [
                              Image.asset('assets/images/eg.png'),
                              SizedBox(width: 25,),
                              Text(
                                'Arabic',
                                style: TextStyle(fontSize: 18, color: Colors.black),
                              ),
                            ],
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
                      //edit app's language
                    },
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Expanded(
                          child: Row(
                            children: [
                              Image.asset('assets/images/us.png'),
                              SizedBox(width: 25,),
                              Text(
                                'English',
                                style: TextStyle(fontSize: 18, color: Colors.black),
                              ),
                            ],
                          ),
                        ),
                        Icon(Icons.arrow_forward_ios_rounded, size: 16, color: Colors.grey.shade300)
                      ],
                    )),
              ),
            ],
          )
      ),
    );
  }
}
