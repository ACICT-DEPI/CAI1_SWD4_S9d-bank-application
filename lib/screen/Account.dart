import 'package:buttons_tabbar/buttons_tabbar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vaulta/core/constant/routes.dart';

import '../widget/account/account_page.dart';
import '../widget/account/card_page.dart';

class AccountAndCard extends StatefulWidget {
  @override
  State<AccountAndCard> createState() => _AccountAndCardState();
}

class _AccountAndCardState extends State<AccountAndCard> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: 1,
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
              onPressed: () {
                Get.offAllNamed(AppRoute.homePage);
              },
              icon: Icon(Icons.arrow_back_ios_new_rounded)),
          title: Container(
            child: Text("Account and card "),
          ),
          bottom: ButtonsTabBar(
              radius: 15,
              width: 170,
              contentCenter: true,
              contentPadding: EdgeInsets.symmetric(horizontal: 25),
              buttonMargin: EdgeInsets.only(left: 8, right: 8),
              labelSpacing: 50,
              backgroundColor: Color(0xFF3629B7),
              unselectedBackgroundColor: Colors.grey[200],
              unselectedLabelStyle: TextStyle(color: Colors.black),
              labelStyle:
                  TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
              tabs: [
                Tab(
                  text: "Account",
                ),
                Tab(
                  text: "Card",
                )
              ]),
        ),
        body: Expanded(
          child: TabBarView(
            children: [
              // account page
              AccountPage(),
              // card page
              CardPage(),
            ],
          ),
        ),
      ),
    );
  }
}
