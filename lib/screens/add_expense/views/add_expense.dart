// import 'package:expense_repository/expense_repository.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:font_awesome_flutter/font_awesome_flutter.dart';
// import 'package:intl/intl.dart';
// import 'package:mad_my_app/screens/add_expense/blocs/create_expense_bloc/create_expense_bloc.dart';
// import 'package:mad_my_app/screens/add_expense/blocs/create_expense_bloc/create_expense_event.dart';
// import 'package:mad_my_app/screens/add_expense/blocs/create_expense_bloc/create_expense_state.dart';
// import 'package:mad_my_app/screens/add_expense/blocs/get_categories_bloc/get_categories_bloc.dart';
// import 'package:mad_my_app/screens/add_expense/views/category_creation.dart';
// import 'package:uuid/uuid.dart';

// class AddExpense extends StatefulWidget {
//   const AddExpense({super.key});

//   @override
//   State<AddExpense> createState() => _AddExpenseState();
// }

// class _AddExpenseState extends State<AddExpense> {
//   TextEditingController expenseController = TextEditingController();
//   TextEditingController categoryController = TextEditingController();
//   TextEditingController dateController = TextEditingController();
//   //DateTime selectDate = DateTime.now();
//   late Expense expense;

//   bool isLoading = false;

//   Color categoryColor = Colors.blue; // Default color
//   String iconSelected = '';

//   @override
//   void initState() {
//     dateController.text = DateFormat('dd/MM/yyyy').format(DateTime.now());
//     expense = Expense.empty;
//     expense.expenseId = const Uuid().v1();
//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return BlocListener<CreateExpenseBloc, CreateExpenseState>(
//       listener: (context, state) {
//         if (state is CreateExpenseSuccess) {
//           Navigator.pop(context, expense);
//         } else if (state is CreateExpenseLoading) {
//           setState(() {
//             isLoading = true;
//           });
//         }
//       },
//       child: GestureDetector(
//         onTap: () => FocusScope.of(context).unfocus(),
//         child: Scaffold(
//           backgroundColor: Theme.of(context).colorScheme.background,
//           appBar: AppBar(
//             backgroundColor: Theme.of(context).colorScheme.background,
//           ),
//           body: BlocBuilder<GetCategoriesBloc, GetCategoriesState>(
//             builder: (context, state) {
//               if (state is GetCategoriesSuccess) {
//                 return Padding(
//                   padding: const EdgeInsets.all(16.0),
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.center,
//                     children: [
//                       const Text(
//                         "Add Expenses",
//                         style: TextStyle(
//                             fontSize: 22, fontWeight: FontWeight.w500),
//                       ),
//                       const SizedBox(height: 16),
//                       SizedBox(
//                         width: MediaQuery.of(context).size.width * 0.7,
//                         child: TextFormField(
//                           controller: expenseController,
//                           textAlignVertical: TextAlignVertical.center,
//                           decoration: InputDecoration(
//                             filled: true,
//                             fillColor: Colors.white,
//                             prefixIcon: const Icon(
//                               FontAwesomeIcons.dollarSign,
//                               size: 16,
//                               color: Colors.grey,
//                             ),
//                             border: OutlineInputBorder(
//                                 borderRadius: BorderRadius.circular(30),
//                                 borderSide: BorderSide.none),
//                           ),
//                         ),
//                       ),
//                       const SizedBox(height: 16),
//                       TextFormField(
//                         controller: categoryController,
//                         textAlignVertical: TextAlignVertical.center,
//                         readOnly: true,
//                         onTap: () {},
//                         decoration: InputDecoration(
//                           filled: true,
//                           fillColor: expense.category == Category.empty
//                               ? Colors.white
//                               : Color(expense.category.color),
//                           prefixIcon: expense.category == Category.empty
//                               ? const Icon(
//                                   FontAwesomeIcons.list,
//                                   size: 16,
//                                   color: Colors.grey,
//                                 )
//                               : Image.asset(
//                                   'assets/${expense.category.icon}.png',
//                                   scale: 2,
//                                 ),
//                           suffixIcon: IconButton(
//                               onPressed: () async {
//                                 var newCategory =
//                                     await getCategoryCreation(context);

//                                 setState(() {
//                                   state.categories.insert(0, newCategory);
//                                 });
//                               },
//                               icon: const Icon(
//                                 FontAwesomeIcons.plus,
//                                 size: 16,
//                                 color: Colors.grey,
//                               )),
//                           hintText: 'Category',
//                           border: const OutlineInputBorder(
//                               borderRadius: BorderRadius.vertical(
//                                   top: Radius.circular(12)),
//                               borderSide: BorderSide.none),
//                         ),
//                       ),
//                       Container(
//                         height: 200,
//                         width: MediaQuery.of(context).size.width,
//                         decoration: const BoxDecoration(
//                           color: Colors.white,
//                           borderRadius: BorderRadius.vertical(
//                               bottom: Radius.circular(12)),
//                         ),
//                         child: Padding(
//                             padding: const EdgeInsets.all(8.0),
//                             child: ListView.builder(
//                                 itemCount: state.categories.length,
//                                 itemBuilder: (context, int i) {
//                                   return Card(
//                                       child: ListTile(
//                                     onTap: () {
//                                       setState(() {
//                                         expense.category = state.categories[i];
//                                         categoryController.text =
//                                             expense.category.name;
//                                       });
//                                     },
//                                     leading: Image.asset(
//                                       'assets/${state.categories[i].icon}.png',
//                                       scale: 2,
//                                     ),
//                                     title: Text(state.categories[i].name),
//                                     tileColor: Color(state.categories[i].color),
//                                     shape: RoundedRectangleBorder(
//                                         borderRadius: BorderRadius.circular(8)),
//                                   ));
//                                 })),
//                       ),
//                       const SizedBox(height: 32),
//                       TextFormField(
//                         controller: dateController,
//                         textAlignVertical: TextAlignVertical.center,
//                         readOnly: true,
//                         onTap: () async {
//                           DateTime? newDate = await showDatePicker(
//                               context: context,
//                               initialDate: expense.date,
//                               firstDate: DateTime(2000),
//                               lastDate: DateTime(2100));

