import 'dart:developer';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:expense_repository/expense_repository.dart';
import 'package:expense_repository/src/entities/expense_entity.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FirebaseExpenseRepo implements ExpenseRepository {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  CollectionReference categoryCollection(String userId) {
    return FirebaseFirestore.instance
        .collection('users')
        .doc(userId)
        .collection('categories');
  }

  CollectionReference expenseCollection(String userId) {
    return FirebaseFirestore.instance
        .collection('users')
        .doc(userId)
        .collection('expenses');
  }

  @override
  Future<void> createCategory(Category category) async {
    try {
      String userId = _auth.currentUser!.uid;
      await categoryCollection(userId)
          .doc(category.categoryId)
          .set(category.toEntity().toDocument());
    } catch (e) {
      log(e.toString());
      rethrow;
    }
  }

  @override
  Future<List<Category>> getCategory() async {
    try {
      String userId = _auth.currentUser!.uid;
      return await categoryCollection(userId).get().then((value) => value.docs
          .map((e) => Category.fromEntity(
              CategoryEntity.fromDocument(e.data() as Map<String, dynamic>)))
          .toList());
    } catch (e) {
      log(e.toString());
      rethrow;
    }
  }

  @override
  Future<void> createExpense(Expense expense) async {
    try {
      String userId = _auth.currentUser!.uid;
      await expenseCollection(userId)
          .doc(expense.expenseId)
          .set(expense.toEntity().toDocument());
    } catch (e) {
      log(e.toString());
      rethrow;
    }
  }

  @override
  Future<List<Expense>> getExpenses() async {
    try {
      String userId = _auth.currentUser!.uid;
      return await expenseCollection(userId).get().then((value) => value.docs
          .map((e) => Expense.fromEntity(
              ExpenseEntity.fromDocument(e.data() as Map<String, dynamic>)))
          .toList());
    } catch (e) {
      log(e.toString());
      rethrow;
    }
  }
}
