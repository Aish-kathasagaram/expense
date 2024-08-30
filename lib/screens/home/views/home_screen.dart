// import 'package:expense_repository/expense_repository.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:mad_my_app/screens/add_expense/blocs/create_categorybloc/create_category_bloc.dart';
// import 'package:mad_my_app/screens/add_expense/blocs/create_expense_bloc/create_expense_bloc.dart';
// import 'package:mad_my_app/screens/add_expense/blocs/get_categories_bloc/get_categories_bloc.dart';
// import 'package:mad_my_app/screens/add_expense/views/add_expense.dart';
// import 'package:mad_my_app/screens/home/blocs/get_expenses_bloc/get_expenses_bloc.dart';
// import 'package:mad_my_app/screens/home/blocs/get_expenses_bloc/get_expenses_state.dart';
// import 'dart:math';
// import 'package:mad_my_app/screens/home/views/main_screen.dart';
// import 'package:mad_my_app/screens/stats/stats.dart';

// class HomeScreen extends StatefulWidget {
//   const HomeScreen({super.key});

//   @override
//   State<HomeScreen> createState() => _HomeScreenState();
// }

// class _HomeScreenState extends State<HomeScreen> {
//   int index = 0;
//   late Color selectedItem = Colors.blue;
//   Color unselectedItem = Colors.grey;

//   @override
//   Widget build(BuildContext context) {
//     return BlocBuilder<GetExpensesBloc, GetExpensesState>(
//       builder: (context, state) {
//         if (state is GetExpensesSuccess) {
//           return Scaffold(
//             bottomNavigationBar: ClipRRect(
//               borderRadius:
//                   const BorderRadius.vertical(top: Radius.circular(30)),
//               child: BottomNavigationBar(
//                 onTap: (value) {
//                   setState(() {
//                     index = value;
//                   });
//                 },
//                 showSelectedLabels: false,
//                 showUnselectedLabels: false,
//                 elevation: 3,
//                 items: [
//                   BottomNavigationBarItem(
//                     icon: Icon(
//                       CupertinoIcons.home,
//                       color: index == 0 ? selectedItem : unselectedItem,
//                     ),
//                     label: 'Home',
//                   ),
//                   BottomNavigationBarItem(
//                     icon: Icon(
//                       CupertinoIcons.graph_square_fill,
//                       color: index == 1 ? selectedItem : unselectedItem,
//                     ),
//                     label: 'Stats',
//                   ),
//                 ],
//               ),
//             ),
//             floatingActionButtonLocation:
//                 FloatingActionButtonLocation.centerDocked,
//             floatingActionButton: FloatingActionButton(
//               onPressed: () async {
//                 var newExpense = await Navigator.push(
//                   context,
//                   MaterialPageRoute<Expense>(
//                     builder: (BuildContext context) => MultiBlocProvider(
//                       providers: [
//                         BlocProvider(
//                           create: (context) =>
//                               CreateCategoryBloc(FirebaseExpenseRepo()),
//                         ),
//                         BlocProvider(
//                           create: (context) =>
//                               GetCategoriesBloc(FirebaseExpenseRepo())
//                                 ..add(FetchCategories()),
//                           child: HomeScreen(),
//                         ),
//                         BlocProvider(
//                           create: (context) =>
//                               CreateExpenseBloc(FirebaseExpenseRepo()),
//                         ),
//                       ],
//                       child: const AddExpense(),
//                     ),
//                   ),
//                 );

//                 if (newExpense != null) {
//                   setState(() {
//                     state.expenses.insert(0, newExpense);
//                   });
//                 }
//               },
//               shape: const CircleBorder(),
//               child: Container(
//                 width: 60,
//                 height: 60,
//                 decoration: BoxDecoration(
//                   shape: BoxShape.circle,
//                   gradient: LinearGradient(
//                     colors: [
//                       Theme.of(context).colorScheme.tertiary,
//                       Theme.of(context).colorScheme.secondary,
//                       Theme.of(context).colorScheme.primary,
//                     ],
//                     transform: const GradientRotation(pi / 4),
//                   ),
//                 ),
//                 child: const Icon(CupertinoIcons.add),
//               ),
//             ),
//             body: index == 0 ? MainScreen(state.expenses) : const StatScreen(),
//           );
//         } else {
//           return const Scaffold(
//             body: Center(
//               child: CircularProgressIndicator(),
//             ),
//           );
//         }
//       },
//     );
//   }
// }