//                           if (newDate != null) {
//                             setState(() {
//                               dateController.text =
//                                   DateFormat('dd/MM/yyyy').format(newDate);
//                               expense.date = newDate;
//                             });
//                           }
//                         },
//                         decoration: InputDecoration(
//                           filled: true,
//                           fillColor: Colors.white,
//                           prefixIcon: const Icon(
//                             FontAwesomeIcons.clock,
//                             size: 16,
//                             color: Colors.grey,
//                           ),
//                           hintText: 'Date',
//                           border: OutlineInputBorder(
//                               borderRadius: BorderRadius.circular(12),
//                               borderSide: BorderSide.none),
//                         ),
//                       ),
//                       const SizedBox(height: 32),
//                       SizedBox(
//                         width: double.infinity,
//                         height: kToolbarHeight,
//                         child: isLoading
//                             ? const Center(child: CircularProgressIndicator())
//                             : TextButton(
//                                 onPressed: () {
//                                   setState(() {
//                                     expense.amount =
//                                         int.parse(expenseController.text);
//                                   });

//                                   context
//                                       .read<CreateExpenseBloc>()
//                                       .add(CreateExpense(expense));
//                                 },
//                                 style: TextButton.styleFrom(
//                                     backgroundColor: Colors.black,
//                                     shape: RoundedRectangleBorder(
//                                         borderRadius:
//                                             BorderRadius.circular(12))),
//                                 child: const Text(
//                                   'Save',
//                                   style: TextStyle(
//                                       fontSize: 22, color: Colors.white),
//                                 )),
//                       )
//                     ],
//                   ),
//                 );
//               } else {
//                 return const Center(
//                   child: CircularProgressIndicator(),
//                 );
//               }
//             },
//           ),
//         ),
//       ),
//     );
//   }
// }

// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:expense_repository/expense_repository.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:font_awesome_flutter/font_awesome_flutter.dart';
// import 'package:intl/intl.dart';
// import 'package:mad_my_app/screens/add_expense/blocs/create_expense_bloc/create_expense_bloc.dart';
// import 'package:mad_my_app/screens/add_expense/blocs/get_categories_bloc/get_categories_bloc.dart';
// import 'package:mad_my_app/screens/add_expense/views/category_creation.dart';
// import 'package:mad_my_app/screens/home/blocs/get_expenses_bloc/get_expenses_event.dart';
// import 'package:mad_my_app/screens/home/views/main_screen.dart';

// // class AddExpenseIncome extends StatefulWidget {
// //   // const AddExpenseIncome({super.key});
// //   final Function onTransactionAdded; // Callback for transaction added

// //   const AddExpenseIncome({super.key, required this.onTransactionAdded});

// //   @override
// //   State<AddExpenseIncome> createState() => _AddExpenseIncomeState();
// // }

// class AddExpenseIncome extends StatefulWidget {
//   final Function onTransactionAdded;

//   const AddExpenseIncome({Key? key, required this.onTransactionAdded})
//       : super(key: key);

//   @override
//   State<AddExpenseIncome> createState() => _AddExpenseIncomeState();
// }

// class _AddExpenseIncomeState extends State<AddExpenseIncome> {
//   TextEditingController amountController = TextEditingController();
//   TextEditingController categoryController = TextEditingController();
//   TextEditingController dateController = TextEditingController();
//   late Expense expense;
//   late Income income;
//   bool isExpense = true; // Toggle flag

//   @override
//   void initState() {
//     super.initState();
//     // Fetch categories when the widget initializes
//     BlocProvider.of<GetCategoriesBloc>(context).add(FetchCategories());
//     dateController.text = DateFormat('dd/MM/yyyy').format(DateTime.now());
//     expense = Expense.empty;
//     income = Income.empty;
//   }

//   Future<void> updateTotalBalance(
//       String userId, double amount, bool isIncome) async {
//     final balanceDoc = FirebaseFirestore.instance
//         .collection('users')
//         .doc(userId)
//         .collection('balance')
//         .doc('balance');

//     final balanceSnapshot = await balanceDoc.get();

//     if (balanceSnapshot.exists) {
//       double totalBalance = balanceSnapshot.data()?['totalBalance'] ?? 0.0;
//       if (isIncome) {
//         totalBalance += amount;
//       } else {
//         totalBalance -= amount;
//       }
//       await balanceDoc.update({'totalBalance': totalBalance});
//     }
//   }

//   // void saveData() async {
//   //   final userId = FirebaseAuth.instance.currentUser?.uid;

//   //   if (userId == null) {
//   //     ScaffoldMessenger.of(context).showSnackBar(
//   //       SnackBar(content: Text('User not logged in.')),
//   //     );
//   //     return;
//   //   }

//   //   final userExpenseCollection = FirebaseFirestore.instance
//   //       .collection('users')
//   //       .doc(userId)
//   //       .collection('expenses');
//   //   final userIncomeCollection = FirebaseFirestore.instance
//   //       .collection('users')
//   //       .doc(userId)
//   //       .collection('incomes');

//   //   double amount = double.parse(amountController.text);

//   //   if (isExpense) {
//   //     expense.amount = int.parse(amountController.text);
//   //     await userExpenseCollection.add(expense.toEntity().toDocument());
//   //   } else {
//   //     income.amount = int.parse(amountController.text);
//   //     await userIncomeCollection.add(income.toEntity().toDocument());
//   //   }

//   //   // Update total balance
//   //   await updateTotalBalance(userId, amount, !isExpense);

//   //   // Navigate to MainScreen and fetch the transactions
//   //   Navigator.of(context).pushReplacement(MaterialPageRoute(
//   //     builder: (context) =>
//   //         MainScreen(userId: userId), // Pass userId to MainScreen
//   //   ));
//   // }
//   // void saveData() async {
//   //   final userId = FirebaseAuth.instance.currentUser?.uid;

//   //   if (userId == null) {
//   //     ScaffoldMessenger.of(context).showSnackBar(
//   //       SnackBar(content: Text('User not logged in.')),
//   //     );
//   //     return;
//   //   }

//   //   final userExpenseCollection = FirebaseFirestore.instance
//   //       .collection('users')
//   //       .doc(userId)
//   //       .collection('expenses');
//   //   final userIncomeCollection = FirebaseFirestore.instance
//   //       .collection('users')
//   //       .doc(userId)
//   //       .collection('incomes');

//   //   double amount = double.parse(amountController.text);

//   //   if (isExpense) {
//   //     expense.amount = int.parse(amountController.text);
//   //     await userExpenseCollection.add(expense.toEntity().toDocument());
//   //   } else {
//   //     income.amount = int.parse(amountController.text);
//   //     await userIncomeCollection.add(income.toEntity().toDocument());
//   //   }

