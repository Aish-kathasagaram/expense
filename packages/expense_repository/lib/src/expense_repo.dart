import 'package:expense_repository/expense_repository.dart';

abstract class ExpenseRepository {
  Future<void> createCategory(Category category);
  Future<List<Category>> getCategory();
  Future<void> createExpense(Expense expense);
  Future<List<Expense>> getExpenses();
}

// // import 'package:expense_repository/expense_repository.dart';

// // abstract class ExpenseRepository {
// //   Future<void> createCategory(String userId, Category category);
// //   Future<List<Category>> getCategory(String userId);
// //   Future<void> createExpense(String userId, Expense expense);
// //   Future<List<Expense>> getExpenses(String userId);
// // }
// import 'package:expense_repository/expense_repository.dart';

// abstract class ExpenseRepository {
//   Future<void> createCategory(String userId, Category category);
//   Future<List<Category>> getCategory(String userId);
//   Future<void> createExpense(String userId, Expense expense);
//   Future<List<Expense>> getExpenses(String userId);
// }
