import 'package:flutter/material.dart';
import 'package:misgastos/features/home/domain/entities/category_expense_entity.dart';

class CategoryExpense extends StatelessWidget {
  const CategoryExpense({super.key, required this.categoryExpense});

  final CategoryExpenseEntity categoryExpense;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Card(
      elevation: 2,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Gastos por categoria',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16,),
            Row(
              children: [
                Icon(categoryExpense.icon, size: 24,),
                Text(
                  categoryExpense.categoryName,
                  style: textTheme.titleMedium,
                ),
                const SizedBox(width: 16,),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        '\$${categoryExpense.amount.toStringAsFixed(2)}',
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                       Text(
                          '${categoryExpense.percentage.toStringAsFixed(2)}%',
                          style: const TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                    ],
                  ),
                )
              ],
            ),
            const SizedBox(height: 16,),
           ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: LinearProgressIndicator(
                value: categoryExpense.percentage / 100,
                minHeight: 10,
                backgroundColor: Colors.grey[300],
                valueColor: AlwaysStoppedAnimation<Color>(
                  Theme.of(context).primaryColor,
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Total de gastos: \$${categoryExpense.amount.toStringAsFixed(2)}',
                  style: textTheme.titleMedium,
                ),
              ],    
            )
          ],
        ),
      ),
    );
  }
}