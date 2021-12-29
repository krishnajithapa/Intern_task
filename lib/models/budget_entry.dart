import 'package:flutter/material.dart';

class BudgetEntry {
  final String title;
  final int budgetMoney;
  final int actMoney;
  final Icon icon;

  const BudgetEntry({
    required this.title,
    required this.budgetMoney,
    required this.actMoney,
    required this.icon,
  });

  int get totalPercentUsed {
    return (actMoney / budgetMoney * 100).round();
  }

  Color get color {
    if (totalPercentUsed > 100) {
      return Colors.red;
    } else if (totalPercentUsed < 100) {
      return Colors.green;
    }
    return Colors.blue;
  }
}

final budgetEntries = [
  BudgetEntry(
    title: "Shopping",
    actMoney: 127,
    budgetMoney: 100,
    icon: Icon(
      Icons.shop,
      color: Colors.amber[300],
    ),
  ),
  BudgetEntry(
    title: "Healthcare",
    actMoney: 80,
    budgetMoney: 100,
    icon: Icon(
      Icons.health_and_safety,
      color: Colors.red[300],
    ),
  ),
  BudgetEntry(
    title: "Food & Drinks",
    actMoney: 100,
    budgetMoney: 100,
    icon: Icon(
      Icons.food_bank_rounded,
      color: Colors.orange[300],
    ),
  ),
  BudgetEntry(
    title: "Travel",
    actMoney: 45,
    budgetMoney: 100,
    icon: Icon(
      Icons.travel_explore_sharp,
      color: Colors.blue[300],
    ),
  ),
];
