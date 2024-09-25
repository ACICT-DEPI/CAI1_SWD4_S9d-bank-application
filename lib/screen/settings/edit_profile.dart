import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vaulta/controller/settings/edit_profile_controller.dart';
import 'package:vaulta/core/constant/color.dart';

class EditProfileScreen extends StatelessWidget {

  final nameController = TextEditingController();
  final phoneController = TextEditingController();
  final emailController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    EditProfileControllerImpl controller = Get.put(EditProfileControllerImpl());
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColor.primaryColor,
        leading: IconButton(
            onPressed: (){Navigator.pop(context);},
            icon: Icon(Icons.arrow_back_ios_new_rounded, color: Colors.white,)
        ),
        title: Text(
          'Edit Profile',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold,),
        ),
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              TextButton(
                onPressed: (){//pick image
                   },
                child: Stack(
                  alignment: Alignment.bottomRight,
                  children: [
                    CircleAvatar(
                      radius: 60,
                    ),
                    CircleAvatar(
                      radius: 15,
                      backgroundColor: AppColor.primaryColor,
                      child: Icon(Icons.add, color: Colors.white,),
                    )
                  ],
                ),
              ),
              SizedBox(height: 20,),
              Container(
                padding: EdgeInsets.only(top: 30),
                decoration: BoxDecoration(
                  border: Border(
                    top: BorderSide(color: Colors.grey.shade400)
                  )
                ),
                child: Center(),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(8.0, 10, 8, 15),
                child: Row(
                  children: [
                    Expanded(
                      flex: 2,
                      child: Text(
                      "Name",
                      style: TextStyle(fontSize: 18, color: Colors.black.withOpacity(0.7),),
                      )
                    ),
                    Expanded(
                      flex: 3,
                      child: TextFormField(
                        controller: nameController,
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.normal,
                            overflow: TextOverflow.ellipsis
                        ),
                        decoration: InputDecoration(
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30.0),
                            borderSide: BorderSide(color: AppColor.primaryColor.withOpacity(0))
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30.0),
                            borderSide: BorderSide(color: AppColor.primaryColor.withOpacity(0))
                          ),
                          filled: true,
                          fillColor: AppColor.primaryColor.withOpacity(0.2),
                        ),
        
                      )
                    )
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
                          "Phone",
                          style: TextStyle(fontSize: 18, color: Colors.black.withOpacity(0.7),),
                        )
                    ),
                    Expanded(
                        flex: 3,
                        child: TextFormField(
                          controller: phoneController,
                          keyboardType: TextInputType.phone,
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.normal,
                              overflow: TextOverflow.ellipsis
                          ),
                          decoration: InputDecoration(
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30.0),
                              borderSide: BorderSide(color: AppColor.primaryColor.withOpacity(0))
                            ),
                            focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(30.0),
                                borderSide: BorderSide(color: AppColor.primaryColor.withOpacity(0))
                            ),
                            filled: true,
                            fillColor: AppColor.primaryColor.withOpacity(0.2),
                          ),
        
                        )
                    )
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
                          "Email",
                          style: TextStyle(fontSize: 18, color: Colors.black.withOpacity(0.7),),
                        )
                    ),
                    Expanded(
                        flex: 3,
                        child: TextFormField(
                          keyboardType: TextInputType.emailAddress,
                          controller: emailController,
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.normal,
                              overflow: TextOverflow.ellipsis
                          ),
                          decoration: InputDecoration(
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30.0),
                                borderSide: BorderSide(color: AppColor.primaryColor.withOpacity(0))
                            ),
                            focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(30.0),
                                borderSide: BorderSide(color: AppColor.primaryColor.withOpacity(0))
                            ),
                            filled: true,
                            fillColor: AppColor.primaryColor.withOpacity(0.2),
                          ),
        
                        )
                    )
                  ],
                ),
              ),
        
              Container(
                alignment: Alignment.centerRight,
                child: Container(
                  width: screenWidth/2,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: AppColor.primaryColor
                  ),
                  child: TextButton(
                      onPressed: (){
                        //save logic
                        controller.gotToProfileInformation();
                      },
                      child: Text("Save update", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),)
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