// import 'package:expense_repository/expense_repository.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:mad_my_app/screens/add_expense/blocs/create_categorybloc/create_category_bloc.dart';
// import 'package:mad_my_app/screens/add_expense/blocs/create_expense_bloc/create_expense_bloc.dart';
// import 'package:mad_my_app/screens/add_expense/blocs/get_categories_bloc/get_categories_bloc.dart';
// import 'package:mad_my_app/screens/add_expense/views/add_expense.dart';
// import 'package:mad_my_app/screens/home/blocs/get_expenses_bloc/get_expenses_bloc.dart';
// import 'package:mad_my_app/screens/home/views/main_screen.dart';
// import 'package:mad_my_app/screens/stats/stats.dart';
// import 'dart:math';

// class HomeScreen extends StatefulWidget {
//   final String userId; // Add userId as a property

//   const HomeScreen({Key? key, required this.userId}) : super(key: key);

//   @override
//   State<HomeScreen> createState() => _HomeScreenState();
// }

// class _HomeScreenState extends State<HomeScreen> {
//   int index = 0;
//   late Color selectedItem = Colors.blue;
//   Color unselectedItem = Colors.grey;

//   @override
//   Widget build(BuildContext context) {
//     return BlocBuilder<GetExpensesBloc, GetExpensesState>(
//       builder: (context, state) {
//         if (state is GetExpensesSuccess) {
//           return Scaffold(
//             bottomNavigationBar: ClipRRect(
//               borderRadius:
//                   const BorderRadius.vertical(top: Radius.circular(30)),
//               child: BottomNavigationBar(
//                 onTap: (value) {
//                   setState(() {
//                     index = value;
//                   });
//                 },
//                 showSelectedLabels: false,
//                 showUnselectedLabels: false,
//                 elevation: 3,
//                 items: [
//                   BottomNavigationBarItem(
//                     icon: Icon(CupertinoIcons.home,
//                         color: index == 0 ? selectedItem : unselectedItem),
//                     label: 'Home',
//                   ),
//                   BottomNavigationBarItem(
//                     icon: Icon(CupertinoIcons.graph_square_fill,
//                         color: index == 1 ? selectedItem : unselectedItem),
//                     label: 'Stats',
//                   ),
//                 ],
//               ),
//             ),
//             floatingActionButtonLocation:
//                 FloatingActionButtonLocation.centerDocked,
//             floatingActionButton: FloatingActionButton(
//               onPressed: () async {
//                 var newExpense = await Navigator.push(
//                   context,
//                   MaterialPageRoute<Expense>(
//                     builder: (BuildContext context) => MultiBlocProvider(
//                       providers: [
//                         BlocProvider(
//                           create: (context) => CreateCategoryBloc(
//                               FirebaseExpenseRepo(), widget.userId),
//                         ),
//                         BlocProvider(
//                           create: (context) => GetCategoriesBloc(
//                               FirebaseExpenseRepo(), widget.userId),
//                         ),
//                         BlocProvider(
//                           create: (context) => CreateExpenseBloc(
//                               FirebaseExpenseRepo(), widget.userId),
//                         ),
//                       ],
//                       child: const AddExpense(),
//                     ),
//                   ),
//                 );