//   //   // Update total balance
//   //   await updateTotalBalance(userId, amount, !isExpense);

//   //   // Navigate to MainScreen and fetch the transactions
//   //   Navigator.of(context).pushAndRemoveUntil(
//   //     MaterialPageRoute(builder: (context) => MainScreen(userId: userId)),
//   //     (Route<dynamic> route) => false,
//   //   );
//   // }







//   void saveData() async {
//   final userId = FirebaseAuth.instance.currentUser?.uid;

//   if (userId == null) {
//     ScaffoldMessenger.of(context).showSnackBar(
//       SnackBar(content: Text('User not logged in.')),
//     );
//     return;
//   }

//   final userExpenseCollection = FirebaseFirestore.instance
//       .collection('users')
//       .doc(userId)
//       .collection('expenses');
//   final userIncomeCollection = FirebaseFirestore.instance
//       .collection('users')
//       .doc(userId)
//       .collection('incomes');

//   double amount = double.parse(amountController.text);

//   if (isExpense) {
//     expense.amount = int.parse(amountController.text);
//     await userExpenseCollection.add(expense.toEntity().toDocument());
//   } else {
//     income.amount = int.parse(amountController.text);
//     await userIncomeCollection.add(income.toEntity().toDocument());
//   }

//   // Update total balance
//   await updateTotalBalance(userId, amount, !isExpense);

//   // Navigate back to the parent screen that manages all necessary components
//   Navigator.of(context).pop(); // Close the current screen (AddExpenseIncome)
// }

//   @override
//   Widget build(BuildContext context) {
//     return BlocBuilder<GetCategoriesBloc, GetCategoriesState>(
//       builder: (context, state) {
//         return GestureDetector(
//           onTap: () => FocusScope.of(context).unfocus(),
//           child: Scaffold(
//             backgroundColor: Theme.of(context).colorScheme.background,
//             appBar: AppBar(
//               backgroundColor: Theme.of(context).colorScheme.background,
//               actions: [
//                 Switch(
//                   value: isExpense,
//                   onChanged: (value) {
//                     setState(() {
//                       isExpense = value;
//                     });
//                   },
//                   activeColor: Colors.red,
//                   inactiveThumbColor: Colors.green,
//                   inactiveTrackColor: Colors.green[200],
//                 )
//               ],
//             ),
//             body: BlocBuilder<GetCategoriesBloc, GetCategoriesState>(
//               builder: (context, state) {
//                 if (state is GetCategoriesSuccess) {
//                   return Padding(
//                     padding: const EdgeInsets.all(16.0),
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.center,
//                       children: [
//                         Text(
//                           isExpense ? "Add Expense" : "Add Income",
//                           style: const TextStyle(
//                               fontSize: 22, fontWeight: FontWeight.w500),
//                         ),
//                         const SizedBox(height: 16),
//                         SizedBox(
//                           width: MediaQuery.of(context).size.width * 0.7,
//                           child: TextFormField(
//                             controller: amountController,
//                             textAlignVertical: TextAlignVertical.center,
//                             decoration: InputDecoration(
//                               filled: true,
//                               fillColor: Colors.white,
//                               prefixIcon: const Icon(
//                                 FontAwesomeIcons.dollarSign,
//                                 size: 16,
//                                 color: Colors.grey,
//                               ),
//                               border: OutlineInputBorder(
//                                   borderRadius: BorderRadius.circular(30),
//                                   borderSide: BorderSide.none),
//                             ),
//                           ),
//                         ),
//                         const SizedBox(height: 16),
//                         TextFormField(
//                           controller: categoryController,
//                           textAlignVertical: TextAlignVertical.center,
//                           readOnly: true,
//                           onTap: () {},
//                           decoration: InputDecoration(
//                             filled: true,
//                             fillColor: (isExpense
//                                         ? expense.category
//                                         : income.category) ==
//                                     Category.empty
//                                 ? Colors.white
//                                 : Color((isExpense
//                                         ? expense.category
//                                         : income.category)
//                                     .color),
//                             prefixIcon: (isExpense
//                                         ? expense.category
//                                         : income.category) ==
//                                     Category.empty
//                                 ? const Icon(
//                                     FontAwesomeIcons.list,
//                                     size: 16,
//                                     color: Colors.grey,
//                                   )
//                                 : Image.asset(
//                                     'assets/${(isExpense ? expense.category : income.category).icon}.png',
//                                     scale: 2,
//                                   ),
//                             suffixIcon: IconButton(
//                                 onPressed: () async {
//                                   var newCategory =
//                                       await getCategoryCreation(context);

//                                   setState(() {
//                                     state.categories.insert(0, newCategory);
//                                   });
//                                 },
//                                 icon: const Icon(
//                                   FontAwesomeIcons.plus,
//                                   size: 16,
//                                   color: Colors.grey,
//                                 )),
//                             hintText: 'Category',
//                             border: const OutlineInputBorder(
//                                 borderRadius: BorderRadius.vertical(
//                                     top: Radius.circular(12)),
//                                 borderSide: BorderSide.none),
//                           ),
//                         ),
//                         Container(
//                           height: 200,
//                           width: MediaQuery.of(context).size.width,
//                           decoration: const BoxDecoration(
//                             color: Colors.white,
//                             // borderRadius:
//                             //     BorderRadius.circular(12),
//                           ),
//                           child: Padding(
//                               padding: const EdgeInsets.all(8.0),
//                               child: ListView.builder(
//                                   itemCount: state.categories.length,
//                                   itemBuilder: (context, int i) {
//                                     return Card(
//                                         child: ListTile(
//                                       onTap: () {
//                                         setState(() {
//                                           if (isExpense) {
//                                             expense.category =
//                                                 state.categories[i];
//                                             categoryController.text =
//                                                 expense.category.name;
//                                           } else {
//                                             income.category =
//                                                 state.categories[i];
//                                             categoryController.text =
//                                                 income.category.name;
//                                           }
//                                         });
//                                       },
//                                       // leading: Image.asset(
//                                       //   'assets/${state.categories[i].icon}.png',
//                                       //   scale: 2,
//                                       // ),
//                                       title: Text(state.categories[i].name),
//                                       tileColor:
//                                           Color(state.categories[i].color),
//                                       shape: RoundedRectangleBorder(
//                                           borderRadius:
//                                               BorderRadius.circular(8)),
//                                     ));
//                                   })),
//                         ),
//                         const SizedBox(height: 32),
//                         TextFormField(
//                           controller: dateController,
//                           textAlignVertical: TextAlignVertical.center,
//                           readOnly: true,
//                           onTap: () async {
//                             DateTime? newDate = await showDatePicker(
//                               context: context,
//                               initialDate: isExpense
//                                   ? expense.date.toDate()
//                                   : income.date.toDate(),
//                               firstDate: DateTime.now(),
//                               lastDate:
//                                   DateTime.now().add(const Duration(days: 365)),
//                             );

