import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:expense_repository/src/entities/category_entity.dart';

class IncomeEntity {
  String incomeId;
  CategoryEntity category;
  Timestamp date; // Firestore Timestamp type
  int amount;

  IncomeEntity({
    required this.incomeId,
    required this.category,
    required this.date,
    required this.amount,
  });

  Map<String, dynamic> toDocument() {
    return {
      'incomeId': incomeId,
      'category': category.toDocument(),
      'date': date,
      'amount': amount,
    };
  }

  static IncomeEntity fromDocument(Map<String, dynamic> doc) {
    return IncomeEntity(
      incomeId: doc['incomeId'],
      category: CategoryEntity.fromDocument(doc['category']),
      date: doc['date'] as Timestamp,
      amount: doc['amount'],
    );
  }
}
