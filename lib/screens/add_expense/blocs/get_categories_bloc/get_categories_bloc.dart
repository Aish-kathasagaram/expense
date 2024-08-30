import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:expense_repository/expense_repository.dart';

part 'get_categories_event.dart';
part 'get_categories_state.dart';

class GetCategoriesBloc extends Bloc<GetCategoriesEvent, GetCategoriesState> {
  final ExpenseRepository _expenseRepository;

  GetCategoriesBloc(this._expenseRepository) : super(GetCategoriesInitial()) {
    on<FetchCategories>(_onFetchCategories);
  }

  void _onFetchCategories(
      FetchCategories event, Emitter<GetCategoriesState> emit) async {
    emit(GetCategoriesLoading());
    try {
      final categories = await _expenseRepository.getCategory();
      emit(GetCategoriesSuccess(categories));
    } catch (_) {
      emit(GetCategoriesFailure());
    }
  }

  @override
  Stream<GetCategoriesState> mapEventToState(GetCategoriesEvent event) async* {
    // Implement your event to state mapping here, if needed
  }
}
