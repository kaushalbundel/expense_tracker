import 'package:uuid/uuid.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

// for having unique values of expenses
const uuid = Uuid();

enum Category {
  food,
  sanitary,
  cloths,
  medical,
  travel,
  support
} // support is for nanny's all related support // this is a type definition of enum Category without any closing ;

extension CategoryExtension on Category {
  String get name => toString().split('.').last;
}

const Map categoryIcon = {
  Category.cloths: Icons.child_care,
  Category.food: Icons.dining,
  Category.sanitary: Icons.baby_changing_station,
  Category.medical: Icons.medication,
  Category.travel: Icons.leave_bags_at_home,
  Category.support: Icons.support_agent,
};

//formatter to get the formatted value of date
final formatter = DateFormat.yMMMd();

class Expense {
  Expense(
      {required this.title,
      required this.description,
      required this.date,
      required this.amount,
      required this.category})
      : id = uuid.v4();

  final String title;
  final String description;
  final DateTime date; // for capturing when was an expense added
  final double amount;
  final String id;
  final Category category;

// to show formatted date in the widget
  String get formattedDate {
    return formatter.format(date);
  }
}
