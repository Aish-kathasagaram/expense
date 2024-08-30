import 'package:bloc/bloc.dart';
import 'package:expense_repository/expense_repository.dart';
import 'package:equatable/equatable.dart';
import 'package:mad_my_app/screens/home/blocs/get_expenses_bloc/get_expenses_event.dart';
import 'package:mad_my_app/screens/home/blocs/get_expenses_bloc/get_expenses_state.dart';

class GetExpensesBloc extends Bloc<GetExpensesEvent, GetExpensesState> {
  final ExpenseRepository _expenseRepository;

  GetExpensesBloc(this._expenseRepository) : super(GetExpensesInitial()) {
    on<FetchExpenses>(_onFetchExpenses);
  }

  void _onFetchExpenses(
      FetchExpenses event, Emitter<GetExpensesState> emit) async {
    emit(GetExpensesLoading());
    try {
      final expenses = await _expenseRepository.getExpenses();
      emit(GetExpensesSuccess(expenses));
    } catch (_) {
      emit(GetExpensesFailure());
    }
  }
}
// import 'package:bloc/bloc.dart';
// import 'package:expense_repository/expense_repository.dart';
// import 'package:equatable/equatable.dart';
// import 'package:mad_my_app/screens/home/blocs/get_expenses_bloc/get_expenses_event.dart';
// import 'package:mad_my_app/screens/home/blocs/get_expenses_bloc/get_expenses_state.dart';

// class GetExpensesBloc extends Bloc<GetExpensesEvent, GetExpensesState> {
//   final ExpenseRepository _expenseRepository;

//   GetExpensesBloc(this._expenseRepository) : super(GetExpensesInitial()) {
//     on<FetchExpenses>(_onFetchExpenses);
//     on<TransactionAdded>(_onTransactionAdded); // Add this line
//   }

//   void _onFetchExpenses(FetchExpenses event, Emitter<GetExpensesState> emit) async {
//     emit(GetExpensesLoading());
//     try {
//       final expenses = await _expenseRepository.getExpenses();
//       emit(GetExpensesSuccess(expenses));
//     } catch (_) {
//       emit(GetExpensesFailure());
//     }
//   }

//   void _onTransactionAdded(TransactionAdded event, Emitter<GetExpensesState> emit) {
//     // You can add logic here if you want to refresh expenses when a transaction is added
//     emit(TransactionAddedSuccess()); // Notify that the transaction was added
//   }
// }
