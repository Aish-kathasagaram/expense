import 'package:equatable/equatable.dart';
import 'package:expense_repository/expense_repository.dart';

abstract class CreateExpenseState extends Equatable {
  const CreateExpenseState();

  @override
  List<Object?> get props => [];
}

class CreateExpenseInitial extends CreateExpenseState {}

class CreateExpenseLoading extends CreateExpenseState {}

class CreateExpenseSuccess extends CreateExpenseState {
  final Expense expense;

  CreateExpenseSuccess(this.expense);

  @override
  List<Object?> get props => [expense];
}

class CreateExpenseFailure extends CreateExpenseState {
  final String error;

  CreateExpenseFailure(this.error);

  @override
  List<Object?> get props => [error];
}
// import 'package:equatable/equatable.dart';
// import 'package:expense_repository/expense_repository.dart';

// abstract class CreateExpenseState extends Equatable {
//   @override
//   List<Object?> get props => [];
// }

// class CreateExpenseInitial extends CreateExpenseState {}

// class CreateExpenseLoading extends CreateExpenseState {}

// class CreateExpenseSuccess extends CreateExpenseState {
//   final Expense expense;

//   CreateExpenseSuccess(this.expense);

//   @override
//   List<Object?> get props => [expense];
// }

// class CreateExpenseFailure extends CreateExpenseState {
//   final String error;

//   CreateExpenseFailure(this.error);

//   @override
//   List<Object?> get props => [error];
// }

// class TransactionAddedSuccess extends CreateExpenseState {}
