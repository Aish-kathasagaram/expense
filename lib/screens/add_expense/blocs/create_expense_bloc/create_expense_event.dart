import 'package:equatable/equatable.dart';
import 'package:expense_repository/expense_repository.dart';

abstract class CreateExpenseEvent extends Equatable {
  const CreateExpenseEvent();

  @override
  List<Object?> get props => [];
}

class CreateExpense extends CreateExpenseEvent {
  final Expense expense;

  CreateExpense(this.expense);

  @override
  List<Object?> get props => [expense];
}
// import 'package:equatable/equatable.dart';
// import 'package:expense_repository/expense_repository.dart';

// abstract class CreateExpenseEvent extends Equatable {
//   @override
//   List<Object?> get props => [];
// }

// class CreateExpense extends CreateExpenseEvent {
//   final Expense expense;

//   CreateExpense(this.expense);

//   @override
//   List<Object?> get props => [expense];
// }

// class TransactionAdded extends CreateExpenseEvent {}