//                 if (newExpense != null) {
//                   setState(() {
//                     (state as GetExpensesSuccess)
//                         .expenses
//                         .insert(0, newExpense);
//                   });
//                 }
//               },
//               shape: const CircleBorder(),
//               child: Container(
//                 width: 60,
//                 height: 60,
//                 decoration: BoxDecoration(
//                   shape: BoxShape.circle,
//                   gradient: LinearGradient(
//                     colors: [
//                       Theme.of(context).colorScheme.tertiary,
//                       Theme.of(context).colorScheme.secondary,
//                       Theme.of(context).colorScheme.primary,
//                     ],
//                     transform: const GradientRotation(pi / 4),
//                   ),
//                 ),
//                 child: const Icon(CupertinoIcons.add),
//               ),
//             ),
//             body: index == 0
//                 ? MainScreen((state as GetExpensesSuccess).expenses)
//                 : const StatScreen(),
//           );
//         } else {
//           return const Scaffold(
//             body: Center(
//               child: CircularProgressIndicator(),
//             ),
//           );
//         }
//       },
//     );
//   }
// }

// import 'package:expense_repository/expense_repository.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:mad_my_app/screens/add_expense/blocs/create_categorybloc/create_category_bloc.dart';
// import 'package:mad_my_app/screens/add_expense/blocs/get_categories_bloc/get_categories_bloc.dart';
// import 'package:mad_my_app/screens/add_expense/views/add_expense.dart';

// import 'dart:math';
// import 'package:mad_my_app/screens/home/views/main_screen.dart';
// import 'package:mad_my_app/screens/stats/stats.dart';

// class HomeScreen extends StatefulWidget {
//   const HomeScreen({super.key});

//   @override
//   State<HomeScreen> createState() => _HomeScreenState();
// }

// class _HomeScreenState extends State<HomeScreen> {
//   int index = 0;

//   void refreshTransactions() {
//     setState(() {
//       // This triggers a rebuild of the MainScreen
//     });
//   }

//   late Color selectedItem = Colors.blue;
//   Color unselectedItem = Colors.grey;

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         // appBar: AppBar(),
//         bottomNavigationBar: ClipRRect(
//           borderRadius: const BorderRadius.vertical(top: Radius.circular(30)),
//           child: BottomNavigationBar(
//             onTap: (value) {
//               setState(() {
//                 index = value;
//               });
//             },
//             showSelectedLabels: false,
//             showUnselectedLabels: false,
//             // selectedItemColor: Colors.yellow,
//             elevation: 3,
//             items: [
//               BottomNavigationBarItem(
//                   icon: Icon(CupertinoIcons.home,
//                       color: index == 0 ? selectedItem : unselectedItem),
//                   label: 'Home'),
//               BottomNavigationBarItem(
//                   icon: Icon(CupertinoIcons.graph_square_fill,
//                       color: index == 1 ? selectedItem : unselectedItem),
//                   label: 'Stats')
//             ],
//           ),
//         ),
//         floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
//         floatingActionButton: FloatingActionButton(
//           onPressed: () {
//             Navigator.push(
//               context,
//               MaterialPageRoute<void>(
//                 builder: (BuildContext context) => MultiBlocProvider(
//                   providers: [
//                     BlocProvider(
//                       create: (context) =>
//                           CreateCategoryBloc(FirebaseExpenseRepo()),
//                     ),
//                     // BlocProvider(
//                     //   create: (context) =>
//                     //       GetCategoriesBloc(FirebaseExpenseRepo())
//                     //         ..add(GetCategories()),
//                     // ),
//                     // BlocProvider(
//                     //   create: (context) {
//                     //     final bloc = GetCategoriesBloc(FirebaseExpenseRepo());
//                     //     bloc.add(GetCategories());
//                     //     return bloc;
//                     //   },
//                     // ),

//                   ],
//                   child: AddExpenseIncome(
//                     onTransactionAdded:
//                         refreshTransactions, // Call the refresh function
//                   ),
//                 ),
//               ),
//             );
//           },
//           shape: const CircleBorder(),
//           child: Container(
//             width: 60,
//             height: 60,
//             decoration: BoxDecoration(
//                 shape: BoxShape.circle,
//                 gradient: LinearGradient(
//                   colors: [
//                     Theme.of(context).colorScheme.tertiary,
//                     Theme.of(context).colorScheme.secondary,
//                     Theme.of(context).colorScheme.primary
//                   ],
//                   transform: const GradientRotation(pi / 4),
//                 )),
//             child: const Icon(CupertinoIcons.add),
//           ),
//         ),
//         body: index == 0 ? MainScreen() : StatScreen());
//   }
// }

