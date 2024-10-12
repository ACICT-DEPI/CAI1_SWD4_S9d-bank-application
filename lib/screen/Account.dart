import 'package:buttons_tabbar/buttons_tabbar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

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
      // Use DefaultTabController to handle TabBar
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text('93'.tr),
          bottom: PreferredSize(
            preferredSize: Size.fromHeight(50), // Set height for tab bar
            child: ButtonsTabBar(
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
                Tab(text: "73".tr),
                Tab(text: "94".tr),
              ],
            ),
          ),
        ),
        body: TabBarView(
          children: [
            AccountPage(), // Account page
            CardPage(), // Card page
          ],
        ),
      ),
    );
  }
}
