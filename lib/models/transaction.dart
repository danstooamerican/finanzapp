import 'package:financeplanner/models/category.dart';
import 'package:flutter/cupertino.dart';

class Transaction {
  final int id;
  final DateTime dateTime;
  final String description;
  final Category category;
  final double amount;

  Transaction({
    @required this.id,
    @required this.category,
    @required this.description,
    @required this.amount,
    @required this.dateTime,
  });

  DateTime get date {
    return new DateTime(dateTime.year, dateTime.month, dateTime.day);
  }

  Transaction.fromJson(Map<String, dynamic> json)
      : amount = json['amount'],
        id = json['id'],
        category = Category.fromJson(json['category']),
        dateTime = DateTime.parse(json['date']),
        description = json['description'];

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'amount': amount,
      'description': description,
      'category': category.toJson(),
      'date': date.toString().substring(0, 10),
    };
  }
}
