// part of 'get_categories_bloc.dart';

// abstract class GetCategoriesState extends Equatable {
//   const GetCategoriesState();

//   @override
//   List<Object?> get props => [];
// }

// class GetCategoriesInitial extends GetCategoriesState {}

// class GetCategoriesLoading extends GetCategoriesState {}

// class GetCategoriesSuccess extends GetCategoriesState {
//   final List<Category> categories;

//   const GetCategoriesSuccess(this.categories);

//   @override
//   List<Object?> get props => [categories];

//   @override
//   String toString() => 'GetCategoriesSuccess { categories: $categories }';
// }

// class GetCategoriesFailure extends GetCategoriesState {}
part of 'get_categories_bloc.dart';

abstract class GetCategoriesState extends Equatable {
  const GetCategoriesState();

  @override
  List<Object?> get props => [];
}

class GetCategoriesInitial extends GetCategoriesState {}

class GetCategoriesLoading extends GetCategoriesState {}

class GetCategoriesSuccess extends GetCategoriesState {
  final List<Category> categories;

  const GetCategoriesSuccess(this.categories);

  @override
  List<Object?> get props => [categories];

  @override
  String toString() => 'GetCategoriesSuccess { categories: $categories }';
}

class GetCategoriesFailure extends GetCategoriesState {}
