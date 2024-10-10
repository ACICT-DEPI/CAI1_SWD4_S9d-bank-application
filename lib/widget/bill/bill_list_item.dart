import 'package:flutter/material.dart';
import 'package:vaulta/data/model/bill_model.dart';

class BillListItem extends StatelessWidget {
  const BillListItem({super.key, required this.billModel, required this.onTap});
  final BillModel billModel;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(12),
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Bill image
              ClipRRect(
                borderRadius: BorderRadius.circular(8.0),
                child: Image.asset(
                  billModel.image,
                  width: 80,
                  height: 80,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(width: 16),
              // Bill details
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      billModel.title,
                      style: Theme.of(context).textTheme.titleLarge?.copyWith(
                            fontWeight: FontWeight.bold,
                            color: Colors.black87,
                          ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      billModel.body,
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                            fontStyle: FontStyle.italic,
                            color: Colors.grey[700],
                          ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
