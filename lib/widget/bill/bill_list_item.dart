import 'package:flutter/material.dart';
import 'package:vaulta/data/model/bill_model.dart';

class BillListItem extends StatelessWidget {
  const BillListItem({super.key, required this.billModel, required this.onTap});
  final BillModel billModel;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        height: 130,
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20.0),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.3),
              spreadRadius: 3,
              blurRadius: 7,
              offset: const Offset(0, 3), // Shadow position
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            children: [
              // Image of the bill with rounded corners
              ClipRRect(
                borderRadius: BorderRadius.circular(15.0), // Rounded image
                child: Image.asset(
                  billModel.image,
                  height: 90,
                  width: 90,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(width: 16), // Space between image and text
              // Expanded Column for title and body
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      billModel.title,
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.black87,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis, // Truncate overflow text
                    ),
                    // const SizedBox(height: 8), // Space between title and body
                    Text(
                      billModel.body,
                      style: const TextStyle(
                        fontSize: 16,
                        color: Colors.black54,
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis, // Truncate overflow text
                    ),
                  ],
                ),
              ),
              // Optional action or icon button at the end
              IconButton(
                icon: const Icon(Icons.arrow_forward_ios),
                color: Colors.grey,
                onPressed: () {
                  // Handle navigation or action
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