// import 'package:expense_repository/expense_repository.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:mad_my_app/screens/add_expense/blocs/create_categorybloc/create_category_bloc.dart';
// import 'package:mad_my_app/screens/add_expense/blocs/create_expense_bloc/create_expense_bloc.dart';
// import 'package:mad_my_app/screens/add_expense/blocs/get_categories_bloc/get_categories_bloc.dart';
// import 'package:mad_my_app/screens/add_expense/views/add_expense.dart';
// import 'dart:math';
// import 'package:mad_my_app/screens/home/views/main_screen.dart';
// import 'package:mad_my_app/screens/stats/stats.dart';

// class HomeScreen extends StatefulWidget {
//   const HomeScreen({super.key});

//   @override
//   State<HomeScreen> createState() => _HomeScreenState();
// }

// class _HomeScreenState extends State<HomeScreen> {
//   int index = 0;
//   List<Expense> expenses = []; // Initialize your expenses list

//   void refreshTransactions() {
//     setState(() {
//       // This triggers a rebuild of the MainScreen
//     });
//   }

//   late Color selectedItem = Colors.blue;
//   Color unselectedItem = Colors.grey;

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       // appBar: AppBar(),
//       bottomNavigationBar: ClipRRect(
//         borderRadius: const BorderRadius.vertical(top: Radius.circular(30)),
//         child: BottomNavigationBar(
//           onTap: (value) {
//             setState(() {
//               index = value;
//             });
//           },
//           showSelectedLabels: false,
//           showUnselectedLabels: false,
//           // selectedItemColor: Colors.yellow,
//           elevation: 3,
//           items: [
//             BottomNavigationBarItem(
//               icon: Icon(CupertinoIcons.home,
//                   color: index == 0 ? selectedItem : unselectedItem),
//               label: 'Home',
//             ),
//             BottomNavigationBarItem(
//               icon: Icon(CupertinoIcons.graph_square_fill,
//                   color: index == 1 ? selectedItem : unselectedItem),
//               label: 'Stats',
//             ),
//           ],
//         ),
//       ),
//       floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
//       floatingActionButton: FloatingActionButton(
//         onPressed: () {
//           // Navigator.push(
//           //   context,
//           //   MaterialPageRoute<void>(
//           //     builder: (BuildContext context) => MultiBlocProvider(
//           //       providers: [
//           //         BlocProvider(
//           //           create: (context) =>
//           //               CreateCategoryBloc(FirebaseExpenseRepo()),
//           //         ),
//           //       ],
//           //       child: AddExpenseIncome(
//           //         onTransactionAdded:
//           //             refreshTransactions, // Call the refresh function
//           //       ),
//           //     ),
//           //   ),
//           // );
//           Navigator.push(
//       context,
//       MaterialPageRoute<void>(
//         builder: (BuildContext context) => MultiBlocProvider(
//           providers: [
//             BlocProvider(
//               create: (context) => CreateCategoryBloc(FirebaseExpenseRepo()),
//             ),
//             BlocProvider(
//               create: (context) {
//                 final bloc = GetCategoriesBloc(FirebaseExpenseRepo());
//                 bloc.add(GetCategories()); // Trigger the event to fetch categories
//                 return bloc;
//               },
//             ),
//           ],
//           child: AddExpenseIncome(
//             onTransactionAdded: refreshTransactions, // Call the refresh function
//           ),
//         ),
//       ),
//     );
//         },
//         shape: const CircleBorder(),
//         child: Container(
//           width: 60,
//           height: 60,
//           decoration: BoxDecoration(
//             shape: BoxShape.circle,
//             gradient: LinearGradient(
//               colors: [
//                 Theme.of(context).colorScheme.tertiary,
//                 Theme.of(context).colorScheme.secondary,
//                 Theme.of(context).colorScheme.primary,
//               ],
//               transform: const GradientRotation(pi / 4),
//             ),
//           ),
//           child: const Icon(CupertinoIcons.add),
//         ),
//       ),
//       body: index == 0 ? MainScreen(expenses: expenses) : StatScreen(),
//     );
//   }
// }