//                             if (newDate != null) {
//                               setState(() {
//                                 dateController.text =
//                                     DateFormat('dd/MM/yyyy').format(newDate);
//                                 if (isExpense) {
//                                   expense.date = Timestamp.fromDate(
//                                       newDate); // Set Timestamp
//                                 } else {
//                                   income.date = Timestamp.fromDate(
//                                       newDate); // Set Timestamp
//                                 }
//                               });
//                             }
//                           },
//                           decoration: InputDecoration(
//                             filled: true,
//                             fillColor: Colors.white,
//                             prefixIcon: const Icon(
//                               FontAwesomeIcons.clock,
//                               size: 16,
//                               color: Colors.grey,
//                             ),
//                             hintText: 'Date',
//                             border: OutlineInputBorder(
//                                 borderRadius: BorderRadius.circular(12),
//                                 borderSide: BorderSide.none),
//                           ),
//                         ),
//                         const SizedBox(height: 32),
//                         SizedBox(
//                           width: double.infinity,
//                           height: kToolbarHeight,
//                           child: TextButton(
//                               onPressed: saveData,
//                               style: TextButton.styleFrom(
//                                   backgroundColor: Colors.black,
//                                   shape: RoundedRectangleBorder(
//                                       borderRadius: BorderRadius.circular(12))),
//                               child: const Text(
//                                 "Save",
//                                 style: TextStyle(color: Colors.white),
//                               )),
//                         ),
//                       ],
//                     ),
//                   );
//                 } else if (state is GetCategoriesLoading) {
//                   return const Center(child: CircularProgressIndicator());
//                 } else {
//                   return const Center(child: Text('Failed to load categories'));
//                 }
//               },
//             ),
//           ),
//         );
//       },
//     );
//   }
// }













import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:expense_repository/expense_repository.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';
import 'package:mad_my_app/screens/add_expense/blocs/create_expense_bloc/create_expense_bloc.dart';
import 'package:mad_my_app/screens/add_expense/blocs/get_categories_bloc/get_categories_bloc.dart';
import 'package:mad_my_app/screens/add_expense/views/category_creation.dart';
import 'package:mad_my_app/screens/home/blocs/get_expenses_bloc/get_expenses_event.dart';
import 'package:mad_my_app/screens/home/views/main_screen.dart';

class AddExpenseIncome extends StatefulWidget {
  final Function onTransactionAdded;

  const AddExpenseIncome({Key? key, required this.onTransactionAdded})
      : super(key: key);

  @override
  State<AddExpenseIncome> createState() => _AddExpenseIncomeState();
}

class _AddExpenseIncomeState extends State<AddExpenseIncome> {
  TextEditingController amountController = TextEditingController();
  TextEditingController categoryController = TextEditingController();
  TextEditingController dateController = TextEditingController();
  late Expense expense;
  late Income income;
  bool isExpense = true; // Toggle flag

  @override
  void initState() {
    super.initState();
    // Fetch categories when the widget initializes
    BlocProvider.of<GetCategoriesBloc>(context).add(FetchCategories());
    dateController.text = DateFormat('dd/MM/yyyy').format(DateTime.now());
    expense = Expense.empty;
    income = Income.empty;
  }

  Future<void> updateTotalBalance(
      String userId, double amount, bool isIncome) async {
    final balanceDoc = FirebaseFirestore.instance
        .collection('users')
        .doc(userId)
        .collection('balance')
        .doc('balance');

    final balanceSnapshot = await balanceDoc.get();

    if (balanceSnapshot.exists) {
      double totalBalance = balanceSnapshot.data()?['totalBalance'] ?? 0.0;
      if (isIncome) {
        totalBalance += amount;
      } else {
        totalBalance -= amount;
      }
      await balanceDoc.update({'totalBalance': totalBalance});
    }
  }

