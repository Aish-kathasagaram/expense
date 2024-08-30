// import 'package:expense_repository/expense_repository.dart';

// class Expense {
//   String expenseId;
//   Category category;
//   DateTime date;
//   int amount;

//   Expense({
//     required this.expenseId,
//     required this.category,
//     required this.date,
//     required this.amount,
//   });

//   static final empty = Expense(
//     expenseId: '',
//     category: Category.empty,
//     date: DateTime.now(),
//     amount: 0,
//   );

//   ExpenseEntity toEntity() {
//     return ExpenseEntity(
//       expenseId: expenseId,
//       category: category,
//       date: date,
//       amount: amount,
//     );
//   }

//   static Expense fromEntity(ExpenseEntity entity) {
//     return Expense(
//       expenseId: entity.expenseId,
//       category: entity.category,
//       date: entity.date,
//       amount: entity.amount,
//     );
//   }
// }

// import 'package:expense_repository/expense_repository.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';

// class Expense {
//   String expenseId;
//   Category category;
//   Timestamp date; // Use Timestamp for Firestore compatibility
//   int amount;

//   Expense({
//     required this.expenseId,
//     required this.category,
//     required this.date,
//     required this.amount,
//   });

//   static final empty = Expense(
//     expenseId: '',
//     category: Category.empty,
//     date: Timestamp.now(),
//     amount: 0,
//   );

//   ExpenseEntity toEntity() {
//     return ExpenseEntity(
//       expenseId: expenseId,
//       category: category.toEntity(),
//       date: date,
//       amount: amount,
//     );
//   }

//   static Expense fromEntity(ExpenseEntity entity) {
//     return Expense(
//       expenseId: entity.expenseId,
//       category: Category.fromEntity(entity.category),
//       date: entity.date,
//       amount: entity.amount,
//     );
//   }

// }
// import 'package:expense_repository/expense_repository.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';

// class Expense {
//   String expenseId;
//   Category category;
//   Timestamp date; // Use Timestamp for Firestore compatibility
//   int amount;

//   Expense({
//     required this.expenseId,
//     required this.category,
//     required this.date,
//     required this.amount,
//   });

//   static final empty = Expense(
//     expenseId: '',
//     category: Category.empty,
//     date: Timestamp.now(),
//     amount: 0,
//   );

//   ExpenseEntity toEntity() {
//     return ExpenseEntity(
//       expenseId: expenseId,
//       category: category.toEntity(),
//       date: date,
//       amount: amount,
//     );
//   }

//   static Expense fromEntity(ExpenseEntity entity) {
//     return Expense(
//       expenseId: entity.expenseId,
//       category: Category.fromEntity(entity.category),
//       date: entity.date,
//       amount: entity.amount,
//     );
//   }

//   // New factory method to create Expense from Firestore document
//   factory Expense.fromDocument(
//       QueryDocumentSnapshot<Map<String, dynamic>> doc) {
//     final data = doc.data();
//     return Expense(
//       expenseId: doc.id, // Get document ID
//       category: Category.fromEntity(
//           data['category']), // Adjust based on how your Category is structured
//       date: data['date'] as Timestamp, // Ensure this is of type Timestamp
//       amount: data['amount'] ?? 0, // Default to 0 if amount is not available
//     );
//   }
// }

// import 'package:expense_repository/expense_repository.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';

// class Expense {
//   String expenseId;
//   Category category;
//   Timestamp date; // Use Timestamp for Firestore compatibility
//   int amount;

//   Expense({
//     required this.expenseId,
//     required this.category,
//     required this.date,
//     required this.amount,
//   });

//   static final empty = Expense(
//     expenseId: '',
//     category: Category.empty,
//     date: Timestamp.now(),
//     amount: 0,
//   );

//   ExpenseEntity toEntity() {
//     return ExpenseEntity(
//       expenseId: expenseId,
//       category: category.toEntity(),
//       date: date,
//       amount: amount,
//     );
//   }

//   static Expense fromEntity(ExpenseEntity entity) {
//     return Expense(
//       expenseId: entity.expenseId,
//       category: Category.fromEntity(entity.category),
//       date: entity.date,
//       amount: entity.amount,
//     );
//   }

//   // New factory method to create Expense from Firestore document
//   factory Expense.fromDocument(
//       QueryDocumentSnapshot<Map<String, dynamic>> doc) {
//     final data = doc.data();
//     return Expense(
//       expenseId: doc.id, // Get document ID
//       category: Category.fromMap(
//           data['category']), // Use fromMap instead of fromDocument
//       date: data['date'] as Timestamp, // Ensure this is of type Timestamp
//       amount: data['amount'] ?? 0, // Default to 0 if amount is not available
//     );
//   }
// // }








import 'package:expense_repository/expense_repository.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Expense {
  String expenseId;
  Category category;
  Timestamp date; // Use Timestamp for Firestore compatibility
  int amount;

  Expense({
    required this.expenseId,
    required this.category,
    required this.date,
    required this.amount,
  });

  static final empty = Expense(
    expenseId: '',
    category: Category.empty,
    date: Timestamp.now(),
    amount: 0,
  );

  ExpenseEntity toEntity() {
    return ExpenseEntity(
      expenseId: expenseId,
      category: category.toEntity(),
      date: date,
      amount: amount,
    );
  }

  static Expense fromEntity(ExpenseEntity entity) {
    return Expense(
      expenseId: entity.expenseId,
      category: Category.fromEntity(entity.category),
      date: entity.date,
      amount: entity.amount,
    );
  }

  // Adjusted factory method to create Expense from Firestore document
  factory Expense.fromDocument(
      QueryDocumentSnapshot<Map<String, dynamic>> doc) {
    final data = doc.data();
    return Expense(
      expenseId: doc.id, // Get document ID
      category: Category.fromEntity(
        CategoryEntity(
          categoryId: data['category']['categoryId'],
          name: data['category']['name'],
          totalExpenses: data['category']['totalExpenses'],
          icon: data['category']['icon'],
          color: data['category']['color'],
        ),
      ),
      date: data['date'] as Timestamp,
      amount: data['amount'] ?? 0,
    );
  }
}









