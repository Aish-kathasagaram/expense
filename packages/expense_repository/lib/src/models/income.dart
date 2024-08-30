// import 'package:expense_repository/expense_repository.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';

// class Income {
//   String incomeId;
//   Category category;
//   Timestamp date; // Use Timestamp for Firestore compatibility
//   int amount;

//   Income({
//     required this.incomeId,
//     required this.category,
//     required this.date,
//     required this.amount,
//   });

//   static final empty = Income(
//     incomeId: '',
//     category: Category.empty,
//     date: Timestamp.now(),
//     amount: 0,
//   );

//   IncomeEntity toEntity() {
//     return IncomeEntity(
//       incomeId: incomeId,
//       category: category.toEntity(),
//       date: date,
//       amount: amount,
//     );
//   }

//   static Income fromEntity(IncomeEntity entity) {
//     return Income(
//       incomeId: entity.incomeId,
//       category: Category.fromEntity(entity.category),
//       date: entity.date,
//       amount: entity.amount,
//     );
//   }
// }









import 'package:expense_repository/expense_repository.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Income {
  String incomeId;
  Category category;
  Timestamp date; // Use Timestamp for Firestore compatibility
  int amount;

  Income({
    required this.incomeId,
    required this.category,
    required this.date,
    required this.amount,
  });

  static final empty = Income(
    incomeId: '',
    category: Category.empty,
    date: Timestamp.now(),
    amount: 0,
  );

  IncomeEntity toEntity() {
    return IncomeEntity(
      incomeId: incomeId,
      category: category.toEntity(),
      date: date,
      amount: amount,
    );
  }

  static Income fromEntity(IncomeEntity entity) {
    return Income(
      incomeId: entity.incomeId,
      category: Category.fromEntity(entity.category),
      date: entity.date,
      amount: entity.amount,
    );
  }

  // New factory method to create Income from Firestore document
  factory Income.fromDocument(QueryDocumentSnapshot<Map<String, dynamic>> doc) {
    final data = doc.data();
    return Income(
      incomeId: doc.id, // Get document ID
      category: Category.fromEntity(
        CategoryEntity(
          categoryId: data['category']['categoryId'],
          name: data['category']['name'],
          totalExpenses: data['category']['totalExpenses'],
          icon: data['category']['icon'],
          color: data['category']['color'],
        ),
      ),
      date: data['date'] as Timestamp, // Ensure this is of type Timestamp
      amount: data['amount'] ?? 0, // Default to 0 if amount is not available
    );
  }
}