  void saveData() async {
    final userId = FirebaseAuth.instance.currentUser?.uid;

    if (userId == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('User not logged in.')),
      );
      return;
    }

    final userExpenseCollection = FirebaseFirestore.instance
        .collection('users')
        .doc(userId)
        .collection('expenses');
    final userIncomeCollection = FirebaseFirestore.instance
        .collection('users')
        .doc(userId)
        .collection('incomes');

    double amount = double.parse(amountController.text);

    if (isExpense) {
      expense.amount = int.parse(amountController.text);
      await userExpenseCollection.add(expense.toEntity().toDocument());
    } else {
      income.amount = int.parse(amountController.text);
      await userIncomeCollection.add(income.toEntity().toDocument());
    }

    // Update total balance
    await updateTotalBalance(userId, amount, !isExpense);

    // Navigate back to the parent screen that manages all necessary components
    Navigator.of(context).pop(); // Close the current screen (AddExpenseIncome)
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetCategoriesBloc, GetCategoriesState>(
      builder: (context, state) {
        return GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Scaffold(
            backgroundColor: Theme.of(context).colorScheme.background,
            appBar: AppBar(
              backgroundColor: Theme.of(context).colorScheme.background,
              actions: [
                Switch(
                  value: isExpense,
                  onChanged: (value) {
                    setState(() {
                      isExpense = value;
                    });
                  },
                  activeColor: Colors.red,
                  inactiveThumbColor: Colors.green,
                  inactiveTrackColor: Colors.green[200],
                )
              ],
            ),
            body: BlocBuilder<GetCategoriesBloc, GetCategoriesState>(
              builder: (context, state) {
                if (state is GetCategoriesSuccess) {
                  return SingleChildScrollView(
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            isExpense ? "Add Expense" : "Add Income",
                            style: const TextStyle(
                                fontSize: 22, fontWeight: FontWeight.w500),
                          ),
                          const SizedBox(height: 16),
                          SizedBox(
                            width: MediaQuery.of(context).size.width * 0.7,
                            child: TextFormField(
                              controller: amountController,
                              textAlignVertical: TextAlignVertical.center,
                              decoration: InputDecoration(
                                filled: true,
                                fillColor: Colors.white,
                                prefixIcon: const Icon(
                                  FontAwesomeIcons.dollarSign,
                                  size: 16,
                                  color: Colors.grey,
                                ),
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(30),
                                    borderSide: BorderSide.none),
                              ),
                            ),
                          ),
                          const SizedBox(height: 16),
                          TextFormField(
                            controller: categoryController,
                            textAlignVertical: TextAlignVertical.center,
                            readOnly: true,
                            onTap: () {},
                            decoration: InputDecoration(
                              filled: true,
                              fillColor: (isExpense
                                          ? expense.category
                                          : income.category) ==
                                      Category.empty
                                  ? Colors.white
                                  : Color((isExpense
                                          ? expense.category
                                          : income.category)
                                      .color),
                              prefixIcon: (isExpense
                                          ? expense.category
                                          : income.category) ==
                                      Category.empty
                                  ? const Icon(
                                      FontAwesomeIcons.list,
                                      size: 16,
                                      color: Colors.grey,
                                    )
                                  : Image.asset(
                                      'assets/${(isExpense ? expense.category : income.category).icon}.png',
                                      scale: 2,
                                    ),
                              suffixIcon: IconButton(
                                  onPressed: () async {
                                    var newCategory =
                                        await getCategoryCreation(context);

                                    setState(() {
                                      state.categories.insert(0, newCategory);
                                    });
                                  },
                                  icon: const Icon(
                                    FontAwesomeIcons.plus,
                                    size: 16,
                                    color: Colors.grey,
                                  )),
                              hintText: 'Category',
                              border: const OutlineInputBorder(
                                  borderRadius: BorderRadius.vertical(
                                      top: Radius.circular(12)),
                                  borderSide: BorderSide.none),
                            ),
                          ),
                          Container(
                            height: 200,
                            width: MediaQuery.of(context).size.width,
                            decoration: const BoxDecoration(
                              color: Colors.white,
                            ),
                            child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: ListView.builder(
                                    itemCount: state.categories.length,
                                    itemBuilder: (context, int i) {
                                      return Card(
                                          child: ListTile(
                                        onTap: () {
                                          setState(() {
                                            if (isExpense) {
                                              expense.category =
                                                  state.categories[i];
                                              categoryController.text =
                                                  expense.category.name;
                                            } else {
                                              income.category =
                                                  state.categories[i];
                                              categoryController.text =
                                                  income.category.name;
                                            }
                                          });
                                        },
                                        title: Text(state.categories[i].name),
                                        tileColor:
                                            Color(state.categories[i].color),
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(8)),
                                      ));
                                    })),
                          ),
                          const SizedBox(height: 32),
                          TextFormField(
                            controller: dateController,
                            textAlignVertical: TextAlignVertical.center,
                            readOnly: true,
                            onTap: () async {
                              DateTime? newDate = await showDatePicker(
                                context: context,
                                initialDate: isExpense
                                    ? expense.date.toDate()
                                    : income.date.toDate(),
                                firstDate: DateTime.now(),
                                lastDate: DateTime.now()
                                    .add(const Duration(days: 365)),
                              );

                              if (newDate != null) {
                                setState(() {
                                  dateController.text =
                                      DateFormat('dd/MM/yyyy').format(newDate);
                                  if (isExpense) {
                                    expense.date = Timestamp.fromDate(
                                        newDate); // Set Timestamp
                                  } else {
                                    income.date = Timestamp.fromDate(
                                        newDate); // Set Timestamp
                                  }
                                });
                              }
                            },
                            decoration: InputDecoration(
                              filled: true,
                              fillColor: Colors.white,
                              prefixIcon: const Icon(
                                FontAwesomeIcons.clock,
                                size: 16,
                                color: Colors.grey,
                              ),
                              hintText: 'Date',
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(12),
                                  borderSide: BorderSide.none),
                            ),
                          ),
                          const SizedBox(height: 32),
                          SizedBox(
                            width: double.infinity,
                            height: kToolbarHeight,
                            child: TextButton(
                                onPressed: saveData,
                                style: TextButton.styleFrom(
                                    backgroundColor: Colors.black,
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(12))),
                                child: const Text(
                                  "Save",
                                  style: TextStyle(color: Colors.white),
                                )),
                          ),
                        ],
                      ),
                    ),
                  );
                } else if (state is GetCategoriesLoading) {
                  return const Center(child: CircularProgressIndicator());
                } else {
                  return const Center(child: Text('Failed to load categories'));
                }
              },
            ),
          ),
        );
      },
    );
  }
}






// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:expense_repository/expense_repository.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:font_awesome_flutter/font_awesome_flutter.dart';
// import 'package:intl/intl.dart';
// import 'package:mad_my_app/screens/add_expense/blocs/create_expense_bloc/create_expense_bloc.dart';
// import 'package:mad_my_app/screens/add_expense/blocs/get_categories_bloc/get_categories_bloc.dart';
// import 'package:mad_my_app/screens/add_expense/views/category_creation.dart';
// import 'package:mad_my_app/screens/home/blocs/get_expenses_bloc/get_expenses_bloc.dart'; // Corrected import
// import 'package:mad_my_app/screens/home/blocs/get_expenses_bloc/get_expenses_event.dart';
// import 'package:mad_my_app/screens/home/views/main_screen.dart';

// class AddExpenseIncome extends StatefulWidget {
//   final Function onTransactionAdded;

//   const AddExpenseIncome({Key? key, required this.onTransactionAdded})
//       : super(key: key);

//   @override
//   State<AddExpenseIncome> createState() => _AddExpenseIncomeState();
// }

// class _AddExpenseIncomeState extends State<AddExpenseIncome> {
//   TextEditingController amountController = TextEditingController();
//   TextEditingController categoryController = TextEditingController();
//   TextEditingController dateController = TextEditingController();
//   late Expense expense;
//   late Income income;
//   bool isExpense = true; // Toggle flag

//   @override
//   void initState() {
//     super.initState();
//     // Fetch categories when the widget initializes
//     BlocProvider.of<GetCategoriesBloc>(context).add(FetchCategories());
//     dateController.text = DateFormat('dd/MM/yyyy').format(DateTime.now());
//     expense = Expense.empty;
//     income = Income.empty;
//   }

