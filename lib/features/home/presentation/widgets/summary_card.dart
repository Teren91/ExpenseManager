import 'package:flutter/material.dart';

class SummaryCard extends StatelessWidget {
  const SummaryCard({
    required this.title,
    required this.amount,
    required this.icon,
    this.amountColor = Colors.black,
    super.key,
  });
  final String title;
  final double amount;
  final IconData icon;
  final Color amountColor;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  title, style: Theme.of(context).textTheme.titleMedium,
                ),
                Icon(icon, size: 32,),
              ],
            ),
            Text(
             '€${amount.toStringAsFixed(2)}', 
              style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                color: amountColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}