import 'package:flutter/material.dart';

class ReportItem extends StatelessWidget {
  const ReportItem(
      {super.key,
      required this.toName,
      required this.amount,
      required this.content,
      required this.isReceived,
      required this.date});
  final String toName;
  final String amount;
  final String content;
  final bool isReceived;
  final String date;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Left side (toName and content)
          Expanded(
            flex: 2,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  toName,
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20, // Adjusted font size
                      color: Colors.black),
                  overflow: TextOverflow.ellipsis, // Prevents overflow
                  maxLines: 1, // Limits to 1 line
                ),
                SizedBox(
                  height: 5,
                ),
                Text(
                  content,
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 14, // Adjusted font size
                      color: Colors.grey),
                  overflow: TextOverflow.ellipsis, // Prevents overflow
                  maxLines: 1, // Limits to 1 line
                ),
              ],
            ),
          ),
          // Ensures spacing between left and right sections
          SizedBox(
            width: 16,
          ),
          // Right side (date and amount) aligned to the right
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                date,
                style: TextStyle(fontSize: 14, color: Colors.grey),
                overflow: TextOverflow.ellipsis, // Prevents overflow
                maxLines: 1, // Limits to 1 line
              ),
              SizedBox(
                height: 5,
              ),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    "Amount:",
                    style: TextStyle(
                        fontStyle: FontStyle.italic,
                        fontSize: 14,
                        color: Colors.grey),
                  ),
                  SizedBox(
                    width: 8,
                  ),
                  Text(amount,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                        color: isReceived ? Colors.green : Colors.red,
                      ),
                      overflow: TextOverflow.ellipsis // Prevents overflow
                      ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