//   Future<void> updateTotalBalance(
//       String userId, double amount, bool isIncome) async {
//     final balanceDoc = FirebaseFirestore.instance
//         .collection('users')
//         .doc(userId)
//         .collection('balance')
//         .doc('balance');

//     final balanceSnapshot = await balanceDoc.get();

//     if (balanceSnapshot.exists) {
//       double totalBalance = balanceSnapshot.data()?['totalBalance'] ?? 0.0;
//       if (isIncome) {
//         totalBalance += amount;
//       } else {
//         totalBalance -= amount;
//       }
//       await balanceDoc.update({'totalBalance': totalBalance});
//     }
//   }

//   void saveData() async {
//     final userId = FirebaseAuth.instance.currentUser?.uid;

//     if (userId == null) {
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(content: Text('User not logged in.')),
//       );
//       return;
//     }

//     final userExpenseCollection = FirebaseFirestore.instance
//         .collection('users')
//         .doc(userId)
//         .collection('expenses');
//     final userIncomeCollection = FirebaseFirestore.instance
//         .collection('users')
//         .doc(userId)
//         .collection('incomes');

//     double amount = double.parse(amountController.text);

//     if (isExpense) {
//       expense.amount = int.parse(amountController.text);
//       await userExpenseCollection.add(expense.toEntity().toDocument());
//     } else {
//       income.amount = int.parse(amountController.text);
//       await userIncomeCollection.add(income.toEntity().toDocument());
//     }

//     // Update total balance
//     await updateTotalBalance(userId, amount, !isExpense);

//     // Update the state and navigate back to the main screen
//     widget.onTransactionAdded(); // Callback to update transactions in the main screen
//     Navigator.of(context).pop(); // Close the current screen (AddExpenseIncome)
//   }

//   @override
//   Widget build(BuildContext context) {
//     return BlocBuilder<GetCategoriesBloc, GetCategoriesState>(
//       builder: (context, state) {
//         return GestureDetector(
//           onTap: () => FocusScope.of(context).unfocus(),
//           child: Scaffold(
//             backgroundColor: Theme.of(context).colorScheme.background,
//             appBar: AppBar(
//               backgroundColor: Theme.of(context).colorScheme.background,
//               actions: [
//                 Switch(
//                   value: isExpense,
//                   onChanged: (value) {
//                     setState(() {
//                       isExpense = value;
//                     });
//                   },
//                   activeColor: Colors.red,
//                   inactiveThumbColor: Colors.green,
//                   inactiveTrackColor: Colors.green[200],
//                 )
//               ],
//             ),
//             body: BlocBuilder<GetCategoriesBloc, GetCategoriesState>(
//               builder: (context, state) {
//                 if (state is GetCategoriesSuccess) {
//                   return SingleChildScrollView(
//                     child: Padding(
//                       padding: const EdgeInsets.all(16.0),
//                       child: Column(
//                         crossAxisAlignment: CrossAxisAlignment.center,
//                         children: [
//                           Text(
//                             isExpense ? "Add Expense" : "Add Income",
//                             style: const TextStyle(
//                                 fontSize: 22, fontWeight: FontWeight.w500),
//                           ),
//                           const SizedBox(height: 16),
//                           SizedBox(
//                             width: MediaQuery.of(context).size.width * 0.7,
//                             child: TextFormField(
//                               controller: amountController,
//                               textAlignVertical: TextAlignVertical.center,
//                               decoration: InputDecoration(
//                                 filled: true,
//                                 fillColor: Colors.white,
//                                 prefixIcon: const Icon(
//                                   FontAwesomeIcons.dollarSign,
//                                   size: 16,
//                                   color: Colors.grey,
//                                 ),
//                                 border: OutlineInputBorder(
//                                     borderRadius: BorderRadius.circular(30),
//                                     borderSide: BorderSide.none),
//                               ),
//                             ),
//                           ),
//                           const SizedBox(height: 16),
//                           TextFormField(
//                             controller: categoryController,
//                             textAlignVertical: TextAlignVertical.center,
//                             readOnly: true,
//                             onTap: () {},
//                             decoration: InputDecoration(
//                               filled: true,
//                               fillColor: (isExpense
//                                           ? expense.category
//                                           : income.category) ==
//                                       Category.empty
//                                   ? Colors.white
//                                   : Color((isExpense
//                                           ? expense.category
//                                           : income.category)
//                                       .color),
//                               prefixIcon: (isExpense
//                                           ? expense.category
//                                           : income.category) ==
//                                       Category.empty
//                                   ? const Icon(
//                                       FontAwesomeIcons.list,
//                                       size: 16,
//                                       color: Colors.grey,
//                                     )
//                                   : Image.asset(
//                                       'assets/${(isExpense ? expense.category : income.category).icon}.png',
//                                       scale: 2,
//                                     ),
//                               suffixIcon: IconButton(
//                                   onPressed: () async {
//                                     var newCategory =
//                                         await getCategoryCreation(context);

//                                     setState(() {
//                                       state.categories.insert(0, newCategory);
//                                     });
//                                   },
//                                   icon: const Icon(
//                                     FontAwesomeIcons.plus,
//                                     size: 16,
//                                     color: Colors.grey,
//                                   )),
//                               hintText: 'Category',
//                               border: const OutlineInputBorder(
//                                   borderRadius: BorderRadius.vertical(
//                                       top: Radius.circular(12)),
//                                   borderSide: BorderSide.none),
//                             ),
//                           ),
//                           Container(
//                             height: 200,
//                             width: MediaQuery.of(context).size.width,
//                             decoration: const BoxDecoration(
//                               color: Colors.white,
//                             ),
//                             child: Padding(
//                                 padding: const EdgeInsets.all(8.0),
//                                 child: ListView.builder(
//                                     itemCount: state.categories.length,
//                                     itemBuilder: (context, int i) {
//                                       return Card(
//                                           child: ListTile(
//                                         onTap: () {
//                                           setState(() {
//                                             if (isExpense) {
//                                               expense.category =
//                                                   state.categories[i];
//                                               categoryController.text =
//                                                   expense.category.name;
//                                             } else {
//                                               income.category =
//                                                   state.categories[i];
//                                               categoryController.text =
//                                                   income.category.name;
//                                             }
//                                           });
//                                         },
//                                         title: Text(state.categories[i].name),
//                                         tileColor:
//                                             Color(state.categories[i].color),
//                                         shape: RoundedRectangleBorder(
//                                             borderRadius:
//                                                 BorderRadius.circular(8)),
//                                       ));
//                                     })),
//                           ),
//                           const SizedBox(height: 32),
//                           TextFormField(
//                             controller: dateController,
//                             textAlignVertical: TextAlignVertical.center,
//                             readOnly: true,
//                             onTap: () async {
//                               DateTime? newDate = await showDatePicker(
//                                 context: context,
//                                 initialDate: isExpense
//                                     ? expense.date.toDate()
//                                     : income.date.toDate(),
//                                 firstDate: DateTime.now(),
//                                 lastDate: DateTime.now()
//                                     .add(const Duration(days: 365)),
//                               );

