import 'package:bloc/bloc.dart';
import 'package:expense_repository/expense_repository.dart';
import 'package:equatable/equatable.dart';

part 'create_category_event.dart';
part 'create_category_state.dart';

class CreateCategoryBloc
    extends Bloc<CreateCategoryEvent, CreateCategoryState> {
  final ExpenseRepository _expenseRepository;

  CreateCategoryBloc(this._expenseRepository) : super(CreateCategoryInitial()) {
    on<CreateCategory>(_onCreateCategory);
  }

  void _onCreateCategory(
      CreateCategory event, Emitter<CreateCategoryState> emit) async {
    emit(CreateCategoryLoading());
    try {
      await _expenseRepository.createCategory(event.category);
      emit(CreateCategorySuccess());
    } catch (e) {
      emit(CreateCategoryFailure(error: e.toString()));
    }
  }

  @override
  Stream<CreateCategoryState> mapEventToState(
      CreateCategoryEvent event) async* {
    // Implement any additional event to state mapping here, if needed
  }
}
