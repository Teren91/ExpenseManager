import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

class CategoryExpenseEntity extends Equatable {
  const CategoryExpenseEntity({
    required this.categoryName,
    required this.amount,
    required this.percentage,
    required this.icon,
  });

  final String categoryName;
  final double amount;
  final double percentage;
  final IconData icon;

  @override
  List<Object> get props => [categoryName, amount, percentage, icon];
}