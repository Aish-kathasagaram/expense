import 'package:bloc/bloc.dart';
import 'package:expense_repository/expense_repository.dart';
import 'create_expense_event.dart';
import 'create_expense_state.dart';

class CreateExpenseBloc extends Bloc<CreateExpenseEvent, CreateExpenseState> {
  final ExpenseRepository _expenseRepository;

  CreateExpenseBloc(this._expenseRepository) : super(CreateExpenseInitial()) {
    on<CreateExpense>(_onCreateExpense);
  }

  void _onCreateExpense(
      CreateExpense event, Emitter<CreateExpenseState> emit) async {
    emit(CreateExpenseLoading());
    try {
      await _expenseRepository.createExpense(event.expense);
      emit(CreateExpenseSuccess(event.expense));
    } catch (error) {
      emit(CreateExpenseFailure(error.toString()));
    }
  }
}
// import 'package:bloc/bloc.dart';
// import 'package:expense_repository/expense_repository.dart';
// import 'create_expense_event.dart';
// import 'create_expense_state.dart';

// class CreateExpenseBloc extends Bloc<CreateExpenseEvent, CreateExpenseState> {
//   final ExpenseRepository _expenseRepository;

//   CreateExpenseBloc(this._expenseRepository) : super(CreateExpenseInitial()) {
//     on<CreateExpense>(_onCreateExpense);
//     on<TransactionAdded>(_onTransactionAdded); // Add this line
//   }

//   void _onCreateExpense(CreateExpense event, Emitter<CreateExpenseState> emit) async {
//     emit(CreateExpenseLoading());
//     try {
//       await _expenseRepository.createExpense(event.expense);
//       emit(CreateExpenseSuccess(event.expense));
//     } catch (error) {
//       emit(CreateExpenseFailure(error.toString()));
//     }
//   }

//   void _onTransactionAdded(TransactionAdded event, Emitter<CreateExpenseState> emit) {
//     // Handle the transaction added logic here if needed
//     emit(TransactionAddedSuccess()); // Notify that the transaction was added
//   }
// }
