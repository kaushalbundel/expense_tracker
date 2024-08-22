import 'package:uuid/uuid.dart';

const uuid = Uuid();

enum Category {
  food,
  sanitary,
  cloths,
  medical,
  travel,
  support
} // support is for nanny's all related support // this is a type definition of enum Category without any closing ;

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
}
