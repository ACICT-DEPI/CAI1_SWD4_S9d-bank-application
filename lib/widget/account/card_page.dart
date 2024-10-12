import 'package:flutter/material.dart';
import 'package:vaulta/core/constant/imageAssets.dart';

class CardPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          GestureDetector(
            child: Image.asset(AppImageassets.blueVisa),
            onTap: () {
              Navigator.pushNamed(context, "/card1");
            },
          ),
          SizedBox(
            height: 8,
          ),
          GestureDetector(
            child: Image.asset(AppImageassets.yellowVisa),
            onTap: () {
              Navigator.pushNamed(context, "/card2");
            },
          ),
          SizedBox(
            height: 8,
          ),
        ],
      ),
    );
  }
}
