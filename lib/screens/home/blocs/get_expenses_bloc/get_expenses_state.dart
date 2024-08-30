import 'package:equatable/equatable.dart';
import 'package:expense_repository/expense_repository.dart';

abstract class GetExpensesState extends Equatable {
  const GetExpensesState();

  @override
  List<Object> get props => [];
}

class GetExpensesInitial extends GetExpensesState {}

class GetExpensesLoading extends GetExpensesState {}

class GetExpensesSuccess extends GetExpensesState {
  final List<Expense> expenses;

  const GetExpensesSuccess(this.expenses);

  @override
  List<Object> get props => [expenses];
}

class GetExpensesFailure extends GetExpensesState {}
// import 'package:equatable/equatable.dart';
// import 'package:expense_repository/expense_repository.dart';

// abstract class GetExpensesState extends Equatable {
//   @override
//   List<Object?> get props => [];
// }

// class GetExpensesInitial extends GetExpensesState {}

// class GetExpensesLoading extends GetExpensesState {}

// class GetExpensesSuccess extends GetExpensesState {
//   final List<Expense> expenses;

//   GetExpensesSuccess(this.expenses);

//   @override
//   List<Object?> get props => [expenses];
// }

// class GetExpensesFailure extends GetExpensesState {}

// class TransactionAddedSuccess extends GetExpensesState {}
