import 'package:equatable/equatable.dart';

abstract class GetExpensesEvent extends Equatable {
  const GetExpensesEvent();

  @override
  List<Object> get props => [];
}

class FetchExpenses extends GetExpensesEvent {}
// import 'package:equatable/equatable.dart';

// abstract class GetExpensesEvent extends Equatable {
//   @override
//   List<Object?> get props => [];
// }

// class FetchExpenses extends GetExpensesEvent {}

// class TransactionAdded extends GetExpensesEvent {}