// import 'package:expense_repository/expense_repository.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:mad_my_app/screens/add_expense/blocs/create_categorybloc/create_category_bloc.dart';
// import 'package:mad_my_app/screens/add_expense/blocs/create_expense_bloc/create_expense_bloc.dart';
// import 'package:mad_my_app/screens/add_expense/blocs/get_categories_bloc/get_categories_bloc.dart';
// import 'package:mad_my_app/screens/add_expense/views/add_expense.dart';
// import 'dart:math';
// import 'package:mad_my_app/screens/home/views/main_screen.dart';
// import 'package:mad_my_app/screens/stats/stats.dart';

// class HomeScreen extends StatefulWidget {
//   const HomeScreen({super.key});

//   @override
//   State<HomeScreen> createState() => _HomeScreenState();
// }

// class _HomeScreenState extends State<HomeScreen> {
//   int index = 0;
//   List<Expense> expenses = []; // Initialize your expenses list

//   void refreshTransactions() {
//     setState(() {
//       // This triggers a rebuild of the MainScreen
//     });
//   }

//   late Color selectedItem = Colors.blue;
//   Color unselectedItem = Colors.grey;

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       bottomNavigationBar: ClipRRect(
//         borderRadius: const BorderRadius.vertical(top: Radius.circular(30)),
//         child: BottomNavigationBar(
//           onTap: (value) {
//             setState(() {
//               index = value;
//             });
//           },
//           showSelectedLabels: false,
//           showUnselectedLabels: false,
//           elevation: 3,
//           items: [
//             BottomNavigationBarItem(
//               icon: Icon(CupertinoIcons.home,
//                   color: index == 0 ? selectedItem : unselectedItem),
//               label: 'Home',
//             ),
//             BottomNavigationBarItem(
//               icon: Icon(CupertinoIcons.graph_square_fill,
//                   color: index == 1 ? selectedItem : unselectedItem),
//               label: 'Stats',
//             ),
//           ],
//         ),
//       ),
//       floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
//       floatingActionButton: FloatingActionButton(
//         onPressed: () {
//           Navigator.push(
//             context,
//             MaterialPageRoute<void>(
//               builder: (BuildContext context) => MultiBlocProvider(
//                 providers: [
//                   BlocProvider(
//                     create: (context) =>
//                         CreateCategoryBloc(FirebaseExpenseRepo()),
//                   ),
//                   BlocProvider(
//                     create: (context) =>
//                         GetCategoriesBloc(FirebaseExpenseRepo()),
//                   ),
//                 ],
//                 child: AddExpenseIncome(
//                   onTransactionAdded: () {
//                     // Trigger the event to fetch categories when returning to HomeScreen
//                     BlocProvider.of<GetCategoriesBloc>(context)
//                         .add(FetchCategories());
//                     refreshTransactions(); // Call the refresh function
//                   },
//                 ),
//               ),
//             ),
//           );
//         },
//         shape: const CircleBorder(),
//         child: Container(
//           width: 60,
//           height: 60,
//           decoration: BoxDecoration(
//             shape: BoxShape.circle,
//             gradient: LinearGradient(
//               colors: [
//                 Theme.of(context).colorScheme.tertiary,
//                 Theme.of(context).colorScheme.secondary,
//                 Theme.of(context).colorScheme.primary,
//               ],
//               transform: const GradientRotation(pi / 4),
//             ),
//           ),
//           child: const Icon(CupertinoIcons.add),
//         ),
//       ),
//       body: index == 0 ? MainScreen(expenses: expenses) : StatScreen(),
//     );
//   }
// }

import 'dart:math';

import 'package:expense_repository/expense_repository.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mad_my_app/screens/add_expense/blocs/create_categorybloc/create_category_bloc.dart';
import 'package:mad_my_app/screens/add_expense/blocs/get_categories_bloc/get_categories_bloc.dart';
import 'package:mad_my_app/screens/add_expense/views/add_expense.dart';
import 'package:mad_my_app/screens/home/views/main_screen.dart';
import 'package:mad_my_app/screens/stats/stats.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int index = 0;
  List<Expense> expenses = [];

  late String? userId; // Declare a variable to hold the user ID

  @override
  void initState() {
    super.initState();
    userId = FirebaseAuth.instance.currentUser?.uid; // Get the current user ID
    fetchExpenses(); // Fetch expenses when the screen initializes
  }

  // Future<void> fetchExpenses() async {
  //   if (userId != null) {
  //     // Fetch expenses from Firestore (update your logic as needed)
  //     final expenseSnapshot = await FirebaseFirestore.instance
  //         .collection('users')
  //         .doc(userId)
  //         .collection('expenses')
  //         .get();

  //     setState(() {
  //       expenses = expenseSnapshot.docs
  //           .map((doc) =>
  //               Expense.fromEntity(doc)) // Adjust as necessary
  //           .toList();
  //     });
  //   }
  // }
  Future<void> fetchExpenses() async {
    if (userId != null) {
      // Fetch expenses from Firestore
      // final expenseSnapshot = await FirebaseFirestore.instance
      //     .collection('users')
      //     .doc(userId)
      //     .collection('expenses')
      //     .get();

      // setState(() {
      //   expenses = expenseSnapshot.docs
      //       .map((doc) => Expense.fromDocument(
      //           doc)) // Use fromDocument to create Expense instances
      //       .toList();
      // });
      final expenseSnapshot = await FirebaseFirestore.instance
          .collection('users')
          .doc(userId)
          .collection('expenses')
          .get();

      setState(() {
        expenses = expenseSnapshot.docs
            .map((doc) =>
                Expense.fromDocument(doc)) // Use the correct method here
            .toList();
      });
    }
  }

  void refreshTransactions() {
    fetchExpenses(); // Fetch expenses again to refresh the list
  }

  late Color selectedItem = Colors.blue;
  Color unselectedItem = Colors.grey;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: ClipRRect(
        borderRadius: const BorderRadius.vertical(top: Radius.circular(30)),
        child: BottomNavigationBar(
          onTap: (value) {
            setState(() {
              index = value;
            });
          },
          showSelectedLabels: false,
          showUnselectedLabels: false,
          elevation: 3,
          items: [
            BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.home,
                  color: index == 0 ? selectedItem : unselectedItem),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.graph_square_fill,
                  color: index == 1 ? selectedItem : unselectedItem),
              label: 'Stats',
            ),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute<void>(
              builder: (BuildContext context) => MultiBlocProvider(
                providers: [
                  BlocProvider(
                    create: (context) =>
                        CreateCategoryBloc(FirebaseExpenseRepo()),
                  ),
                  BlocProvider(
                    create: (context) =>
                        GetCategoriesBloc(FirebaseExpenseRepo()),
                  ),
                ],
                child: AddExpenseIncome(
                  onTransactionAdded: () {
                    // Trigger the event to fetch categories when returning to HomeScreen
                    BlocProvider.of<GetCategoriesBloc>(context)
                        .add(FetchCategories());
                    refreshTransactions(); // Call the refresh function
                  },
                ),
              ),
            ),
          );
        },
        shape: const CircleBorder(),
        child: Container(
          width: 60,
          height: 60,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            gradient: LinearGradient(
              colors: [
                Theme.of(context).colorScheme.tertiary,
                Theme.of(context).colorScheme.secondary,
                Theme.of(context).colorScheme.primary,
              ],
              transform: const GradientRotation(pi / 4),
            ),
          ),
          child: const Icon(CupertinoIcons.add),
        ),
      ),
      body: index == 0
          ? MainScreen(userId: userId!) // Pass userId to MainScreen
          : StatScreen(),
    );
  }
}