//                               if (newDate != null) {
//                                 setState(() {
//                                   dateController.text =
//                                       DateFormat('dd/MM/yyyy').format(newDate);
//                                   if (isExpense) {
//                                     expense.date = Timestamp.fromDate(
//                                         newDate); // Set Timestamp
//                                   } else {
//                                     income.date = Timestamp.fromDate(
//                                         newDate); // Set Timestamp
//                                   }
//                                 });
//                               }
//                             },
//                             decoration: InputDecoration(
//                               filled: true,
//                               fillColor: Colors.white,
//                               prefixIcon: const Icon(
//                                 FontAwesomeIcons.clock,
//                                 size: 16,
//                                 color: Colors.grey,
//                               ),
//                               hintText: 'Date',
//                               border: OutlineInputBorder(
//                                   borderRadius: BorderRadius.circular(12),
//                                   borderSide: BorderSide.none),
//                             ),
//                           ),
//                           const SizedBox(height: 32),
//                           SizedBox(
//                             width: double.infinity,
//                             height: kToolbarHeight,
//                             child: TextButton(
//                                 onPressed: saveData,
//                                 style: TextButton.styleFrom(
//                                     backgroundColor: Colors.black,
//                                     shape: RoundedRectangleBorder(
//                                         borderRadius:
//                                             BorderRadius.circular(12))),
//                                 child: const Text(
//                                   "Save",
//                                   style: TextStyle(color: Colors.white),
//                                 )),
//                           ),
//                         ],
//                       ),
//                     ),
//                   );
//                 } else if (state is GetCategoriesLoading) {
//                   return const Center(child: CircularProgressIndicator());
//                 } else {
//                   return const Center(child: Text('Failed to load categories'));
//                 }
//               },
//             ),
//           ),
//         );
//       },
//     );
//   }
// }


// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:expense_repository/expense_repository.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:font_awesome_flutter/font_awesome_flutter.dart';
// import 'package:intl/intl.dart';
// import 'package:mad_my_app/screens/add_expense/blocs/create_expense_bloc/create_expense_bloc.dart';
// import 'package:mad_my_app/screens/add_expense/blocs/get_categories_bloc/get_categories_bloc.dart';
// import 'package:mad_my_app/screens/add_expense/views/category_creation.dart';
// import 'package:mad_my_app/screens/home/blocs/get_expenses_bloc/get_expenses_event.dart';
// import 'package:mad_my_app/screens/home/views/main_screen.dart';

// class AddExpenseIncome extends StatefulWidget {
//   final Function onTransactionAdded;

//   const AddExpenseIncome({Key? key, required this.onTransactionAdded})
//       : super(key: key);

//   @override
//   State<AddExpenseIncome> createState() => _AddExpenseIncomeState();
// }

// class _AddExpenseIncomeState extends State<AddExpenseIncome> {
//   TextEditingController amountController = TextEditingController();
//   TextEditingController categoryController = TextEditingController();
//   TextEditingController dateController = TextEditingController();
//   late Expense expense;
//   late Income income;
//   bool isExpense = true; // Toggle flag

//   @override
//   void initState() {
//     super.initState();
//     // Fetch categories when the widget initializes
//     BlocProvider.of<GetCategoriesBloc>(context).add(FetchCategories());
//     dateController.text = DateFormat('dd/MM/yyyy').format(DateTime.now());
//     expense = Expense.empty;
//     income = Income.empty;
//   }

//   Future<void> updateTotalBalance(
//       String userId, double amount, bool isIncome) async {
//     final balanceDoc = FirebaseFirestore.instance
//         .collection('users')
//         .doc(userId)
//         .collection('balance')
//         .doc('balance');

//     final balanceSnapshot = await balanceDoc.get();

//     if (balanceSnapshot.exists) {
//       double totalBalance = balanceSnapshot.data()?['totalBalance'] ?? 0.0;
//       if (isIncome) {
//         totalBalance += amount;
//       } else {
//         totalBalance -= amount;
//       }
//       await balanceDoc.update({'totalBalance': totalBalance});
//     }
//   }

//   void saveData() async {
//     final userId = FirebaseAuth.instance.currentUser?.uid;

//     if (userId == null) {
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(content: Text('User not logged in.')),
//       );
//       return;
//     }

//     final userExpenseCollection = FirebaseFirestore.instance
//         .collection('users')
//         .doc(userId)
//         .collection('expenses');
//     final userIncomeCollection = FirebaseFirestore.instance
//         .collection('users')
//         .doc(userId)
//         .collection('incomes');

//     double amount = double.parse(amountController.text);

//     if (isExpense) {
//       expense.amount = int.parse(amountController.text);
//       await userExpenseCollection.add(expense.toEntity().toDocument());
//     } else {
//       income.amount = int.parse(amountController.text);
//       await userIncomeCollection.add(income.toEntity().toDocument());
//     }

//     // Update total balance
//     await updateTotalBalance(userId, amount, !isExpense);

