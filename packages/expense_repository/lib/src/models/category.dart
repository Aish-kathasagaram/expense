// import 'package:expense_repository/src/entities/entities.dart';

// class Category {
//   String categoryId;
//   String name;
//   int totalExpenses;
//   String icon;
//   int color;

//   Category({
//     required this.categoryId,
//     required this.name,
//     required this.totalExpenses,
//     required this.icon,
//     required this.color,
//   });

//   static final empty =
//       Category(categoryId: '', name: '', totalExpenses: 0, icon: '', color: 0);

//   CategoryEntity toEntity() {
//     return CategoryEntity(
//       categoryId: categoryId,
//       name: name,
//       totalExpenses: totalExpenses,
//       icon: icon,
//       color: color,
//     );
//   }

//   static Category fromEntity(CategoryEntity entity) {
//     return Category(
//       categoryId: entity.categoryId,
//       name: entity.name,
//       totalExpenses: entity.totalExpenses,
//       icon: entity.icon,
//       color: entity.color,
//     );
//   }

//   //Category copyWith({required String categoryId, required String name, required String icon, required int color}) {}
// }

// import 'package:expense_repository/src/entities/entities.dart';

// class Category {
//   String categoryId;
//   String name;
//   int totalExpenses;
//   String icon;
//   int color;

//   Category({
//     required this.categoryId,
//     required this.name,
//     required this.totalExpenses,
//     required this.icon,
//     required this.color,
//   });

//   static final empty =
//       Category(categoryId: '', name: '', totalExpenses: 0, icon: '', color: 0);

//   CategoryEntity toEntity() {
//     return CategoryEntity(
//       categoryId: categoryId,
//       name: name,
//       totalExpenses: totalExpenses,
//       icon: icon,
//       color: color,
//     );
//   }

//   static Category fromEntity(CategoryEntity entity) {
//     return Category(
//       categoryId: entity.categoryId,
//       name: entity.name,
//       totalExpenses: entity.totalExpenses,
//       icon: entity.icon,
//       color: entity.color,
//     );
//   }
// }

// import 'package:expense_repository/src/entities/entities.dart';

// class Category {
//   String categoryId;
//   String name;
//   int totalExpenses;
//   String icon;
//   int color;

//   Category({
//     required this.categoryId,
//     required this.name,
//     required this.totalExpenses,
//     required this.icon,
//     required this.color,
//   });

//   static final empty =
//       Category(categoryId: '', name: '', totalExpenses: 0, icon: '', color: 0);

//   CategoryEntity toEntity() {
//     return CategoryEntity(
//       categoryId: categoryId,
//       name: name,
//       totalExpenses: totalExpenses,
//       icon: icon,
//       color: color,
//     );
//   }

//   static Category fromEntity(CategoryEntity entity) {
//     return Category(
//       categoryId: entity.categoryId,
//       name: entity.name,
//       totalExpenses: entity.totalExpenses,
//       icon: entity.icon,
//       color: entity.color,
//     );
//   }
// }
import 'package:expense_repository/src/entities/entities.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Category {
  String categoryId;
  String name;
  int totalExpenses;
  String icon;
  int color;

  Category({
    required this.categoryId,
    required this.name,
    required this.totalExpenses,
    required this.icon,
    required this.color,
  });

  static final empty =
      Category(categoryId: '', name: '', totalExpenses: 0, icon: '', color: 0);

  CategoryEntity toEntity() {
    return CategoryEntity(
      categoryId: categoryId,
      name: name,
      totalExpenses: totalExpenses,
      icon: icon,
      color: color,
    );
  }

  static Category fromEntity(CategoryEntity entity) {
    return Category(
      categoryId: entity.categoryId,
      name: entity.name,
      totalExpenses: entity.totalExpenses,
      icon: entity.icon,
      color: entity.color,
    );
  }

  // New method to create Category from a map
  static Category fromMap(Map<String, dynamic> data) {
    return Category(
      categoryId: data['categoryId'] ?? '',
      name: data['name'] ?? '',
      totalExpenses: data['totalExpenses'] ?? 0,
      icon: data['icon'] ?? '',
      color: data['color'] ?? 0,
    );
  }
}
