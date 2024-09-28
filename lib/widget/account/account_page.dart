import 'package:flutter/material.dart';
import 'package:vaulta/core/constant/imageAssets.dart';

class AccountsList {
  final String account_number;
  final int account_id;
  final String branch_name;
  final double available_balance;

  AccountsList(this.account_id,
      {required this.account_number,
      required this.branch_name,
      required this.available_balance});
}

class AccountPage extends StatelessWidget {
  List<AccountsList> accountsData = [
    AccountsList(1,
        account_number: "1900 4500 8796",
        branch_name: "new york",
        available_balance: 15000),
    AccountsList(2,
        account_number: "1900 4568 1123",
        branch_name: "new york",
        available_balance: 23459),
    AccountsList(3,
        account_number: "889 4500 8796",
        branch_name: "new york",
        available_balance: 320555),
  ];

  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            child: Padding(
              padding: EdgeInsets.all(25),
              child: Center(
                child: Column(
                  children: [
                    Image.asset(
                      AppImageassets.avatar,
                      width: 120,
                      height: 120,
                      fit: BoxFit.contain,
                    ),
                    Text(
                      "Push Puttichai",
                      style: TextStyle(
                          color: Color(0xFF3629B7),
                          fontWeight: FontWeight.bold,
                          fontSize: 20),
                    )
                  ],
                ),
              ),
            ),
          ),
          Expanded(
            child: ListView.separated(
              itemBuilder: (context, index) =>
                  buildAccountInfo(accountsData[index]),
              separatorBuilder: (context, index) => Padding(
                padding: const EdgeInsetsDirectional.only(start: 20),
                child: Container(
                  width: double.infinity,
                  height: 1,
                  color: Colors.grey[400],
                ),
              ),
              itemCount: accountsData.length,
            ),
          ),
        ],
      ),
    );
  }

  Widget buildAccountInfo(AccountsList acountdata) => Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ListTile(
              title: Text(
                'Account ${acountdata.account_id}',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              trailing: Text(
                "${acountdata.account_number}",
                style: TextStyle(
                  fontSize: 18,
                ),
              ),
            ),
            SizedBox(height: 8),
            ListTile(
              title: Text(
                'Available balance',
                style: TextStyle(fontSize: 16, color: Colors.grey),
              ),
              trailing: Text(
                "${acountdata.available_balance}",
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF3629B7)),
              ),
            ),
            SizedBox(height: 8),
            ListTile(
              title: Text(
                'Branch',
                style: TextStyle(fontSize: 16, color: Colors.grey),
              ),
              trailing: Text(
                "${acountdata.branch_name}",
                style: TextStyle(
                  fontSize: 16,
                  color: Color(0xFF3629B7),
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      );
}