//     // Navigate back to the MainScreen to ensure the recent transactions are updated
//     Navigator.pushReplacement(
//       context,
//       MaterialPageRoute(
//         builder: (context) => MainScreen(userId: userId,),
//       ),
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return BlocBuilder<GetCategoriesBloc, GetCategoriesState>(
//       builder: (context, state) {
//         return GestureDetector(
//           onTap: () => FocusScope.of(context).unfocus(),
//           child: Scaffold(
//             backgroundColor: Theme.of(context).colorScheme.background,
//             appBar: AppBar(
//               backgroundColor: Theme.of(context).colorScheme.background,
//               actions: [
//                 Switch(
//                   value: isExpense,
//                   onChanged: (value) {
//                     setState(() {
//                       isExpense = value;
//                     });
//                   },
//                   activeColor: Colors.red,
//                   inactiveThumbColor: Colors.green,
//                   inactiveTrackColor: Colors.green[200],
//                 )
//               ],
//             ),
//             body: BlocBuilder<GetCategoriesBloc, GetCategoriesState>(
//               builder: (context, state) {
//                 if (state is GetCategoriesSuccess) {
//                   return SingleChildScrollView(
//                     child: Padding(
//                       padding: const EdgeInsets.all(16.0),
//                       child: Column(
//                         crossAxisAlignment: CrossAxisAlignment.center,
//                         children: [
//                           Text(
//                             isExpense ? "Add Expense" : "Add Income",
//                             style: const TextStyle(
//                                 fontSize: 22, fontWeight: FontWeight.w500),
//                           ),
//                           const SizedBox(height: 16),
//                           SizedBox(
//                             width: MediaQuery.of(context).size.width * 0.7,
//                             child: TextFormField(
//                               controller: amountController,
//                               textAlignVertical: TextAlignVertical.center,
//                               decoration: InputDecoration(
//                                 filled: true,
//                                 fillColor: Colors.white,
//                                 prefixIcon: const Icon(
//                                   FontAwesomeIcons.dollarSign,
//                                   size: 16,
//                                   color: Colors.grey,
//                                 ),
//                                 border: OutlineInputBorder(
//                                     borderRadius: BorderRadius.circular(30),
//                                     borderSide: BorderSide.none),
//                               ),
//                             ),
//                           ),
//                           const SizedBox(height: 16),
//                           TextFormField(
//                             controller: categoryController,
//                             textAlignVertical: TextAlignVertical.center,
//                             readOnly: true,
//                             onTap: () {},
//                             decoration: InputDecoration(
//                               filled: true,
//                               fillColor: (isExpense
//                                           ? expense.category
//                                           : income.category) ==
//                                       Category.empty
//                                   ? Colors.white
//                                   : Color((isExpense
//                                           ? expense.category
//                                           : income.category)
//                                       .color),
//                               prefixIcon: (isExpense
//                                           ? expense.category
//                                           : income.category) ==
//                                       Category.empty
//                                   ? const Icon(
//                                       FontAwesomeIcons.list,
//                                       size: 16,
//                                       color: Colors.grey,
//                                     )
//                                   : Image.asset(
//                                       'assets/${(isExpense ? expense.category : income.category).icon}.png',
//                                       scale: 2,
//                                     ),
//                               suffixIcon: IconButton(
//                                   onPressed: () async {
//                                     var newCategory =
//                                         await getCategoryCreation(context);

//                                     setState(() {
//                                       state.categories.insert(0, newCategory);
//                                     });
//                                   },
//                                   icon: const Icon(
//                                     FontAwesomeIcons.plus,
//                                     size: 16,
//                                     color: Colors.grey,
//                                   )),
//                               hintText: 'Category',
//                               border: const OutlineInputBorder(
//                                   borderRadius: BorderRadius.vertical(
//                                       top: Radius.circular(12)),
//                                   borderSide: BorderSide.none),
//                             ),
//                           ),
//                           Container(
//                             height: 200,
//                             width: MediaQuery.of(context).size.width,
//                             decoration: const BoxDecoration(
//                               color: Colors.white,
//                             ),
//                             child: Padding(
//                                 padding: const EdgeInsets.all(8.0),
//                                 child: ListView.builder(
//                                     itemCount: state.categories.length,
//                                     itemBuilder: (context, int i) {
//                                       return Card(
//                                           child: ListTile(
//                                         onTap: () {
//                                           setState(() {
//                                             if (isExpense) {
//                                               expense.category =
//                                                   state.categories[i];
//                                               categoryController.text =
//                                                   expense.category.name;
//                                             } else {
//                                               income.category =
//                                                   state.categories[i];
//                                               categoryController.text =
//                                                   income.category.name;
//                                             }
//                                           });
//                                         },
//                                         title: Text(state.categories[i].name),
//                                         tileColor:
//                                             Color(state.categories[i].color),
//                                         shape: RoundedRectangleBorder(
//                                             borderRadius:
//                                                 BorderRadius.circular(8)),
//                                       ));
//                                     })),
//                           ),
//                           const SizedBox(height: 32),
//                           TextFormField(
//                             controller: dateController,
//                             textAlignVertical: TextAlignVertical.center,
//                             readOnly: true,
//                             onTap: () async {
//                               DateTime? newDate = await showDatePicker(
//                                 context: context,
//                                 initialDate: isExpense
//                                     ? expense.date.toDate()
//                                     : income.date.toDate(),
//                                 firstDate: DateTime.now(),
//                                 lastDate: DateTime.now()
//                                     .add(const Duration(days: 365)),
//                               );

//                               if (newDate != null) {
//                                 setState(() {
//                                   dateController.text =
//                                       DateFormat('dd/MM/yyyy').format(newDate);
//                                   if (isExpense) {
//                                     expense.date = Timestamp.fromDate(
//                                         newDate); // Set Timestamp
//                                   } else {
//                                     income.date = Timestamp.fromDate(
//                                         newDate); // Set Timestamp
//                                   }
//                                 });
//                               }
//                             },
//                             decoration: InputDecoration(
//                               filled: true,
//                               fillColor: Colors.white,
//                               prefixIcon: const Icon(
//                                 FontAwesomeIcons.clock,
//                                 size: 16,
//                                 color: Colors.grey,
//                               ),
//                               hintText: 'Date',
//                               border: OutlineInputBorder(
//                                   borderRadius: BorderRadius.circular(12),
//                                   borderSide: BorderSide.none),
//                             ),
//                           ),
//                           const SizedBox(height: 32),
//                           SizedBox(
//                             width: double.infinity,
//                             height: kToolbarHeight,
//                             child: TextButton(
//                                 onPressed: saveData,
//                                 style: TextButton.styleFrom(
//                                     backgroundColor: Colors.black,
//                                     shape: RoundedRectangleBorder(
//                                         borderRadius:
//                                             BorderRadius.circular(12))),
//                                 child: const Text(
//                                   "Save",
//                                   style: TextStyle(color: Colors.white),
//                                 )),
//                           ),
//                         ],
//                       ),
//                     ),
//                   );
//                 } else if (state is GetCategoriesLoading) {
//                   return const Center(child: CircularProgressIndicator());
//                 } else {
//                   return const Center(child: Text('Failed to load categories'));
//                 }
//               },
//             ),
//           ),
//         );
//       },
//     );
//   }
// }