// import 'package:expense_repository/expense_repository.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:mad_my_app/screens/add_expense/blocs/create_categorybloc/create_category_bloc.dart';
// import 'package:mad_my_app/screens/add_expense/blocs/create_expense_bloc/create_expense_bloc.dart';
// import 'package:mad_my_app/screens/add_expense/blocs/get_categories_bloc/get_categories_bloc.dart';
// import 'package:mad_my_app/screens/add_expense/views/add_expense.dart';
// import 'dart:math';
// import 'package:mad_my_app/screens/home/blocs/get_expenses_bloc/get_expenses_bloc.dart';
// import 'package:mad_my_app/screens/home/blocs/get_expenses_bloc/get_expenses_state.dart';
// import 'package:mad_my_app/screens/home/views/main_screen.dart';
// import 'package:mad_my_app/screens/stats/stats.dart';

// class HomeScreen extends StatefulWidget {
//   const HomeScreen({super.key});

//   @override
//   State<HomeScreen> createState() => _HomeScreenState();
// }

// class _HomeScreenState extends State<HomeScreen> {
//   int index = 0;
//   late Color selectedItem = Colors.blue;
//   Color unselectedItem = Colors.grey;

//   void refreshTransactions() {
//     setState(() {
//       // This triggers a rebuild of the MainScreen
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return BlocBuilder<GetExpensesBloc, GetExpensesState>(
//       builder: (context, state) {
//         if (state is GetExpensesSuccess) {
//           return Scaffold(
//             bottomNavigationBar: ClipRRect(
//               borderRadius: const BorderRadius.vertical(top: Radius.circular(30)),
//               child: BottomNavigationBar(
//                 onTap: (value) {
//                   setState(() {
//                     index = value;
//                   });
//                 },
//                 showSelectedLabels: false,
//                 showUnselectedLabels: false,
//                 elevation: 3,
//                 items: [
//                   BottomNavigationBarItem(
//                     icon: Icon(
//                       CupertinoIcons.home,
//                       color: index == 0 ? selectedItem : unselectedItem,
//                     ),
//                     label: 'Home',
//                   ),
//                   BottomNavigationBarItem(
//                     icon: Icon(
//                       CupertinoIcons.graph_square_fill,
//                       color: index == 1 ? selectedItem : unselectedItem,
//                     ),
//                     label: 'Stats',
//                   ),
//                 ],
//               ),
//             ),
//             floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
//             floatingActionButton: FloatingActionButton(
//               onPressed: () {
//                 Navigator.push(
//       context,
//       MaterialPageRoute<void>(
//         builder: (BuildContext context) => MultiBlocProvider(
//           providers: [
//             BlocProvider(
//               create: (context) => CreateCategoryBloc(FirebaseExpenseRepo()),
//             ),
//             BlocProvider(
//               create: (context) => GetCategoriesBloc(FirebaseExpenseRepo()),
//             ),
//             BlocProvider(
//               create: (context) => CreateExpenseBloc(FirebaseExpenseRepo()),
//             ),
//           ],
//           child: AddExpenseIncome(
//             onTransactionAdded: refreshTransactions,
//           ),
//         ),
//       ),
//     ).then((_) {
//       // After returning from AddExpenseIncome, you can trigger any updates if needed
//       BlocProvider.of<GetCategoriesBloc>(context).add(GetCategories());
//     });
//               },
//               shape: const CircleBorder(),
//               child: Container(
//                 width: 60,
//                 height: 60,
//                 decoration: BoxDecoration(
//                   shape: BoxShape.circle,
//                   gradient: LinearGradient(
//                     colors: [
//                       Theme.of(context).colorScheme.tertiary,
//                       Theme.of(context).colorScheme.secondary,
//                       Theme.of(context).colorScheme.primary,
//                     ],
//                     transform: const GradientRotation(pi / 4),
//                   ),
//                 ),
//                 child: const Icon(CupertinoIcons.add),
//               ),
//             ),
//             body: index == 0
//                 ? MainScreen(expenses: state.expenses)
//                 : const StatScreen(),
//           );
//         } else {
//           return const Scaffold(
//             body: Center(
//               child: CircularProgressIndicator(),
//             ),
//           );
//         }
//       },
//     );
//   }
// }

































// import 'package:expense_repository/expense_repository.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:mad_my_app/screens/add_expense/blocs/create_categorybloc/create_category_bloc.dart';
// import 'package:mad_my_app/screens/add_expense/blocs/get_categories_bloc/get_categories_bloc.dart';
// import 'package:mad_my_app/screens/add_expense/views/add_expense.dart';
// import 'dart:math';
// import 'package:mad_my_app/screens/home/blocs/get_expenses_bloc/get_expenses_bloc.dart';
// import 'package:mad_my_app/screens/home/blocs/get_expenses_bloc/get_expenses_state.dart';
// import 'package:mad_my_app/screens/home/views/main_screen.dart';
// import 'package:mad_my_app/screens/stats/stats.dart';

// class HomeScreen extends StatefulWidget {
//   const HomeScreen({super.key});

//   @override
//   State<HomeScreen> createState() => _HomeScreenState();
// }

// class _HomeScreenState extends State<HomeScreen> {
//   int index = 0;

//   void refreshTransactions() {
//     setState(() {
//       // This triggers a rebuild of the MainScreen
//     });
//   }

//   late Color selectedItem = Colors.blue;
//   Color unselectedItem = Colors.grey;

//   @override
//   Widget build(BuildContext context) {
//     return BlocBuilder<GetExpensesBloc, GetExpensesState>(
//       builder: (context, state) {
//         if (state is GetExpensesSuccess) {
//           return Scaffold(
//             bottomNavigationBar: ClipRRect(
//               borderRadius: const BorderRadius.vertical(top: Radius.circular(30)),
//               child: BottomNavigationBar(
//                 onTap: (value) {
//                   setState(() {
//                     index = value;
//                   });
//                 },
//                 showSelectedLabels: false,
//                 showUnselectedLabels: false,
//                 elevation: 3,
//                 items: [
//                   BottomNavigationBarItem(
//                       icon: Icon(CupertinoIcons.home,
//                           color: index == 0 ? selectedItem : unselectedItem),
//                       label: 'Home'),
//                   BottomNavigationBarItem(
//                       icon: Icon(CupertinoIcons.graph_square_fill,
//                           color: index == 1 ? selectedItem : unselectedItem),
//                       label: 'Stats')
//                 ],
//               ),
//             ),
//             floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
//             floatingActionButton: FloatingActionButton(
//               onPressed: () {
//                 Navigator.push(
//                   context,
//                   MaterialPageRoute<void>(
//                     builder: (BuildContext context) => MultiBlocProvider(
//                       providers: [
//                         BlocProvider(
//                           create: (context) =>
//                               CreateCategoryBloc(FirebaseExpenseRepo()),
//                         ),
//                         BlocProvider(
//                           create: (context) =>
//                               GetCategoriesBloc(FirebaseExpenseRepo())..add(GetCategories()),
//                         ),
//                       ],
//                       child: AddExpenseIncome(
//                         onTransactionAdded: refreshTransactions,
//                       ),
//                     ),
//                   ),
//                 );
//               },
//               shape: const CircleBorder(),
//               child: Container(
//                 width: 60,
//                 height: 60,
//                 decoration: BoxDecoration(
//                     shape: BoxShape.circle,
//                     gradient: LinearGradient(
//                       colors: [
//                         Theme.of(context).colorScheme.tertiary,
//                         Theme.of(context).colorScheme.secondary,
//                         Theme.of(context).colorScheme.primary
//                       ],
//                       transform: const GradientRotation(pi / 4),
//                     )),
//                 child: const Icon(CupertinoIcons.add),
//               ),
//             ),
//             body: index == 0
//                 ? MainScreen(expenses: state.expenses)
//                 : const StatScreen(),
//           );
//         } else {
//           return const Scaffold(
//             body: Center(
//               child: CircularProgressIndicator(),
//             ),
//           );
//         }
//       },
//     );
//   }
// }
