// import 'dart:math';
// import 'dart:ui';

// import 'package:expense_repository/expense_repository.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:intl/intl.dart';
// //import 'package:mad_my_app/data/data.dart';
// import 'package:mad_my_app/screens/signin_screen.dart';
// import 'package:mad_my_app/screens/view_all.dart';

// class MainScreen extends StatelessWidget {
//   final List<Expense> expenses;
//   const MainScreen(this.expenses, {super.key});

//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//       child: Padding(
//         padding: const EdgeInsets.symmetric(horizontal: 25.0, vertical: 10),
//         child: Column(
//           children: [
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 Row(
//                   children: [
//                     Stack(
//                       alignment: Alignment.center,
//                       children: [
//                         Container(
//                           width: 50,
//                           height: 50,
//                           decoration: BoxDecoration(
//                             shape: BoxShape.circle,
//                             color: Colors.yellow[700],
//                           ),
//                         ),
//                         Icon(
//                           CupertinoIcons.person_fill,
//                           color: Colors.yellow[800],
//                         ),
//                       ],
//                     ),
//                     const SizedBox(width: 8),
//                     Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         Text(
//                           "Welcome!",
//                           style: TextStyle(
//                             fontSize: 12,
//                             fontWeight: FontWeight.w600,
//                             color: Theme.of(context).colorScheme.outline,
//                           ),
//                         ),
//                         Text(
//                           "John Doe",
//                           style: TextStyle(
//                             fontSize: 18,
//                             fontWeight: FontWeight.bold,
//                             color: Theme.of(context).colorScheme.onBackground,
//                           ),
//                         ),
//                       ],
//                     ),
//                   ],
//                 ),
//                 PopupMenuButton<String>(
//                   icon: Icon(CupertinoIcons.settings),
//                   onSelected: (value) {
//                     if (value == 'logout') {
//                       showDialog(
//                         context: context,
//                         builder: (context) => AlertDialog(
//                           title: const Text('Logout'),
//                           content:
//                               const Text('Are you sure you want to log out?'),
//                           actions: [
//                             TextButton(
//                               onPressed: () {
//                                 Navigator.of(context).pop();
//                               },
//                               child: const Text('Cancel'),
//                             ),
//                             ElevatedButton(
//                               onPressed: () {
//                                 FirebaseAuth.instance.signOut().then((value) {
//                                   Navigator.push(
//                                       context,
//                                       MaterialPageRoute(
//                                           builder: (context) =>
//                                               SignInScreen()));
//                                 }
//                                     // Navigator.of(context).pop();
//                                     // Navigator.of(context).pushReplacement(
//                                     //   MaterialPageRoute(
//                                     //       builder: (context) =>
//                                     //           const SignInScreen()),
//                                     );
//                               },
//                               child: const Text('Logout'),
//                             ),
//                           ],
//                         ),
//                       );
//                     }
//                   },
//                   itemBuilder: (BuildContext context) {
//                     return [
//                       const PopupMenuItem(
//                         value: 'logout',
//                         child: Text('Logout'),
//                       ),
//                     ];
//                   },
//                 ),
//               ],
//             ),
//             const SizedBox(height: 20),
//             Container(
//               width: MediaQuery.of(context).size.width,
//               height: MediaQuery.of(context).size.width / 2,
//               decoration: BoxDecoration(
//                 gradient: LinearGradient(
//                   colors: [
//                     Theme.of(context).colorScheme.primary,
//                     Theme.of(context).colorScheme.secondary,
//                     Theme.of(context).colorScheme.tertiary,
//                   ],
//                   transform: const GradientRotation(pi / 4),
//                 ),
//                 borderRadius: BorderRadius.circular(25),
//                 boxShadow: [
//                   BoxShadow(
//                     blurRadius: 4,
//                     color: Colors.grey.shade300,
//                     offset: const Offset(5, 5),
//                   ),
//                 ],
//               ),
//               child: Column(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   const Text(
//                     'Total Balance',
//                     style: TextStyle(
//                       fontSize: 16,
//                       color: Colors.white,
//                       fontWeight: FontWeight.w600,
//                     ),
//                   ),
//                   const SizedBox(height: 20),
//                   const Text(
//                     '\$ 4800.00',
//                     style: TextStyle(
//                       fontSize: 40,
//                       color: Colors.white,
//                       fontWeight: FontWeight.bold,
//                     ),
//                   ),
//                   Padding(
//                     padding: const EdgeInsets.symmetric(
//                         vertical: 12, horizontal: 20),
//                     child: Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                       children: [
//                         Row(
//                           children: [
//                             Container(
//                               width: 25,
//                               height: 25,
//                               decoration: const BoxDecoration(
//                                 color: Colors.white30,
//                                 shape: BoxShape.circle,
//                               ),
//                               child: const Center(
//                                 child: Icon(
//                                   CupertinoIcons.arrow_up,
//                                   size: 12,
//                                   color: Colors.greenAccent,
//                                 ),
//                               ),
//                             ),
//                             const SizedBox(width: 8),
//                             const Column(
//                               crossAxisAlignment: CrossAxisAlignment.start,
//                               children: [
//                                 Text(
//                                   'Income',
//                                   style: TextStyle(
//                                     fontSize: 14,
//                                     color: Colors.white,
//                                     fontWeight: FontWeight.w400,
//                                   ),
//                                 ),
//                                 Text(
//                                   '\$ 2500.00',
//                                   style: TextStyle(
//                                     fontSize: 14,
//                                     color: Colors.white,
//                                     fontWeight: FontWeight.w600,
//                                   ),
//                                 ),
//                               ],
//                             ),
//                           ],
//                         ),
//                         Row(
//                           children: [
//                             Container(
//                               width: 25,
//                               height: 25,
//                               decoration: const BoxDecoration(
//                                 color: Colors.white30,
//                                 shape: BoxShape.circle,
//                               ),
//                               child: const Center(
//                                 child: Icon(
//                                   CupertinoIcons.arrow_down,
//                                   size: 12,
//                                   color: Colors.redAccent,
//                                 ),
//                               ),
//                             ),
//                             const SizedBox(width: 8),
//                             const Column(
//                               crossAxisAlignment: CrossAxisAlignment.start,
//                               children: [
//                                 Text(
//                                   'Expenses',
//                                   style: TextStyle(
//                                     fontSize: 14,
//                                     color: Colors.white,
//                                     fontWeight: FontWeight.w400,
//                                   ),
//                                 ),
//                                 Text(
//                                   '\$ 800.00',
//                                   style: TextStyle(
//                                     fontSize: 14,
//                                     color: Colors.white,
//                                     fontWeight: FontWeight.w600,
//                                   ),
//                                 ),
//                               ],
//                             ),
//                           ],
//                         ),
//                       ],
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//             const SizedBox(height: 40),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 Text(
//                   'Transactions',
//                   style: TextStyle(
//                     fontSize: 16,
//                     color: Theme.of(context).colorScheme.onBackground,
//                     fontWeight: FontWeight.bold,
//                   ),
//                 ),
//                 GestureDetector(
//                   onTap: () {
//                     Navigator.push(
//                       context,
//                       MaterialPageRoute(
//                           builder: (context) => const ViewAllScreen()),
//                     );
//                   },
//                   child: Text(
//                     'View All',
//                     style: TextStyle(
//                       fontSize: 14,
//                       color: Theme.of(context).colorScheme.outline,
//                       fontWeight: FontWeight.w400,
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//             const SizedBox(height: 20),
//             Expanded(
//               child: ListView.builder(
//                 itemCount: expenses.length,
//                 itemBuilder: (context, int i) {
//                   return Padding(
//                     padding: const EdgeInsets.only(bottom: 16.0),
//                     child: Container(
//                       decoration: BoxDecoration(
//                         color: Colors.white,
//                         borderRadius: BorderRadius.circular(12),
//                       ),
//                       child: Padding(
//                         padding: const EdgeInsets.all(16.0),
//                         child: Row(
//                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                           children: [
//                             Row(
//                               children: [
//                                 Stack(
//                                   alignment: Alignment.center,
//                                   children: [
//                                     Container(
//                                       width: 50,
//                                       height: 50,
//                                       decoration: BoxDecoration(
//                                         color:
//                                             Color(expenses[i].category.color),
//                                         shape: BoxShape.circle,
//                                       ),
//                                     ),
//                                     Image.asset(
//                                       'assets/${expenses[i].category.icon}.png',
//                                       scale: 2,
//                                       color: Colors.white,
//                                     )
//                                     // transactionsData[i]['icon'],
//                                   ],
//                                 ),
//                                 const SizedBox(width: 12),
//                                 Text(
//                                   expenses[i].category.name,
//                                   style: TextStyle(
//                                     fontSize: 14,
//                                     color: Theme.of(context)
//                                         .colorScheme
//                                         .onBackground,
//                                     fontWeight: FontWeight.w500,
//                                   ),
//                                 ),
//                               ],
//                             ),
//                             Column(
//                               crossAxisAlignment: CrossAxisAlignment.end,
//                               children: [
//                                 Text(
//                                   "\$${expenses[i].amount}.00",
//                                   style: TextStyle(
//                                     fontSize: 14,
//                                     color: Theme.of(context)
//                                         .colorScheme
//                                         .onBackground,
//                                     fontWeight: FontWeight.w400,
//                                   ),
//                                 ),
//                                 Text(
//                                   DateFormat('dd/MM/yyyy')
//                                       .format(expenses[i].date),
//                                   style: TextStyle(
//                                     fontSize: 14,
//                                     color: Theme.of(context)
//                                         .colorScheme
//                                         .onBackground,
//                                     fontWeight: FontWeight.w400,
//                                   ),
//                                 ),
//                               ],
//                             ),
//                           ],
//                         ),
//                       ),
//                     ),
//                   );
//                 },
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

// import 'dart:math';
// import 'dart:ui';

// import 'package:expense_repository/expense_repository.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:intl/intl.dart';
// //import 'package:mad_my_app/data/data.dart';
// import 'package:mad_my_app/screens/signin_screen.dart';
// import 'package:mad_my_app/screens/view_all.dart';

// class MainScreen extends StatelessWidget {
//   final List<Expense> expenses;
//   const MainScreen(this.expenses, {super.key, required List<Expense> expenses});

//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//       child: Padding(
//         padding: const EdgeInsets.symmetric(horizontal: 25.0, vertical: 10),
//         child: Column(
//           children: [
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 Row(
//                   children: [
//                     Stack(
//                       alignment: Alignment.center,
//                       children: [
//                         Container(
//                           width: 50,
//                           height: 50,
//                           decoration: BoxDecoration(
//                             shape: BoxShape.circle,
//                             color: Colors.yellow[700],
//                           ),
//                         ),
//                         Icon(
//                           CupertinoIcons.person_fill,
//                           color: Colors.yellow[800],
//                         ),
//                       ],
//                     ),
//                     const SizedBox(width: 8),
//                     Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         Text(
//                           "Welcome!",
//                           style: TextStyle(
//                             fontSize: 12,
//                             fontWeight: FontWeight.w600,
//                             color: Theme.of(context).colorScheme.outline,
//                           ),
//                         ),
//                         Text(
//                           "John Doe",
//                           style: TextStyle(
//                             fontSize: 18,
//                             fontWeight: FontWeight.bold,
//                             color: Theme.of(context).colorScheme.onBackground,
//                           ),
//                         ),
//                       ],
//                     ),
//                   ],
//                 ),
//                 PopupMenuButton<String>(
//                   icon: Icon(CupertinoIcons.settings),
//                   onSelected: (value) {
//                     if (value == 'logout') {
//                       showDialog(
//                         context: context,
//                         builder: (context) => AlertDialog(
//                           title: const Text('Logout'),
//                           content:
//                               const Text('Are you sure you want to log out?'),
//                           actions: [
//                             TextButton(
//                               onPressed: () {
//                                 Navigator.of(context).pop();
//                               },
//                               child: const Text('Cancel'),
//                             ),
//                             ElevatedButton(
//                               onPressed: () {
//                                 FirebaseAuth.instance.signOut().then((value) {
//                                   Navigator.push(
//                                       context,
//                                       MaterialPageRoute(
//                                           builder: (context) =>
//                                               SignInScreen()));
//                                 }
//                                     // Navigator.of(context).pop();
//                                     // Navigator.of(context).pushReplacement(
//                                     //   MaterialPageRoute(
//                                     //       builder: (context) =>
//                                     //           const SignInScreen()),
//                                     );
//                               },
//                               child: const Text('Logout'),
//                             ),
//                           ],
//                         ),
//                       );
//                     }
//                   },
//                   itemBuilder: (BuildContext context) {
//                     return [
//                       const PopupMenuItem(
//                         value: 'logout',
//                         child: Text('Logout'),
//                       ),
//                     ];
//                   },
//                 ),
//               ],
//             ),
//             const SizedBox(height: 20),
//             Container(
//               width: MediaQuery.of(context).size.width,
//               height: MediaQuery.of(context).size.width / 2,
//               decoration: BoxDecoration(
//                 gradient: LinearGradient(
//                   colors: [
//                     Theme.of(context).colorScheme.primary,
//                     Theme.of(context).colorScheme.secondary,
//                     Theme.of(context).colorScheme.tertiary,
//                   ],
//                   transform: const GradientRotation(pi / 4),
//                 ),
//                 borderRadius: BorderRadius.circular(25),
//                 boxShadow: [
//                   BoxShadow(
//                     blurRadius: 4,
//                     color: Colors.grey.shade300,
//                     offset: const Offset(5, 5),
//                   ),
//                 ],
//               ),
//               child: Column(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   const Text(
//                     'Total Balance',
//                     style: TextStyle(
//                       fontSize: 16,
//                       color: Colors.white,
//                       fontWeight: FontWeight.w600,
//                     ),
//                   ),
//                   const SizedBox(height: 20),
//                   const Text(
//                     '\$ 4800.00',
//                     style: TextStyle(
//                       fontSize: 40,
//                       color: Colors.white,
//                       fontWeight: FontWeight.bold,
//                     ),
//                   ),
//                   Padding(
//                     padding: const EdgeInsets.symmetric(
//                         vertical: 12, horizontal: 20),
//                     child: Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                       children: [
//                         Row(
//                           children: [
//                             Container(
//                               width: 25,
//                               height: 25,
//                               decoration: const BoxDecoration(
//                                 color: Colors.white30,
//                                 shape: BoxShape.circle,
//                               ),
//                               child: const Center(
//                                 child: Icon(
//                                   CupertinoIcons.arrow_up,
//                                   size: 12,
//                                   color: Colors.greenAccent,
//                                 ),
//                               ),
//                             ),
//                             const SizedBox(width: 8),
//                             const Column(
//                               crossAxisAlignment: CrossAxisAlignment.start,
//                               children: [
//                                 Text(
//                                   'Income',
//                                   style: TextStyle(
//                                     fontSize: 14,
//                                     color: Colors.white,
//                                     fontWeight: FontWeight.w400,
//                                   ),
//                                 ),
//                                 Text(
//                                   '\$ 2500.00',
//                                   style: TextStyle(
//                                     fontSize: 14,
//                                     color: Colors.white,
//                                     fontWeight: FontWeight.w600,
//                                   ),
//                                 ),
//                               ],
//                             ),
//                           ],
//                         ),
//                         Row(
//                           children: [
//                             Container(
//                               width: 25,
//                               height: 25,
//                               decoration: const BoxDecoration(
//                                 color: Colors.white30,
//                                 shape: BoxShape.circle,
//                               ),
//                               child: const Center(
//                                 child: Icon(
//                                   CupertinoIcons.arrow_down,
//                                   size: 12,
//                                   color: Colors.redAccent,
//                                 ),
//                               ),
//                             ),
//                             const SizedBox(width: 8),
//                             const Column(
//                               crossAxisAlignment: CrossAxisAlignment.start,
//                               children: [
//                                 Text(
//                                   'Expenses',
//                                   style: TextStyle(
//                                     fontSize: 14,
//                                     color: Colors.white,
//                                     fontWeight: FontWeight.w400,
//                                   ),
//                                 ),
//                                 Text(
//                                   '\$ 800.00',
//                                   style: TextStyle(
//                                     fontSize: 14,
//                                     color: Colors.white,
//                                     fontWeight: FontWeight.w600,
//                                   ),
//                                 ),
//                               ],
//                             ),
//                           ],
//                         ),
//                       ],
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//             const SizedBox(height: 40),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 Text(
//                   'Transactions',
//                   style: TextStyle(
//                     fontSize: 16,
//                     color: Theme.of(context).colorScheme.onBackground,
//                     fontWeight: FontWeight.bold,
//                   ),
//                 ),
//                 GestureDetector(
//                   onTap: () {
//                     Navigator.push(
//                       context,
//                       MaterialPageRoute(
//                           builder: (context) => const ViewAllScreen()),
//                     );
//                   },
//                   child: Text(
//                     'View All',
//                     style: TextStyle(
//                       fontSize: 14,
//                       color: Theme.of(context).colorScheme.outline,
//                       fontWeight: FontWeight.w400,
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//             const SizedBox(height: 20),
//             Expanded(
//               child: ListView.builder(
//                 itemCount: expenses.length,
//                 itemBuilder: (context, int i) {
//                   return Padding(
//                     padding: const EdgeInsets.only(bottom: 16.0),
//                     child: Container(
//                       decoration: BoxDecoration(
//                         color: Colors.white,
//                         borderRadius: BorderRadius.circular(12),
//                       ),
//                       child: Padding(
//                         padding: const EdgeInsets.all(16.0),
//                         child: Row(
//                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                           children: [
//                             Row(
//                               children: [
//                                 Stack(
//                                   alignment: Alignment.center,
//                                   children: [
//                                     Container(
//                                       width: 50,
//                                       height: 50,
//                                       decoration: BoxDecoration(
//                                         color:
//                                             Color(expenses[i].category.color),
//                                         shape: BoxShape.circle,
//                                       ),
//                                     ),
//                                     Image.asset(
//                                       'assets/${expenses[i].category.icon}.png',
//                                       scale: 2,
//                                       color: Colors.white,
//                                     )
//                                     // transactionsData[i]['icon'],
//                                   ],
//                                 ),
//                                 const SizedBox(width: 12),
//                                 Text(
//                                   expenses[i].category.name,
//                                   style: TextStyle(
//                                     fontSize: 14,
//                                     color: Theme.of(context)
//                                         .colorScheme
//                                         .onBackground,
//                                     fontWeight: FontWeight.w500,
//                                   ),
//                                 ),
//                               ],
//                             ),
//                             Column(
//                               crossAxisAlignment: CrossAxisAlignment.end,
//                               children: [
//                                 Text(
//                                   "\$${expenses[i].amount}.00",
//                                   style: TextStyle(
//                                     fontSize: 14,
//                                     color: Theme.of(context)
//                                         .colorScheme
//                                         .onBackground,
//                                     fontWeight: FontWeight.w400,
//                                   ),
//                                 ),
//                                 Text(
//                                   DateFormat('dd/MM/yyyy')
//                                       .format(expenses[i].date as DateTime),
//                                   style: TextStyle(
//                                     fontSize: 14,
//                                     color: Theme.of(context)
//                                         .colorScheme
//                                         .onBackground,
//                                     fontWeight: FontWeight.w400,
//                                   ),
//                                 ),
//                               ],
//                             ),
//                           ],
//                         ),
//                       ),
//                     ),
//                   );
//                 },
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

// import 'dart:math';
// import 'dart:ui';

// import 'package:expense_repository/expense_repository.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:intl/intl.dart';
// import 'package:mad_my_app/screens/signin_screen.dart';
// import 'package:mad_my_app/screens/view_all.dart';

// class MainScreen extends StatelessWidget {
//   final List<Expense> expenses;

//   const MainScreen({Key? key, required this.expenses, required String userId}) : super(key: key);
// import 'dart:math';

// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:expense_repository/expense_repository.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:intl/intl.dart';
// import 'package:mad_my_app/screens/signin_screen.dart';
// import 'package:mad_my_app/screens/view_all.dart';

// class MainScreen extends StatefulWidget {
//   final String userId;

//   const MainScreen({Key? key, required this.userId}) : super(key: key);

//   @override
//   _MainScreenState createState() => _MainScreenState();
// }

// class _MainScreenState extends State<MainScreen> {
//   List<Expense> expenses = [];
//   List<Income> incomes = [];

//   @override
//   void initState() {
//     super.initState();
//     fetchTransactions();
//   }

//   Future<void> fetchTransactions() async {
//     final userExpenseCollection = FirebaseFirestore.instance
//         .collection('users')
//         .doc(widget.userId)
//         .collection('expenses');
//     final userIncomeCollection = FirebaseFirestore.instance
//         .collection('users')
//         .doc(widget.userId)
//         .collection('incomes');

//     // Fetch expenses
//     final expenseSnapshot = await userExpenseCollection.get();
//     final incomeSnapshot = await userIncomeCollection.get();

//     setState(() {
//       expenses =
//           expenseSnapshot.docs.map((doc) => Expense.fromDocument(doc)).toList();
//       incomes =
//           incomeSnapshot.docs.map((doc) => Income.fromDocument(doc)).toList();
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//       child: Padding(
//         padding: const EdgeInsets.symmetric(horizontal: 25.0, vertical: 10),
//         child: Column(
//           children: [
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 Row(
//                   children: [
//                     Stack(
//                       alignment: Alignment.center,
//                       children: [
//                         Container(
//                           width: 50,
//                           height: 50,
//                           decoration: BoxDecoration(
//                             shape: BoxShape.circle,
//                             color: Colors.yellow[700],
//                           ),
//                         ),
//                         Icon(
//                           CupertinoIcons.person_fill,
//                           color: Colors.yellow[800],
//                         ),
//                       ],
//                     ),
//                     const SizedBox(width: 8),
//                     Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         Text(
//                           "Welcome!",
//                           style: TextStyle(
//                             fontSize: 12,
//                             fontWeight: FontWeight.w600,
//                             color: Theme.of(context).colorScheme.outline,
//                           ),
//                         ),
//                         Text(
//                           "John Doe",
//                           style: TextStyle(
//                             fontSize: 18,
//                             fontWeight: FontWeight.bold,
//                             color: Theme.of(context).colorScheme.onBackground,
//                           ),
//                         ),
//                       ],
//                     ),
//                   ],
//                 ),
//                 PopupMenuButton<String>(
//                   icon: Icon(CupertinoIcons.settings),
//                   onSelected: (value) {
//                     if (value == 'logout') {
//                       showDialog(
//                         context: context,
//                         builder: (context) => AlertDialog(
//                           title: const Text('Logout'),
//                           content:
//                               const Text('Are you sure you want to log out?'),
//                           actions: [
//                             TextButton(
//                               onPressed: () {
//                                 Navigator.of(context).pop();
//                               },
//                               child: const Text('Cancel'),
//                             ),
//                             ElevatedButton(
//                               onPressed: () {
//                                 FirebaseAuth.instance.signOut().then((value) {
//                                   Navigator.push(
//                                       context,
//                                       MaterialPageRoute(
//                                           builder: (context) =>
//                                               SignInScreen()));
//                                 });
//                               },
//                               child: const Text('Logout'),
//                             ),
//                           ],
//                         ),
//                       );
//                     }
//                   },
//                   itemBuilder: (BuildContext context) {
//                     return [
//                       const PopupMenuItem(
//                         value: 'logout',
//                         child: Text('Logout'),
//                       ),
//                     ];
//                   },
//                 ),
//               ],
//             ),
//             const SizedBox(height: 20),
//             Container(
//               width: MediaQuery.of(context).size.width,
//               height: MediaQuery.of(context).size.width / 2,
//               decoration: BoxDecoration(
//                 gradient: LinearGradient(
//                   colors: [
//                     Theme.of(context).colorScheme.primary,
//                     Theme.of(context).colorScheme.secondary,
//                     Theme.of(context).colorScheme.tertiary,
//                   ],
//                   transform: const GradientRotation(pi / 4),
//                 ),
//                 borderRadius: BorderRadius.circular(25),
//                 boxShadow: [
//                   BoxShadow(
//                     blurRadius: 4,
//                     color: Colors.grey.shade300,
//                     offset: const Offset(5, 5),
//                   ),
//                 ],
//               ),
//               child: Column(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   const Text(
//                     'Total Balance',
//                     style: TextStyle(
//                       fontSize: 16,
//                       color: Colors.white,
//                       fontWeight: FontWeight.w600,
//                     ),
//                   ),
//                   const SizedBox(height: 20),
//                   const Text(
//                     '\$ 4800.00',
//                     style: TextStyle(
//                       fontSize: 40,
//                       color: Colors.white,
//                       fontWeight: FontWeight.bold,
//                     ),
//                   ),
//                   Padding(
//                     padding: const EdgeInsets.symmetric(
//                         vertical: 12, horizontal: 20),
//                     child: Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                       children: [
//                         Row(
//                           children: [
//                             Container(
//                               width: 25,
//                               height: 25,
//                               decoration: const BoxDecoration(
//                                 color: Colors.white30,
//                                 shape: BoxShape.circle,
//                               ),
//                               child: const Center(
//                                 child: Icon(
//                                   CupertinoIcons.arrow_up,
//                                   size: 12,
//                                   color: Colors.greenAccent,
//                                 ),
//                               ),
//                             ),
//                             const SizedBox(width: 8),
//                             const Column(
//                               crossAxisAlignment: CrossAxisAlignment.start,
//                               children: [
//                                 Text(
//                                   'Income',
//                                   style: TextStyle(
//                                     fontSize: 14,
//                                     color: Colors.white,
//                                     fontWeight: FontWeight.w400,
//                                   ),
//                                 ),
//                                 Text(
//                                   '\$ 2500.00',
//                                   style: TextStyle(
//                                     fontSize: 14,
//                                     color: Colors.white,
//                                     fontWeight: FontWeight.w600,
//                                   ),
//                                 ),
//                               ],
//                             ),
//                           ],
//                         ),
//                         Row(
//                           children: [
//                             Container(
//                               width: 25,
//                               height: 25,
//                               decoration: const BoxDecoration(
//                                 color: Colors.white30,
//                                 shape: BoxShape.circle,
//                               ),
//                               child: const Center(
//                                 child: Icon(
//                                   CupertinoIcons.arrow_down,
//                                   size: 12,
//                                   color: Colors.redAccent,
//                                 ),
//                               ),
//                             ),
//                             const SizedBox(width: 8),
//                             const Column(
//                               crossAxisAlignment: CrossAxisAlignment.start,
//                               children: [
//                                 Text(
//                                   'Expenses',
//                                   style: TextStyle(
//                                     fontSize: 14,
//                                     color: Colors.white,
//                                     fontWeight: FontWeight.w400,
//                                   ),
//                                 ),
//                                 Text(
//                                   '\$ 800.00',
//                                   style: TextStyle(
//                                     fontSize: 14,
//                                     color: Colors.white,
//                                     fontWeight: FontWeight.w600,
//                                   ),
//                                 ),
//                               ],
//                             ),
//                           ],
//                         ),
//                       ],
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//             const SizedBox(height: 40),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 Text(
//                   'Transactions',
//                   style: TextStyle(
//                     fontSize: 16,
//                     color: Theme.of(context).colorScheme.onBackground,
//                     fontWeight: FontWeight.bold,
//                   ),
//                 ),
//                 GestureDetector(
//                   onTap: () {
//                     Navigator.push(
//                       context,
//                       MaterialPageRoute(
//                           builder: (context) => const ViewAllScreen()),
//                     );
//                   },
//                   child: Text(
//                     'View All',
//                     style: TextStyle(
//                       fontSize: 14,
//                       color: Theme.of(context).colorScheme.outline,
//                       fontWeight: FontWeight.w400,
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//             const SizedBox(height: 20),
//             Expanded(
//               child: ListView.builder(
//                 itemCount: expenses.length,
//                 itemBuilder: (context, int i) {
//                   return Padding(
//                     padding: const EdgeInsets.only(bottom: 16.0),
//                     child: Container(
//                       decoration: BoxDecoration(
//                         color: Colors.white,
//                         borderRadius: BorderRadius.circular(12),
//                       ),
//                       child: Padding(
//                         padding: const EdgeInsets.all(16.0),
//                         child: Row(
//                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                           children: [
//                             Row(
//                               children: [
//                                 Stack(
//                                   alignment: Alignment.center,
//                                   children: [
//                                     Container(
//                                       width: 50,
//                                       height: 50,
//                                       decoration: BoxDecoration(
//                                         color:
//                                             Color(expenses[i].category.color),
//                                         shape: BoxShape.circle,
//                                       ),
//                                     ),
//                                     Image.asset(
//                                       'assets/${expenses[i].category.icon}.png',
//                                       scale: 2,
//                                       color: Colors.white,
//                                     ),
//                                   ],
//                                 ),
//                                 const SizedBox(width: 12),
//                                 Text(
//                                   expenses[i].category.name,
//                                   style: TextStyle(
//                                     fontSize: 14,
//                                     color: Theme.of(context)
//                                         .colorScheme
//                                         .onBackground,
//                                     fontWeight: FontWeight.w500,
//                                   ),
//                                 ),
//                               ],
//                             ),
//                             Column(
//                               crossAxisAlignment: CrossAxisAlignment.end,
//                               children: [
//                                 Text(
//                                   "\$${expenses[i].amount}.00",
//                                   style: TextStyle(
//                                     fontSize: 14,
//                                     color: Theme.of(context)
//                                         .colorScheme
//                                         .onBackground,
//                                     fontWeight: FontWeight.w400,
//                                   ),
//                                 ),
//                                 Text(
//                                   DateFormat('dd/MM/yyyy')
//                                       .format(expenses[i].date.toDate()),
//                                   style: TextStyle(
//                                     fontSize: 14,
//                                     color: Theme.of(context)
//                                         .colorScheme
//                                         .onBackground,
//                                     fontWeight: FontWeight.w400,
//                                   ),
//                                 ),
//                               ],
//                             ),
//                           ],
//                         ),
//                       ),
//                     ),
//                   );
//                 },
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

//most recent working code below

// import 'dart:math';

// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:expense_repository/expense_repository.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:intl/intl.dart';
// import 'package:mad_my_app/screens/signin_screen.dart';
// import 'package:mad_my_app/screens/view_all.dart';

// class MainScreen extends StatefulWidget {
//   final String userId;

//   const MainScreen({Key? key, required this.userId}) : super(key: key);

//   @override
//   _MainScreenState createState() => _MainScreenState();
// }

// class _MainScreenState extends State<MainScreen> {
//   List<Expense> expenses = [];
//   List<Income> incomes = [];
//   bool showExpenses = true;

//   @override
//   void initState() {
//     super.initState();
//     fetchTransactions();
//   }

//   Future<void> fetchTransactions() async {
//     final userExpenseCollection = FirebaseFirestore.instance
//         .collection('users')
//         .doc(widget.userId)
//         .collection('expenses');
//     final userIncomeCollection = FirebaseFirestore.instance
//         .collection('users')
//         .doc(widget.userId)
//         .collection('incomes');

//     // Fetch expenses
//     final expenseSnapshot = await userExpenseCollection.get();
//     final incomeSnapshot = await userIncomeCollection.get();

//     setState(() {
//       expenses =
//           expenseSnapshot.docs.map((doc) => Expense.fromDocument(doc)).toList();
//       incomes =
//           incomeSnapshot.docs.map((doc) => Income.fromDocument(doc)).toList();
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//       child: Padding(
//         padding: const EdgeInsets.symmetric(horizontal: 25.0, vertical: 10),
//         child: Column(
//           children: [
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 Row(
//                   children: [
//                     Stack(
//                       alignment: Alignment.center,
//                       children: [
//                         Container(
//                           width: 50,
//                           height: 50,
//                           decoration: BoxDecoration(
//                             shape: BoxShape.circle,
//                             color: Colors.yellow[700],
//                           ),
//                         ),
//                         Icon(
//                           CupertinoIcons.person_fill,
//                           color: Colors.yellow[800],
//                         ),
//                       ],
//                     ),
//                     const SizedBox(width: 8),
//                     Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         Text(
//                           "Welcome!",
//                           style: TextStyle(
//                             fontSize: 12,
//                             fontWeight: FontWeight.w600,
//                             color: Theme.of(context).colorScheme.outline,
//                           ),
//                         ),
//                         Text(
//                           "John Doe",
//                           style: TextStyle(
//                             fontSize: 18,
//                             fontWeight: FontWeight.bold,
//                             color: Theme.of(context).colorScheme.onBackground,
//                           ),
//                         ),
//                       ],
//                     ),
//                   ],
//                 ),
//                 PopupMenuButton<String>(
//                   icon: Icon(CupertinoIcons.settings),
//                   onSelected: (value) {
//                     if (value == 'logout') {
//                       showDialog(
//                         context: context,
//                         builder: (context) => AlertDialog(
//                           title: const Text('Logout'),
//                           content:
//                               const Text('Are you sure you want to log out?'),
//                           actions: [
//                             TextButton(
//                               onPressed: () {
//                                 Navigator.of(context).pop();
//                               },
//                               child: const Text('Cancel'),
//                             ),
//                             ElevatedButton(
//                               onPressed: () {
//                                 FirebaseAuth.instance.signOut().then((value) {
//                                   Navigator.push(
//                                       context,
//                                       MaterialPageRoute(
//                                           builder: (context) =>
//                                               SignInScreen()));
//                                 });
//                               },
//                               child: const Text('Logout'),
//                             ),
//                           ],
//                         ),
//                       );
//                     }
//                   },
//                   itemBuilder: (BuildContext context) {
//                     return [
//                       const PopupMenuItem(
//                         value: 'logout',
//                         child: Text('Logout'),
//                       ),
//                     ];
//                   },
//                 ),
//               ],
//             ),
//             const SizedBox(height: 20),
//             Container(
//               width: MediaQuery.of(context).size.width,
//               height: MediaQuery.of(context).size.width / 2,
//               decoration: BoxDecoration(
//                 gradient: LinearGradient(
//                   colors: [
//                     Theme.of(context).colorScheme.primary,
//                     Theme.of(context).colorScheme.secondary,
//                     Theme.of(context).colorScheme.tertiary,
//                   ],
//                   transform: const GradientRotation(pi / 4),
//                 ),
//                 borderRadius: BorderRadius.circular(25),
//                 boxShadow: [
//                   BoxShadow(
//                     blurRadius: 4,
//                     color: Colors.grey.shade300,
//                     offset: const Offset(5, 5),
//                   ),
//                 ],
//               ),
//               child: Column(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   const Text(
//                     'Total Balance',
//                     style: TextStyle(
//                       fontSize: 16,
//                       color: Colors.white,
//                       fontWeight: FontWeight.w600,
//                     ),
//                   ),
//                   const SizedBox(height: 20),
//                   const Text(
//                     '\$ 4800.00',
//                     style: TextStyle(
//                       fontSize: 40,
//                       color: Colors.white,
//                       fontWeight: FontWeight.bold,
//                     ),
//                   ),
//                   Padding(
//                     padding: const EdgeInsets.symmetric(
//                         vertical: 12, horizontal: 20),
//                     child: Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                       children: [
//                         Row(
//                           children: [
//                             Container(
//                               width: 25,
//                               height: 25,
//                               decoration: const BoxDecoration(
//                                 color: Colors.white30,
//                                 shape: BoxShape.circle,
//                               ),
//                               child: const Center(
//                                 child: Icon(
//                                   CupertinoIcons.arrow_up,
//                                   size: 12,
//                                   color: Colors.greenAccent,
//                                 ),
//                               ),
//                             ),
//                             const SizedBox(width: 8),
//                             const Column(
//                               crossAxisAlignment: CrossAxisAlignment.start,
//                               children: [
//                                 Text(
//                                   'Income',
//                                   style: TextStyle(
//                                     fontSize: 14,
//                                     color: Colors.white,
//                                     fontWeight: FontWeight.w400,
//                                   ),
//                                 ),
//                                 Text(
//                                   '\$ 2500.00',
//                                   style: TextStyle(
//                                     fontSize: 14,
//                                     color: Colors.white,
//                                     fontWeight: FontWeight.w600,
//                                   ),
//                                 ),
//                               ],
//                             ),
//                           ],
//                         ),
//                         Row(
//                           children: [
//                             Container(
//                               width: 25,
//                               height: 25,
//                               decoration: const BoxDecoration(
//                                 color: Colors.white30,
//                                 shape: BoxShape.circle,
//                               ),
//                               child: const Center(
//                                 child: Icon(
//                                   CupertinoIcons.arrow_down,
//                                   size: 12,
//                                   color: Colors.redAccent,
//                                 ),
//                               ),
//                             ),
//                             const SizedBox(width: 8),
//                             const Column(
//                               crossAxisAlignment: CrossAxisAlignment.start,
//                               children: [
//                                 Text(
//                                   'Expenses',
//                                   style: TextStyle(
//                                     fontSize: 14,
//                                     color: Colors.white,
//                                     fontWeight: FontWeight.w400,
//                                   ),
//                                 ),
//                                 Text(
//                                   '\$ 800.00',
//                                   style: TextStyle(
//                                     fontSize: 14,
//                                     color: Colors.white,
//                                     fontWeight: FontWeight.w600,
//                                   ),
//                                 ),
//                               ],
//                             ),
//                           ],
//                         ),
//                       ],
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//             const SizedBox(height: 40),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 Text(
//                   'Transactions',
//                   style: TextStyle(
//                     fontSize: 16,
//                     color: Theme.of(context).colorScheme.onBackground,
//                     fontWeight: FontWeight.bold,
//                   ),
//                 ),
//                 ToggleButtons(
//                   children: const [
//                     Padding(
//                       padding: EdgeInsets.symmetric(horizontal: 16),
//                       child: Text('Expenses'),
//                     ),
//                     Padding(
//                       padding: EdgeInsets.symmetric(horizontal: 16),
//                       child: Text('Income'),
//                     ),
//                   ],
//                   isSelected: [showExpenses, !showExpenses],
//                   onPressed: (int index) {
//                     setState(() {
//                       showExpenses = index == 0;
//                     });
//                   },
//                 ),
//               ],
//             ),
//             const SizedBox(height: 20),
//             Expanded(
//               child: ListView.builder(
//                 itemCount: showExpenses ? expenses.length : incomes.length,
//                 itemBuilder: (context, int i) {
//                   if (showExpenses) {
//                     final expense = expenses[i];
//                     return buildTransactionItem(
//                       expense.category,
//                       expense.amount.toDouble(), // Ensure amount is double
//                       expense.date.toDate(),
//                     );
//                   } else {
//                     final income = incomes[i];
//                     return buildTransactionItem(
//                       income.category,
//                       income.amount.toDouble(), // Ensure amount is double
//                       income.date.toDate(),
//                     );
//                   }
//                 },
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   Widget buildTransactionItem(Category category, double amount, DateTime date) {
//     return Padding(
//       padding: const EdgeInsets.only(bottom: 16.0),
//       child: Container(
//         decoration: BoxDecoration(
//           color: Colors.white,
//           borderRadius: BorderRadius.circular(12),
//         ),
//         child: Padding(
//           padding: const EdgeInsets.all(16.0),
//           child: Row(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: [
//               Row(
//                 children: [
//                   Stack(
//                     alignment: Alignment.center,
//                     children: [
//                       Container(
//                         width: 50,
//                         height: 50,
//                         decoration: BoxDecoration(
//                           color: Color(category.color),
//                           shape: BoxShape.circle,
//                         ),
//                       ),
//                       Image.asset(
//                         'assets/${category.icon}.png',
//                         scale: 2,
//                         color: Colors.white,
//                       ),
//                     ],
//                   ),
//                   const SizedBox(width: 12),
//                   Text(
//                     category.name,
//                     style: TextStyle(
//                       fontSize: 14,
//                       color: Theme.of(context).colorScheme.onBackground,
//                       fontWeight: FontWeight.w500,
//                     ),
//                   ),
//                 ],
//               ),
//               Column(
//                 crossAxisAlignment: CrossAxisAlignment.end,
//                 children: [
//                   Text(
//                     "\$${amount.toStringAsFixed(2)}",
//                     style: TextStyle(
//                       fontSize: 14,
//                       color: Theme.of(context).colorScheme.onBackground,
//                       fontWeight: FontWeight.w400,
//                     ),
//                   ),
//                   Text(
//                     DateFormat('dd/MM/yyyy').format(date),
//                     style: TextStyle(
//                       fontSize: 14,
//                       color: Theme.of(context).colorScheme.onBackground,
//                       fontWeight: FontWeight.w400,
//                     ),
//                   ),
//                 ],
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }










//new nice code
import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:expense_repository/expense_repository.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:mad_my_app/screens/home/views/Service/todo_database_service.dart';
import 'package:mad_my_app/screens/home/views/profile_screen.dart';
import 'package:mad_my_app/screens/home/views/todo_list.dart';
import 'package:mad_my_app/screens/signin_screen.dart';
import 'package:mad_my_app/screens/view_all.dart';

class MainScreen extends StatefulWidget {
  final String userId;

  const MainScreen({Key? key, required this.userId}) : super(key: key);

  @override
  _MainScreenState createState() => _MainScreenState();
}
//late ToDoDatabaseService todoDatabaseService;
class _MainScreenState extends State<MainScreen> {
  late ToDoDatabaseService todoDatabaseService;
  List<Expense> expenses = [];
  List<Income> incomes = [];
  bool showExpenses = true;
  double totalBalance = 0.0;
  bool isLoading = true;
  String _userName = 'John Doe';
  String? _profileImageUrl;
  double totalIncome = 0.0;
  double totalExpense = 0.0;

  @override
  void initState() {
    super.initState();
    fetchTransactions();
    _fetchUserNameAndImage();
    todoDatabaseService = ToDoDatabaseService(widget.userId);
  }

  // Future<void> _fetchUserName() async {
  //   try {
  //     final userDoc =
  //         FirebaseFirestore.instance.collection('users').doc(widget.userId);
  //     final userSnapshot = await userDoc.get();

  //     if (userSnapshot.exists) {
  //       setState(() {
  //         _userName = userSnapshot.data()?['name'] ?? 'John Doe';
  //         _profileImageUrl = userSnapshot.data()?['profileImageUrl'];
  //       });
  //     }
  //   } catch (e) {
  //     print('Error fetching user name: $e');
  //   }
  // }
  Future<void> _fetchUserNameAndImage() async {
    try {
      final userDoc =
          FirebaseFirestore.instance.collection('users').doc(widget.userId);
      final userSnapshot = await userDoc.get();

      if (userSnapshot.exists) {
        setState(() {
          _userName = userSnapshot.data()?['name'] ?? 'John Doe';
          _profileImageUrl = userSnapshot.data()?['profileImageUrl'];
        });
      }
    } catch (e) {
      print('Error fetching user name and image: $e');
    }
  }

  Future<void> fetchTransactions() async {
    try {
      print('Fetching transactions...');
      final userExpenseCollection = FirebaseFirestore.instance
          .collection('users')
          .doc(widget.userId)
          .collection('expenses');
      final userIncomeCollection = FirebaseFirestore.instance
          .collection('users')
          .doc(widget.userId)
          .collection('incomes');
      final balanceDoc = FirebaseFirestore.instance
          .collection('users')
          .doc(widget.userId)
          .collection('balance')
          .doc('balance');
      final todoCollection = FirebaseFirestore.instance
        .collection('users')
        .doc(widget.userId)
        .collection('todos');
      final incDoc = FirebaseFirestore.instance
          .collection('users')
          .doc(widget.userId)
          .collection('totalincome')
          .doc('totalincome');
      final expDoc = FirebaseFirestore.instance
          .collection('users')
          .doc(widget.userId)
          .collection('totalexpense')
          .doc('totalexpense');


      // Fetch expenses
      final expenseSnapshot = await userExpenseCollection.get();
      final incomeSnapshot = await userIncomeCollection.get();
      final balanceSnapshot = await balanceDoc.get();
      final todoSnapshot = await todoCollection.get();
      final incSnapshot = await incDoc.get();
      final expSnapshot = await expDoc.get();

      print('Fetched data from Firestore');

      if (balanceSnapshot.exists) {
        print('Balance exists');
        setState(() {
          totalBalance = balanceSnapshot.data()?['totalBalance'] ?? 0.0;
          isLoading = false;
        });
      } else {
        print('Balance does not exist, prompting initial balance');
        promptInitialBalance();
      }

      setState(() {
        expenses = expenseSnapshot.docs
            .map((doc) => Expense.fromDocument(doc))
            .toList();
        incomes =
            incomeSnapshot.docs.map((doc) => Income.fromDocument(doc)).toList();
      });
      totalIncome = incomes.fold(0.0, (sum, item) => sum + item.amount);
      totalExpense = expenses.fold(0.0, (sum, item) => sum + item.amount);

      // Update Firestore with total income and total expense
      await incDoc.set({'totalincome': totalIncome});
      await expDoc.set({'totalexpense': totalExpense});


      print('Expenses and incomes loaded');
    } catch (e) {
      print('Error fetching transactions: $e');
    }
  }

  Future<void> promptInitialBalance() async {
    final TextEditingController balanceController = TextEditingController();

    await showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Set Initial Balance'),
        content: TextField(
          controller: balanceController,
          keyboardType: TextInputType.number,
          decoration: const InputDecoration(
            labelText: 'Enter your initial balance',
          ),
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: const Text('Cancel'),
          ),
          ElevatedButton(
            onPressed: () {
              final initialBalance = double.tryParse(balanceController.text);
              if (initialBalance != null) {
                setState(() {
                  totalBalance = initialBalance;
                });
                FirebaseFirestore.instance
                    .collection('users')
                    .doc(widget.userId)
                    .collection('balance')
                    .doc('balance')
                    .set({'totalBalance': initialBalance});
                Navigator.of(context).pop();
              }
            },
            child: const Text('Set Balance'),
          ),
        ],
      ),
    );
  }
  
  Future<void> updateTotalBalance(double amount, bool isIncome) async {
    if (isIncome) {
      totalIncome += amount;
      totalBalance += amount;
    } else {
      totalExpense += amount;
      totalBalance -= amount;
    }
    await FirebaseFirestore.instance
        .collection('users')
        .doc(widget.userId)
        .collection('balance')
        .doc('balance')
        .update({'totalBalance': totalBalance});
  }

  @override
  Widget build(BuildContext context) {
    if (isLoading) {
      return const Center(child: CircularProgressIndicator());
    }
  return Scaffold(
    backgroundColor: Colors.grey[200],
    body: SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25.0, vertical: 10),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    GestureDetector(
                      onTap: () async {
                        final result = await Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) =>
                                ProfileScreen(userId: widget.userId),
                          ),
                        );
                        if (result != null) {
                          setState(() {
                            _userName = result['name'] ?? _userName;
                            _profileImageUrl =
                                result['profileImageUrl'] ?? _profileImageUrl;
                          });
                        }
                      },
                      child: CircleAvatar(
                        radius: 25,
                        backgroundImage: _profileImageUrl != null
                            ? NetworkImage(_profileImageUrl!)
                            : null,
                        child: _profileImageUrl == null
                            ? const Icon(Icons.person, size: 50)
                            : null,
                      ),
                    ),

                    const SizedBox(width: 8),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Welcome!",
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w600,
                            color: Theme.of(context).colorScheme.outline,
                          ),
                        ),
                        Text(
                          _userName,
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Theme.of(context).colorScheme.onBackground,
                          ),
                        ),
                      ],
                    ),

                    // Stack(
                    //   alignment: Alignment.center,
                    //   children: [
                    //     Container(
                    //       width: 50,
                    //       height: 50,
                    //       decoration: BoxDecoration(
                    //         shape: BoxShape.circle,
                    //         color: Colors.yellow[700],
                    //       ),
                    //     ),
                    //     Icon(
                    //       CupertinoIcons.person_fill,
                    //       color: Colors.yellow[800],
                    //     ),
                    //   ],
                    // ),
                    // const SizedBox(width: 8),
                    // Column(
                    //   crossAxisAlignment: CrossAxisAlignment.start,
                    //   children: [
                    //     Text(
                    //       "Welcome!",
                    //       style: TextStyle(
                    //         fontSize: 12,
                    //         fontWeight: FontWeight.w600,
                    //         color: Theme.of(context).colorScheme.outline,
                    //       ),
                    //     ),
                    //     Text(
                    //       "John Doe",
                    //       style: TextStyle(
                    //         fontSize: 18,
                    //         fontWeight: FontWeight.bold,
                    //         color: Theme.of(context).colorScheme.onBackground,
                    //       ),
                    //     ),
                    //   ],
                    // ),
                  ],
                ),
                PopupMenuButton<String>(
                  icon: Icon(CupertinoIcons.ellipsis),
                  onSelected: (value) {
                    if (value == 'logout') {
                      showDialog(
                        context: context,
                        builder: (context) => AlertDialog(
                          title: const Text('Logout'),
                          content:
                              const Text('Are you sure you want to log out?'),
                          actions: [
                            TextButton(
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                              child: const Text('Cancel'),
                            ),
                            ElevatedButton(
                              onPressed: () {
                                FirebaseAuth.instance.signOut().then((value) {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              SignInScreen()));
                                });
                              },
                              child: const Text('Logout'),
                            ),
                          ],
                        ),
                      );
                    } else if (value == 'edit_balance') {
                      promptEditBalance();
                    } else if (value == 'to_do') {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => TodoList(userId: widget.userId),
                        ),
                      );
                    }
                    // } else if (value == 'to_do') {
                    //     Navigator.push(
                    //       context,
                    //       MaterialPageRoute(
                    //           builder: (context) => TodoList(userId: widget.userId,)),
                    //     );
                    //   }
                  },
                  itemBuilder: (BuildContext context) {
                    return [
                      const PopupMenuItem(
                        value: 'logout',
                        child: Text('Logout'),
                      ),
                      const PopupMenuItem(
                        value: 'edit_balance',
                        child: Text('Edit Balance'),
                      ),
                      const PopupMenuItem(
                          value: 'to_do',
                          child: Text('To Do'),
                        ),
                    ];
                  },
                ),
              ],
            ),
            const SizedBox(height: 20),
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.width / 2,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Theme.of(context).colorScheme.primary,
                    Theme.of(context).colorScheme.secondary,
                    Theme.of(context).colorScheme.tertiary,
                  ],
                  transform: const GradientRotation(pi / 4),
                ),
                borderRadius: BorderRadius.circular(25),
                boxShadow: [
                  BoxShadow(
                    blurRadius: 4,
                    color: Colors.grey.shade300,
                    offset: const Offset(5, 5),
                  ),
                ],
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'Total Balance',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: 20),
                  Text(
                    '\$${totalBalance.toStringAsFixed(2)}',
                    style: const TextStyle(
                      fontSize: 40,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 12, horizontal: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Container(
                              width: 25,
                              height: 25,
                              decoration: const BoxDecoration(
                                color: Colors.white30,
                                shape: BoxShape.circle,
                              ),
                              child: const Center(
                                child: Icon(
                                  CupertinoIcons.arrow_up,
                                  size: 12,
                                  color: Colors.greenAccent,
                                ),
                              ),
                            ),
                            const SizedBox(width: 8),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Income',
                                  style: TextStyle(
                                    fontSize: 14,
                                    color: Colors.white,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                                Text(
                                  '\$${totalIncome.toStringAsFixed(2)}',
                                  style: TextStyle(
                                    fontSize: 14,
                                    color: Colors.white,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Container(
                              width: 25,
                              height: 25,
                              decoration: const BoxDecoration(
                                color: Colors.white30,
                                shape: BoxShape.circle,
                              ),
                              child: const Center(
                                child: Icon(
                                  CupertinoIcons.arrow_down,
                                  size: 12,
                                  color: Colors.redAccent,
                                ),
                              ),
                            ),
                            const SizedBox(width: 8),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Expenses',
                                  style: TextStyle(
                                    fontSize: 14,
                                    color: Colors.white,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                                Text(
                                  '\$${totalExpense.toStringAsFixed(2)}',
                                  style: TextStyle(
                                    fontSize: 14,
                                    color: Colors.white,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 40),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Transactions',
                  style: TextStyle(
                    fontSize: 16,
                    color: Theme.of(context).colorScheme.onBackground,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                ToggleButtons(
                  children: const [
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16),
                      child: Text('Expenses'),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16),
                      child: Text('Income'),
                    ),
                  ],
                  isSelected: [showExpenses, !showExpenses],
                  onPressed: (int index) {
                    setState(() {
                      showExpenses = index == 0;
                    });
                  },
                ),
              ],
            ),
            const SizedBox(height: 20),
            Expanded(
              child: ListView.builder(
                itemCount: showExpenses ? expenses.length : incomes.length,
                itemBuilder: (context, int i) {
                  if (showExpenses) {
                    final expense = expenses[i];
                    return buildTransactionItem(
                      expense.category,
                      expense.amount.toDouble(), // Ensure amount is double
                      expense.date.toDate(),
                    );
                  } else {
                    final income = incomes[i];
                    return buildTransactionItem(
                      income.category,
                      income.amount.toDouble(), // Ensure amount is double
                      income.date.toDate(),
                    );
                  }
                },
              ),
            ),
          ],
        ),
      ),
    )
  );
    
  }

  Future<void> promptEditBalance() async {
    final TextEditingController balanceController = TextEditingController();

    await showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Edit Balance'),
        content: TextField(
          controller: balanceController,
          keyboardType: TextInputType.number,
          decoration: const InputDecoration(
            labelText: 'Enter your new balance',
          ),
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: const Text('Cancel'),
          ),
          ElevatedButton(
            onPressed: () {
              final newBalance = double.tryParse(balanceController.text);
              if (newBalance != null) {
                setState(() {
                  totalBalance = newBalance;
                });
                FirebaseFirestore.instance
                    .collection('users')
                    .doc(widget.userId)
                    .collection('balance')
                    .doc('balance')
                    .update({'totalBalance': newBalance});
                Navigator.of(context).pop();
              }
            },
            child: const Text('Update Balance'),
          ),
        ],
      ),
    );
  }

  Widget buildTransactionItem(Category category, double amount, DateTime date) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16.0),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Stack(
                    alignment: Alignment.center,
                    children: [
                      Container(
                        width: 50,
                        height: 50,
                        decoration: BoxDecoration(
                          color: Color(category.color),
                          shape: BoxShape.circle,
                        ),
                      ),
                      Image.asset(
                        'assets/${category.icon}.png',
                        scale: 2,
                        color: Colors.white,
                      ),
                    ],
                  ),
                  const SizedBox(width: 12),
                  Text(
                    category.name,
                    style: TextStyle(
                      fontSize: 14,
                      color: Theme.of(context).colorScheme.onBackground,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    "\$${amount.toStringAsFixed(2)}",
                    style: TextStyle(
                      fontSize: 14,
                      color: Theme.of(context).colorScheme.onBackground,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  Text(
                    DateFormat('dd/MM/yyyy').format(date),
                    style: TextStyle(
                      fontSize: 14,
                      color: Theme.of(context).colorScheme.onBackground,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}



// import 'dart:math';

// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:expense_repository/expense_repository.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:intl/intl.dart';
// import 'package:mad_my_app/screens/home/views/Service/todo_database_service.dart';
// import 'package:mad_my_app/screens/home/views/profile_screen.dart';
// import 'package:mad_my_app/screens/home/views/todo_list.dart';
// import 'package:mad_my_app/screens/signin_screen.dart';

// class MainScreen extends StatefulWidget {
//   final String userId;

//   const MainScreen({Key? key, required this.userId}) : super(key: key);

//   @override
//   _MainScreenState createState() => _MainScreenState();
// }

// class _MainScreenState extends State<MainScreen> {
//   late ToDoDatabaseService todoDatabaseService;
//   List<Expense> expenses = [];
//   List<Income> incomes = [];
//   bool showExpenses = true;
//   double totalBalance = 0.0;
//   double totalIncome = 0.0;
//   double totalExpense = 0.0;
//   bool isLoading = true;
//   String _userName = 'John Doe';
//   String? _profileImageUrl;

//   @override
//   void initState() {
//     super.initState();
//     fetchTransactions();
//     _fetchUserNameAndImage();
//     todoDatabaseService = ToDoDatabaseService(widget.userId);
//   }

//   Future<void> _fetchUserNameAndImage() async {
//     try {
//       final userDoc =
//           FirebaseFirestore.instance.collection('users').doc(widget.userId);
//       final userSnapshot = await userDoc.get();

//       if (userSnapshot.exists) {
//         setState(() {
//           _userName = userSnapshot.data()?['name'] ?? 'John Doe';
//           _profileImageUrl = userSnapshot.data()?['profileImageUrl'];
//         });
//       }
//     } catch (e) {
//       print('Error fetching user name and image: $e');
//     }
//   }

//   Future<void> fetchTransactions() async {
//     try {
//       final userExpenseCollection = FirebaseFirestore.instance
//           .collection('users')
//           .doc(widget.userId)
//           .collection('expenses');
//       final userIncomeCollection = FirebaseFirestore.instance
//           .collection('users')
//           .doc(widget.userId)
//           .collection('incomes');
//       final balanceDoc = FirebaseFirestore.instance
//           .collection('users')
//           .doc(widget.userId)
//           .collection('balance')
//           .doc('balance');
      // final incDoc = FirebaseFirestore.instance
      //     .collection('users')
      //     .doc(widget.userId)
      //     .collection('totalincome')
      //     .doc('totalincome');
      // final expDoc = FirebaseFirestore.instance
      //     .collection('users')
      //     .doc(widget.userId)
      //     .collection('totalexpense')
      //     .doc('totalexpense');

//       // Fetch expenses and incomes
//       final expenseSnapshot = await userExpenseCollection.get();
//       final incomeSnapshot = await userIncomeCollection.get();
//       final balanceSnapshot = await balanceDoc.get();
      // final incSnapshot = await incDoc.get();
      // final expSnapshot = await expDoc.get();

//       setState(() {
//         expenses = expenseSnapshot.docs
//             .map((doc) => Expense.fromDocument(doc))
//             .toList();
//         incomes =
//             incomeSnapshot.docs.map((doc) => Income.fromDocument(doc)).toList();
//       });

//       // Calculate total income and total expense
//       totalIncome = incomes.fold(0.0, (sum, item) => sum + item.amount);
//       totalExpense = expenses.fold(0.0, (sum, item) => sum + item.amount);

//       // Update Firestore with total income and total expense
//       await incDoc.set({'totalincome': totalIncome});
//       await expDoc.set({'totalexpense': totalExpense});

//       if (balanceSnapshot.exists) {
//         setState(() {
//           totalBalance = balanceSnapshot.data()?['totalBalance'] ?? 0.0;
//           isLoading = false;
//         });
//       } else {
//         promptInitialBalance();
//       }

//       print('Expenses and incomes loaded');
//     } catch (e) {
//       print('Error fetching transactions: $e');
//     }
//   }

//   Future<void> promptEditBalance() async {
//     final TextEditingController balanceController = TextEditingController();

//     await showDialog(
//       context: context,
//       builder: (context) => AlertDialog(
//         title: const Text('Edit Balance'),
//         content: TextField(
//           controller: balanceController,
//           keyboardType: TextInputType.number,
//           decoration: const InputDecoration(
//             labelText: 'Enter your new balance',
//           ),
//         ),
//         actions: [
//           TextButton(
//             onPressed: () {
//               Navigator.of(context).pop();
//             },
//             child: const Text('Cancel'),
//           ),
//           ElevatedButton(
//             onPressed: () {
//               final newBalance = double.tryParse(balanceController.text);
//               if (newBalance != null) {
//                 setState(() {
//                   totalBalance = newBalance;
//                 });
//                 FirebaseFirestore.instance
//                     .collection('users')
//                     .doc(widget.userId)
//                     .collection('balance')
//                     .doc('balance')
//                     .update({'totalBalance': newBalance});
//                 Navigator.of(context).pop();
//               }
//             },
//             child: const Text('Update Balance'),
//           ),
//         ],
//       ),
//     );
//   }

//   Future<void> promptInitialBalance() async {
//     final TextEditingController balanceController = TextEditingController();

//     await showDialog(
//       context: context,
//       builder: (context) => AlertDialog(
//         title: const Text('Set Initial Balance'),
//         content: TextField(
//           controller: balanceController,
//           keyboardType: TextInputType.number,
//           decoration: const InputDecoration(
//             labelText: 'Enter your initial balance',
//           ),
//         ),
//         actions: [
//           TextButton(
//             onPressed: () {
//               Navigator.of(context).pop();
//             },
//             child: const Text('Cancel'),
//           ),
//           ElevatedButton(
//             onPressed: () {
//               final initialBalance = double.tryParse(balanceController.text);
//               if (initialBalance != null) {
//                 setState(() {
//                   totalBalance = initialBalance;
//                 });
//                 FirebaseFirestore.instance
//                     .collection('users')
//                     .doc(widget.userId)
//                     .collection('balance')
//                     .doc('balance')
//                     .set({'totalBalance': initialBalance});
//                 Navigator.of(context).pop();
//               }
//             },
//             child: const Text('Set Balance'),
//           ),
//         ],
//       ),
//     );
//   }

//   Future<void> updateTotalBalance(double amount, bool isIncome) async {
//     if (isIncome) {
//       totalIncome += amount;
//       totalBalance += amount;
//     } else {
//       totalExpense += amount;
//       totalBalance -= amount;
//     }
//     await FirebaseFirestore.instance
//         .collection('users')
//         .doc(widget.userId)
//         .collection('balance')
//         .doc('balance')
//         .update({'totalBalance': totalBalance});
//     await FirebaseFirestore.instance
//         .collection('users')
//         .doc(widget.userId)
//         .collection('totalincome')
//         .doc('totalincome')
//         .update({'totalincome': totalIncome});
//     await FirebaseFirestore.instance
//         .collection('users')
//         .doc(widget.userId)
//         .collection('totalexpense')
//         .doc('totalexpense')
//         .update({'totalexpense': totalExpense});
//   }

//   @override
//   Widget build(BuildContext context) {
//     if (isLoading) {
//       return const Center(child: CircularProgressIndicator());
//     }
//     return Scaffold(
//       backgroundColor: Colors.grey[200],
//       body: SafeArea(
//         child: Padding(
//           padding: const EdgeInsets.symmetric(horizontal: 25.0, vertical: 10),
//           child: Column(
//             children: [
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   Row(
//                     children: [
//                       GestureDetector(
//                         onTap: () async {
//                           final result = await Navigator.of(context).push(
//                             MaterialPageRoute(
//                               builder: (context) =>
//                                   ProfileScreen(userId: widget.userId),
//                             ),
//                           );
//                           if (result != null) {
//                             setState(() {
//                               _userName = result['name'] ?? _userName;
//                               _profileImageUrl =
//                                   result['profileImageUrl'] ?? _profileImageUrl;
//                             });
//                           }
//                         },
//                         child: CircleAvatar(
//                           radius: 25,
//                           backgroundImage: _profileImageUrl != null
//                               ? NetworkImage(_profileImageUrl!)
//                               : null,
//                           child: _profileImageUrl == null
//                               ? const Icon(Icons.person, size: 50)
//                               : null,
//                         ),
//                       ),
//                       const SizedBox(width: 8),
//                       Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           Text(
//                             "Welcome!",
//                             style: TextStyle(
//                               fontSize: 12,
//                               fontWeight: FontWeight.w600,
//                               color: Theme.of(context).colorScheme.outline,
//                             ),
//                           ),
//                           Text(
//                             _userName,
//                             style: TextStyle(
//                               fontSize: 18,
//                               fontWeight: FontWeight.bold,
//                               color: Theme.of(context).colorScheme.onBackground,
//                             ),
//                           ),
//                         ],
//                       ),
//                     ],
//                   ),
//                   PopupMenuButton<String>(
//                     icon: Icon(CupertinoIcons.ellipsis),
//                     onSelected: (value) {
//                       if (value == 'logout') {
//                         showDialog(
//                           context: context,
//                           builder: (context) => AlertDialog(
//                             title: const Text('Logout'),
//                             content:
//                                 const Text('Are you sure you want to log out?'),
//                             actions: [
//                               TextButton(
//                                 onPressed: () {
//                                   Navigator.of(context).pop();
//                                 },
//                                 child: const Text('Cancel'),
//                               ),
//                               ElevatedButton(
//                                 onPressed: () {
//                                   FirebaseAuth.instance.signOut().then((value) {
//                                     Navigator.push(
//                                         context,
//                                         MaterialPageRoute(
//                                             builder: (context) =>
//                                                 SignInScreen()));
//                                   });
//                                 },
//                                 child: const Text('Logout'),
//                               ),
//                             ],
//                           ),
//                         );
//                       } else if (value == 'edit_balance') {
//                         promptEditBalance();
//                       } else if (value == 'to_do') {
//                         Navigator.push(
//                           context,
//                           MaterialPageRoute(
//                             builder: (context) =>
//                                 TodoList(userId: widget.userId),
//                           ),
//                         );
//                       }
//                     },
//                     itemBuilder: (BuildContext context) {
//                       return [
//                         const PopupMenuItem(
//                           value: 'logout',
//                           child: Text('Logout'),
//                         ),
//                         const PopupMenuItem(
//                           value: 'edit_balance',
//                           child: Text('Edit Balance'),
//                         ),
//                         const PopupMenuItem(
//                           value: 'to_do',
//                           child: Text('To-Do List'),
//                         ),
//                       ];
//                     },
//                   ),
//                 ],
//               ),
//               const SizedBox(height: 15),
//               Container(
//                 padding:
//                     const EdgeInsets.symmetric(horizontal: 20, vertical: 25),
//                 decoration: BoxDecoration(
//                   color: Theme.of(context).primaryColor,
//                   borderRadius: BorderRadius.circular(20),
//                 ),
//                 child: Column(
//                   children: [
//                     const Text(
//                       'Total Balance',
//                       style: TextStyle(
//                         fontSize: 16,
//                         color: Colors.white,
//                       ),
//                     ),
//                     const SizedBox(height: 10),
//                     Text(
//                       '\$${totalBalance.toStringAsFixed(2)}',
//                       style: const TextStyle(
//                         fontSize: 40,
//                         color: Colors.white,
//                         fontWeight: FontWeight.bold,
//                       ),
//                     ),
//                     const SizedBox(height: 15),
//                     Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                       children: [
//                         Column(
//                           children: [
//                             const Text(
//                               'Income',
//                               style: TextStyle(
//                                 fontSize: 16,
//                                 color: Colors.white,
//                               ),
//                             ),
//                             const SizedBox(height: 5),
//                             Text(
//                               '\$${totalIncome.toStringAsFixed(2)}',
//                               style: const TextStyle(
//                                 fontSize: 20,
//                                 color: Colors.white,
//                                 fontWeight: FontWeight.bold,
//                               ),
//                             ),
//                           ],
//                         ),
//                         Column(
//                           children: [
//                             const Text(
//                               'Expenses',
//                               style: TextStyle(
//                                 fontSize: 16,
//                                 color: Colors.white,
//                               ),
//                             ),
//                             const SizedBox(height: 5),
//                             Text(
//                               '\$${totalExpense.toStringAsFixed(2)}',
//                               style: const TextStyle(
//                                 fontSize: 20,
//                                 color: Colors.white,
//                                 fontWeight: FontWeight.bold,
//                               ),
//                             ),
//                           ],
//                         ),
//                       ],
//                     ),
//                   ],
//                 ),
//               ),
//               const SizedBox(height: 15),
//               // Container(
//               //   decoration: BoxDecoration(
//               //     color: Colors.white,
//               //     borderRadius: BorderRadius.circular(20),
//               //   ),
//               //   child: Padding(
//               //     padding: const EdgeInsets.all(8.0),
//               //     child: Row(
//               //       mainAxisAlignment: MainAxisAlignment.spaceAround,
//               //       children: [
//               //         GestureDetector(
//               //           onTap: () {
//               //             setState(() {
//               //               showExpenses = true;
//               //             });
//               //           },
//               //           child: Column(
//               //             children: [
//               //               Icon(
//               //                 Icons.arrow_upward,
//               //                 color: showExpenses
//               //                     ? Colors.red
//               //                     : Colors.grey[400],
//               //               ),
//               //               const SizedBox(height: 5),
//               //               Text(
//               //                 'Expenses',
//               //                 style: TextStyle(
//               //                   color: showExpenses
//               //                       ? Colors.red
//               //                       : Colors.grey[400],
//               //                   fontWeight: FontWeight.bold,
//               //                 ),
//               //               ),
//               //             ],
//               //           ),
//               //         ),
//               //         GestureDetector(
//               //           onTap: () {
//               //             setState(() {
//               //               showExpenses = false;
//               //             });
//               //           },
//               //           child: Column(
//               //             children: [
//               //               Icon(
//               //                 Icons.arrow_downward,
//               //                 color: showExpenses
//               //                     ? Colors.grey[400]
//               //                     : Colors.green,
//               //               ),
//               //               const SizedBox(height: 5),
//               //               Text(
//               //                 'Income',
//               //                 style: TextStyle(
//               //                   color: showExpenses
//               //                       ? Colors.grey[400]
//               //                       : Colors.green,
//               //                   fontWeight: FontWeight.bold,
//               //                 ),
//               //               ),
//               //             ],
//               //           ),
//               //         ),
//               //       ],
//               //     ),
//               //   ),
//               // ),
//               const SizedBox(height: 20),
//               // Expanded(
//               //   child: StreamBuilder(
//               //     stream: showExpenses
//               //         ? FirebaseFirestore.instance
//               //             .collection('users')
//               //             .doc(widget.userId)
//               //             .collection('expenses')
//               //             .snapshots()
//               //         : FirebaseFirestore.instance
//               //             .collection('users')
//               //             .doc(widget.userId)
//               //             .collection('incomes')
//               //             .snapshots(),
//               //     builder: (context, snapshot) {
//               //       if (snapshot.connectionState == ConnectionState.waiting) {
//               //         return const Center(child: CircularProgressIndicator());
//               //       }
//               //       if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
//               //         return const Center(
//               //           child: Text('No transactions available'),
//               //         );
//               //       }

//               //       final transactions = snapshot.data!.docs;

//               //       return ListView.builder(
//               //         itemCount: transactions.length,
//               //         itemBuilder: (context, index) {
//               //           final transaction = transactions[index];
//               //           final isExpense = showExpenses;

//               //           return ListTile(
//               //             title: Text(transaction['category']),
//               //             subtitle: Text(
//               //               DateFormat.yMMMd()
//               //                   .format(transaction['date'].toDate()),
//               //             ),
//               //             trailing: Text(
//               //               '\$${transaction['amount'].toStringAsFixed(2)}',
//               //               style: TextStyle(
//               //                 color: isExpense ? Colors.red : Colors.green,
//               //               ),
//               //             ),
//               //             onLongPress: () async {
//               //               await FirebaseFirestore.instance
//               //                   .collection('users')
//               //                   .doc(widget.userId)
//               //                   .collection(isExpense ? 'expenses' : 'incomes')
//               //                   .doc(transaction.id)
//               //                   .delete();
//               //               fetchTransactions();
//               //             },
//               //           );
//               //         },
//               //       );
//               //     },
//               //   ),
//               // ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }



// //new mod code
// import 'dart:math';

// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:expense_repository/expense_repository.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:intl/intl.dart';
// import 'package:mad_my_app/screens/home/views/Service/todo_database_service.dart';
// import 'package:mad_my_app/screens/home/views/profile_screen.dart';
// import 'package:mad_my_app/screens/home/views/todo_list.dart';
// import 'package:mad_my_app/screens/signin_screen.dart';
// import 'package:mad_my_app/screens/view_all.dart';

// class MainScreen extends StatefulWidget {
//   final String userId;

//   const MainScreen({Key? key, required this.userId}) : super(key: key);

//   @override
//   _MainScreenState createState() => _MainScreenState();
// }
// //late ToDoDatabaseService todoDatabaseService;
// class _MainScreenState extends State<MainScreen> {
//   late ToDoDatabaseService todoDatabaseService;
//   List<Expense> expenses = [];
//   List<Income> incomes = [];
//   bool showExpenses = true;
//   double totalBalance = 0.0;
//   bool isLoading = true;
//   String _userName = 'John Doe';
//   String? _profileImageUrl;
//   double insum = 0.0;
//   double exsum = 0.0;

//   @override
//   void initState() {
//     super.initState();
//     fetchTransactions();
//     _fetchUserNameAndImage();
//     todoDatabaseService = ToDoDatabaseService(widget.userId);
//   }

//   // Future<void> _fetchUserName() async {
//   //   try {
//   //     final userDoc =
//   //         FirebaseFirestore.instance.collection('users').doc(widget.userId);
//   //     final userSnapshot = await userDoc.get();

//   //     if (userSnapshot.exists) {
//   //       setState(() {
//   //         _userName = userSnapshot.data()?['name'] ?? 'John Doe';
//   //         _profileImageUrl = userSnapshot.data()?['profileImageUrl'];
//   //       });
//   //     }
//   //   } catch (e) {
//   //     print('Error fetching user name: $e');
//   //   }
//   // }
//   Future<void> _fetchUserNameAndImage() async {
//     try {
//       final userDoc =
//           FirebaseFirestore.instance.collection('users').doc(widget.userId);
//       final userSnapshot = await userDoc.get();

//       if (userSnapshot.exists) {
//         setState(() {
//           _userName = userSnapshot.data()?['name'] ?? 'John Doe';
//           _profileImageUrl = userSnapshot.data()?['profileImageUrl'];
//         });
//       }
//     } catch (e) {
//       print('Error fetching user name and image: $e');
//     }
//   }

//   Future<void> fetchTransactions() async {
//     try {
//       print('Fetching transactions...');
//       final userExpenseCollection = FirebaseFirestore.instance
//           .collection('users')
//           .doc(widget.userId)
//           .collection('expenses');
//       final userIncomeCollection = FirebaseFirestore.instance
//           .collection('users')
//           .doc(widget.userId)
//           .collection('incomes');
//       final balanceDoc = FirebaseFirestore.instance
//           .collection('users')
//           .doc(widget.userId)
//           .collection('balance')
//           .doc('balance');
//       final todoCollection = FirebaseFirestore.instance
//         .collection('users')
//         .doc(widget.userId)
//         .collection('todos');
//       var inc = FirebaseFirestore.instance
//           .collection('users')
//           .doc(widget.userId)
//           .collection('totalincome')
//           .doc('totalincome');
//       final exp = FirebaseFirestore.instance
//           .collection('users')
//           .doc(widget.userId)
//           .collection('totalexpense')
//           .doc('totalexpense');

//       // Fetch expenses
//       final expenseSnapshot = await userExpenseCollection.get();
//       final incomeSnapshot = await userIncomeCollection.get();
//       final balanceSnapshot = await balanceDoc.get();
//       final todoSnapshot = await todoCollection.get();
//       final incSnapshot = await inc.get();
//       final expSnapshot = await exp.get();

//       print('Fetched data from Firestore');

//       if (balanceSnapshot.exists) {
//         print('Balance exists');
//         setState(() {
//           totalBalance = balanceSnapshot.data()?['totalBalance'] ?? 0.0;
//           isLoading = false;
//         });
//       } else {
//         print('Balance does not exist, prompting initial balance');
//         promptInitialBalance();
//       }

//       setState(() {
//         expenses = expenseSnapshot.docs
//             .map((doc) => Expense.fromDocument(doc))
//             .toList();
//         incomes =
//             incomeSnapshot.docs.map((doc) => Income.fromDocument(doc)).toList();
//       });

//       print('Expenses and incomes loaded');
//     } catch (e) {
//       print('Error fetching transactions: $e');
//     }
//   }

//   Future<void> promptInitialBalance() async {
//     final TextEditingController balanceController = TextEditingController();

//     await showDialog(
//       context: context,
//       builder: (context) => AlertDialog(
//         title: const Text('Set Initial Balance'),
//         content: TextField(
//           controller: balanceController,
//           keyboardType: TextInputType.number,
//           decoration: const InputDecoration(
//             labelText: 'Enter your initial balance',
//           ),
//         ),
//         actions: [
//           TextButton(
//             onPressed: () {
//               Navigator.of(context).pop();
//             },
//             child: const Text('Cancel'),
//           ),
//           ElevatedButton(
//             onPressed: () {
//               final initialBalance = double.tryParse(balanceController.text);
//               if (initialBalance != null) {
//                 setState(() {
//                   totalBalance = initialBalance;
//                 });
//                 FirebaseFirestore.instance
//                     .collection('users')
//                     .doc(widget.userId)
//                     .collection('balance')
//                     .doc('balance')
//                     .set({'totalBalance': initialBalance});
//                 Navigator.of(context).pop();
//               }
//             },
//             child: const Text('Set Balance'),
//           ),
//         ],
//       ),
//     );
//   }
  
//   Future<void> updateTotalBalance(double amount, bool isIncome) async {
//     if (isIncome) {
//       insum += amount;
//       totalBalance += amount;
//     } else {
//       exsum += amount;
//       totalBalance -= amount;
//     }
//     await FirebaseFirestore.instance
//         .collection('users')
//         .doc(widget.userId)
//         .collection('balance')
//         .doc('balance')
//         .update({'totalBalance': totalBalance});
//     await FirebaseFirestore.instance
//         .collection('users')
//         .doc(widget.userId)
//         .collection('totalincome')
//         .doc('totalincome')
//         .update({'totalincome': insum});
//     await FirebaseFirestore.instance
//         .collection('users')
//         .doc(widget.userId)
//         .collection('totalexpense')
//         .doc('totalexpense')
//         .update({'totalexpense': exsum});
//   }


//   @override
//   Widget build(BuildContext context) {
//     if (isLoading) {
//       return const Center(child: CircularProgressIndicator());
//     }
//   return Scaffold(
//     backgroundColor: Colors.grey[200],
//     body: SafeArea(
//       child: Padding(
//         padding: const EdgeInsets.symmetric(horizontal: 25.0, vertical: 10),
//         child: Column(
//           children: [
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 Row(
//                   children: [
//                     GestureDetector(
//                       onTap: () async {
//                         final result = await Navigator.of(context).push(
//                           MaterialPageRoute(
//                             builder: (context) =>
//                                 ProfileScreen(userId: widget.userId),
//                           ),
//                         );
//                         if (result != null) {
//                           setState(() {
//                             _userName = result['name'] ?? _userName;
//                             _profileImageUrl =
//                                 result['profileImageUrl'] ?? _profileImageUrl;
//                           });
//                         }
//                       },
//                       child: CircleAvatar(
//                         radius: 25,
//                         backgroundImage: _profileImageUrl != null
//                             ? NetworkImage(_profileImageUrl!)
//                             : null,
//                         child: _profileImageUrl == null
//                             ? const Icon(Icons.person, size: 50)
//                             : null,
//                       ),
//                     ),

//                     const SizedBox(width: 8),
//                     Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         Text(
//                           "Welcome!",
//                           style: TextStyle(
//                             fontSize: 12,
//                             fontWeight: FontWeight.w600,
//                             color: Theme.of(context).colorScheme.outline,
//                           ),
//                         ),
//                         Text(
//                           _userName,
//                           style: TextStyle(
//                             fontSize: 18,
//                             fontWeight: FontWeight.bold,
//                             color: Theme.of(context).colorScheme.onBackground,
//                           ),
//                         ),
//                       ],
//                     ),

//                     // Stack(
//                     //   alignment: Alignment.center,
//                     //   children: [
//                     //     Container(
//                     //       width: 50,
//                     //       height: 50,
//                     //       decoration: BoxDecoration(
//                     //         shape: BoxShape.circle,
//                     //         color: Colors.yellow[700],
//                     //       ),
//                     //     ),
//                     //     Icon(
//                     //       CupertinoIcons.person_fill,
//                     //       color: Colors.yellow[800],
//                     //     ),
//                     //   ],
//                     // ),
//                     // const SizedBox(width: 8),
//                     // Column(
//                     //   crossAxisAlignment: CrossAxisAlignment.start,
//                     //   children: [
//                     //     Text(
//                     //       "Welcome!",
//                     //       style: TextStyle(
//                     //         fontSize: 12,
//                     //         fontWeight: FontWeight.w600,
//                     //         color: Theme.of(context).colorScheme.outline,
//                     //       ),
//                     //     ),
//                     //     Text(
//                     //       "John Doe",
//                     //       style: TextStyle(
//                     //         fontSize: 18,
//                     //         fontWeight: FontWeight.bold,
//                     //         color: Theme.of(context).colorScheme.onBackground,
//                     //       ),
//                     //     ),
//                     //   ],
//                     // ),
//                   ],
//                 ),
//                 PopupMenuButton<String>(
//                   icon: Icon(CupertinoIcons.ellipsis),
//                   onSelected: (value) {
//                     if (value == 'logout') {
//                       showDialog(
//                         context: context,
//                         builder: (context) => AlertDialog(
//                           title: const Text('Logout'),
//                           content:
//                               const Text('Are you sure you want to log out?'),
//                           actions: [
//                             TextButton(
//                               onPressed: () {
//                                 Navigator.of(context).pop();
//                               },
//                               child: const Text('Cancel'),
//                             ),
//                             ElevatedButton(
//                               onPressed: () {
//                                 FirebaseAuth.instance.signOut().then((value) {
//                                   Navigator.push(
//                                       context,
//                                       MaterialPageRoute(
//                                           builder: (context) =>
//                                               SignInScreen()));
//                                 });
//                               },
//                               child: const Text('Logout'),
//                             ),
//                           ],
//                         ),
//                       );
//                     } else if (value == 'edit_balance') {
//                       promptEditBalance();
//                     } else if (value == 'to_do') {
//                       Navigator.push(
//                         context,
//                         MaterialPageRoute(
//                           builder: (context) => TodoList(userId: widget.userId),
//                         ),
//                       );
//                     }
//                     // } else if (value == 'to_do') {
//                     //     Navigator.push(
//                     //       context,
//                     //       MaterialPageRoute(
//                     //           builder: (context) => TodoList(userId: widget.userId,)),
//                     //     );
//                     //   }
//                   },
//                   itemBuilder: (BuildContext context) {
//                     return [
//                       const PopupMenuItem(
//                         value: 'logout',
//                         child: Text('Logout'),
//                       ),
//                       const PopupMenuItem(
//                         value: 'edit_balance',
//                         child: Text('Edit Balance'),
//                       ),
//                       const PopupMenuItem(
//                           value: 'to_do',
//                           child: Text('To Do'),
//                         ),
//                     ];
//                   },
//                 ),
//               ],
//             ),
//             const SizedBox(height: 20),
//             Container(
//               width: MediaQuery.of(context).size.width,
//               height: MediaQuery.of(context).size.width / 2,
//               decoration: BoxDecoration(
//                 gradient: LinearGradient(
//                   colors: [
//                     Theme.of(context).colorScheme.primary,
//                     Theme.of(context).colorScheme.secondary,
//                     Theme.of(context).colorScheme.tertiary,
//                   ],
//                   transform: const GradientRotation(pi / 4),
//                 ),
//                 borderRadius: BorderRadius.circular(25),
//                 boxShadow: [
//                   BoxShadow(
//                     blurRadius: 4,
//                     color: Colors.grey.shade300,
//                     offset: const Offset(5, 5),
//                   ),
//                 ],
//               ),
//               child: Column(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   const Text(
//                     'Total Balance',
//                     style: TextStyle(
//                       fontSize: 16,
//                       color: Colors.white,
//                       fontWeight: FontWeight.w600,
//                     ),
//                   ),
//                   const SizedBox(height: 20),
//                   Text(
//                     '\$${totalBalance.toStringAsFixed(2)}',
//                     style: const TextStyle(
//                       fontSize: 40,
//                       color: Colors.white,
//                       fontWeight: FontWeight.bold,
//                     ),
//                   ),
//                   Padding(
//                     padding: const EdgeInsets.symmetric(
//                         vertical: 12, horizontal: 20),
//                     child: Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                       children: [
//                         Row(
//                           children: [
//                             Container(
//                               width: 25,
//                               height: 25,
//                               decoration: const BoxDecoration(
//                                 color: Colors.white30,
//                                 shape: BoxShape.circle,
//                               ),
//                               child: const Center(
//                                 child: Icon(
//                                   CupertinoIcons.arrow_up,
//                                   size: 12,
//                                   color: Colors.greenAccent,
//                                 ),
//                               ),
//                             ),
//                             const SizedBox(width: 8),
//                             Column(
//                               crossAxisAlignment: CrossAxisAlignment.start,
//                               children: [
//                                 Text(
//                                   'Income',
//                                   style: TextStyle(
//                                     fontSize: 14,
//                                     color: Colors.white,
//                                     fontWeight: FontWeight.w400,
//                                   ),
//                                 ),
//                                 Text(
//                                   '\$${insum.toStringAsFixed(2)}',
//                                   style: TextStyle(
//                                     fontSize: 14,
//                                     color: Colors.white,
//                                     fontWeight: FontWeight.w600,
//                                   ),
//                                 ),
//                               ],
//                             ),
//                           ],
//                         ),
//                         Row(
//                           children: [
//                             Container(
//                               width: 25,
//                               height: 25,
//                               decoration: const BoxDecoration(
//                                 color: Colors.white30,
//                                 shape: BoxShape.circle,
//                               ),
//                               child: const Center(
//                                 child: Icon(
//                                   CupertinoIcons.arrow_down,
//                                   size: 12,
//                                   color: Colors.redAccent,
//                                 ),
//                               ),
//                             ),
//                             const SizedBox(width: 8),
//                             Column(
//                               crossAxisAlignment: CrossAxisAlignment.start,
//                               children: [
//                                 Text(
//                                   'Expenses',
//                                   style: TextStyle(
//                                     fontSize: 14,
//                                     color: Colors.white,
//                                     fontWeight: FontWeight.w400,
//                                   ),
//                                 ),
//                                 Text(
//                                   '\$${insum.toStringAsFixed(2)}',
//                                   style: TextStyle(
//                                     fontSize: 14,
//                                     color: Colors.white,
//                                     fontWeight: FontWeight.w600,
//                                   ),
//                                 ),
//                               ],
//                             ),
//                           ],
//                         ),
//                       ],
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//             const SizedBox(height: 40),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 Text(
//                   'Transactions',
//                   style: TextStyle(
//                     fontSize: 16,
//                     color: Theme.of(context).colorScheme.onBackground,
//                     fontWeight: FontWeight.bold,
//                   ),
//                 ),
//                 ToggleButtons(
//                   children: const [
//                     Padding(
//                       padding: EdgeInsets.symmetric(horizontal: 16),
//                       child: Text('Expenses'),
//                     ),
//                     Padding(
//                       padding: EdgeInsets.symmetric(horizontal: 16),
//                       child: Text('Income'),
//                     ),
//                   ],
//                   isSelected: [showExpenses, !showExpenses],
//                   onPressed: (int index) {
//                     setState(() {
//                       showExpenses = index == 0;
//                     });
//                   },
//                 ),
//               ],
//             ),
//             const SizedBox(height: 20),
//             Expanded(
//               child: ListView.builder(
//                 itemCount: showExpenses ? expenses.length : incomes.length,
//                 itemBuilder: (context, int i) {
//                   if (showExpenses) {
//                     final expense = expenses[i];
//                     return buildTransactionItem(
//                       expense.category,
//                       expense.amount.toDouble(), // Ensure amount is double
//                       expense.date.toDate(),
//                     );
//                   } else {
//                     final income = incomes[i];
//                     return buildTransactionItem(
//                       income.category,
//                       income.amount.toDouble(), // Ensure amount is double
//                       income.date.toDate(),
//                     );
//                   }
//                 },
//               ),
//             ),
//           ],
//         ),
//       ),
//     )
//   );
    
//   }

//   Future<void> promptEditBalance() async {
//     final TextEditingController balanceController = TextEditingController();

//     await showDialog(
//       context: context,
//       builder: (context) => AlertDialog(
//         title: const Text('Edit Balance'),
//         content: TextField(
//           controller: balanceController,
//           keyboardType: TextInputType.number,
//           decoration: const InputDecoration(
//             labelText: 'Enter your new balance',
//           ),
//         ),
//         actions: [
//           TextButton(
//             onPressed: () {
//               Navigator.of(context).pop();
//             },
//             child: const Text('Cancel'),
//           ),
//           ElevatedButton(
//             onPressed: () {
//               final newBalance = double.tryParse(balanceController.text);
//               if (newBalance != null) {
//                 setState(() {
//                   totalBalance = newBalance;
//                 });
//                 FirebaseFirestore.instance
//                     .collection('users')
//                     .doc(widget.userId)
//                     .collection('balance')
//                     .doc('balance')
//                     .update({'totalBalance': newBalance});
//                 Navigator.of(context).pop();
//               }
//             },
//             child: const Text('Update Balance'),
//           ),
//         ],
//       ),
//     );
//   }

//   Widget buildTransactionItem(Category category, double amount, DateTime date) {
//     return Padding(
//       padding: const EdgeInsets.only(bottom: 16.0),
//       child: Container(
//         decoration: BoxDecoration(
//           color: Colors.white,
//           borderRadius: BorderRadius.circular(12),
//         ),
//         child: Padding(
//           padding: const EdgeInsets.all(16.0),
//           child: Row(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: [
//               Row(
//                 children: [
//                   Stack(
//                     alignment: Alignment.center,
//                     children: [
//                       Container(
//                         width: 50,
//                         height: 50,
//                         decoration: BoxDecoration(
//                           color: Color(category.color),
//                           shape: BoxShape.circle,
//                         ),
//                       ),
//                       Image.asset(
//                         'assets/${category.icon}.png',
//                         scale: 2,
//                         color: Colors.white,
//                       ),
//                     ],
//                   ),
//                   const SizedBox(width: 12),
//                   Text(
//                     category.name,
//                     style: TextStyle(
//                       fontSize: 14,
//                       color: Theme.of(context).colorScheme.onBackground,
//                       fontWeight: FontWeight.w500,
//                     ),
//                   ),
//                 ],
//               ),
//               Column(
//                 crossAxisAlignment: CrossAxisAlignment.end,
//                 children: [
//                   Text(
//                     "\$${amount.toStringAsFixed(2)}",
//                     style: TextStyle(
//                       fontSize: 14,
//                       color: Theme.of(context).colorScheme.onBackground,
//                       fontWeight: FontWeight.w400,
//                     ),
//                   ),
//                   Text(
//                     DateFormat('dd/MM/yyyy').format(date),
//                     style: TextStyle(
//                       fontSize: 14,
//                       color: Theme.of(context).colorScheme.onBackground,
//                       fontWeight: FontWeight.w400,
//                     ),
//                   ),
//                 ],
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }





// import 'dart:math';

// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:expense_repository/expense_repository.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:intl/intl.dart';
// import 'package:mad_my_app/screens/home/views/Service/todo_database_service.dart';
// import 'package:mad_my_app/screens/home/views/profile_screen.dart';
// import 'package:mad_my_app/screens/home/views/todo_list.dart';
// import 'package:mad_my_app/screens/signin_screen.dart';

// class MainScreen extends StatefulWidget {
//   final String userId;

//   const MainScreen({Key? key, required this.userId}) : super(key: key);

//   @override
//   _MainScreenState createState() => _MainScreenState();
// }

// class _MainScreenState extends State<MainScreen> {
//   late ToDoDatabaseService todoDatabaseService;
//   List<Expense> expenses = [];
//   List<Income> incomes = [];
//   bool showExpenses = true;
//   double totalBalance = 0.0;
//   bool isLoading = true;
//   String _userName = 'John Doe';
//   String? _profileImageUrl;

//   @override
//   void initState() {
//     super.initState();
//     fetchTransactions();
//     _fetchUserNameAndImage();
//     todoDatabaseService = ToDoDatabaseService(widget.userId);
//   }

//   Future<void> _fetchUserNameAndImage() async {
//     try {
//       final userDoc =
//           FirebaseFirestore.instance.collection('users').doc(widget.userId);
//       final userSnapshot = await userDoc.get();

//       if (userSnapshot.exists) {
//         setState(() {
//           _userName = userSnapshot.data()?['name'] ?? 'John Doe';
//           _profileImageUrl = userSnapshot.data()?['profileImageUrl'];
//         });
//       }
//     } catch (e) {
//       print('Error fetching user name and image: $e');
//     }
//   }

//   Future<void> fetchTransactions() async {
//     try {
//       print('Fetching transactions...');
//       final userExpenseCollection = FirebaseFirestore.instance
//           .collection('users')
//           .doc(widget.userId)
//           .collection('expenses');
//       final userIncomeCollection = FirebaseFirestore.instance
//           .collection('users')
//           .doc(widget.userId)
//           .collection('incomes');
//       final balanceDoc = FirebaseFirestore.instance
//           .collection('users')
//           .doc(widget.userId)
//           .collection('balance')
//           .doc('balance');

//       // Fetch expenses
//       final expenseSnapshot = await userExpenseCollection.get();
//       final incomeSnapshot = await userIncomeCollection.get();
//       final balanceSnapshot = await balanceDoc.get();

//       print('Fetched data from Firestore');

//       if (balanceSnapshot.exists) {
//         print('Balance exists');
//         setState(() {
//           totalBalance = balanceSnapshot.data()?['totalBalance'] ?? 0.0;
//           isLoading = false;
//         });
//       } else {
//         print('Balance does not exist, prompting initial balance');
//         promptInitialBalance();
//       }

//       setState(() {
//         expenses = expenseSnapshot.docs
//             .map((doc) => Expense.fromDocument(doc))
//             .toList();
//         incomes =
//             incomeSnapshot.docs.map((doc) => Income.fromDocument(doc)).toList();
//       });

//       print('Expenses and incomes loaded');
//     } catch (e) {
//       print('Error fetching transactions: $e');
//     }
//   }

//   Future<void> promptInitialBalance() async {
//     final TextEditingController balanceController = TextEditingController();

//     await showDialog(
//       context: context,
//       builder: (context) => AlertDialog(
//         title: const Text('Set Initial Balance'),
//         content: TextField(
//           controller: balanceController,
//           keyboardType: TextInputType.number,
//           decoration: const InputDecoration(
//             labelText: 'Enter your initial balance',
//           ),
//         ),
//         actions: [
//           TextButton(
//             onPressed: () {
//               Navigator.of(context).pop();
//             },
//             child: const Text('Cancel'),
//           ),
//           ElevatedButton(
//             onPressed: () {
//               final initialBalance = double.tryParse(balanceController.text);
//               if (initialBalance != null) {
//                 setState(() {
//                   totalBalance = initialBalance;
//                 });
//                 FirebaseFirestore.instance
//                     .collection('users')
//                     .doc(widget.userId)
//                     .collection('balance')
//                     .doc('balance')
//                     .set({'totalBalance': initialBalance});
//                 Navigator.of(context).pop();
//               }
//             },
//             child: const Text('Set Balance'),
//           ),
//         ],
//       ),
//     );
//   }

//   Future<void> updateTotalBalance(double amount, bool isIncome) async {
//     if (isIncome) {
//       totalBalance += amount;
//     } else {
//       totalBalance -= amount;
//     }
//     await FirebaseFirestore.instance
//         .collection('users')
//         .doc(widget.userId)
//         .collection('balance')
//         .doc('balance')
//         .update({'totalBalance': totalBalance});
//   }

//   @override
//   Widget build(BuildContext context) {
//     if (isLoading) {
//       return const Center(child: CircularProgressIndicator());
//     }

//     return Scaffold(
//       backgroundColor: Colors.grey[200],
//       body: SafeArea(
//         child: Padding(
//           padding: const EdgeInsets.symmetric(horizontal: 25.0, vertical: 10),
//           child: Column(
//             children: [
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   Row(
//                     children: [
//                       GestureDetector(
//                         onTap: () async {
//                           final result = await Navigator.of(context).push(
//                             MaterialPageRoute(
//                               builder: (context) =>
//                                   ProfileScreen(userId: widget.userId),
//                             ),
//                           );
//                           if (result != null) {
//                             setState(() {
//                               _userName = result['name'] ?? _userName;
//                               _profileImageUrl =
//                                   result['profileImageUrl'] ?? _profileImageUrl;
//                             });
//                           }
//                         },
//                         child: CircleAvatar(
//                           radius: 25,
//                           backgroundImage: _profileImageUrl != null
//                               ? NetworkImage(_profileImageUrl!)
//                               : null,
//                           child: _profileImageUrl == null
//                               ? const Icon(Icons.person, size: 50)
//                               : null,
//                         ),
//                       ),
//                       const SizedBox(width: 8),
//                       Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           Text(
//                             "Welcome!",
//                             style: TextStyle(
//                               fontSize: 12,
//                               fontWeight: FontWeight.w600,
//                               color: Theme.of(context).colorScheme.onBackground,
//                             ),
//                           ),
//                           Text(
//                             _userName,
//                             style: TextStyle(
//                               fontSize: 18,
//                               fontWeight: FontWeight.bold,
//                               color: Theme.of(context).colorScheme.onBackground,
//                             ),
//                           ),
//                         ],
//                       ),
//                     ],
//                   ),
//                   PopupMenuButton<String>(
//                     icon: Icon(CupertinoIcons.ellipsis),
//                     onSelected: (value) {
//                       if (value == 'logout') {
//                         showDialog(
//                           context: context,
//                           builder: (context) => AlertDialog(
//                             title: const Text('Logout'),
//                             content:
//                                 const Text('Are you sure you want to log out?'),
//                             actions: [
//                               TextButton(
//                                 onPressed: () {
//                                   Navigator.of(context).pop();
//                                 },
//                                 child: const Text('Cancel'),
//                               ),
//                               ElevatedButton(
//                                 onPressed: () {
//                                   FirebaseAuth.instance
//                                       .signOut()
//                                       .then((value) {
//                                     Navigator.push(
//                                         context,
//                                         MaterialPageRoute(
//                                             builder: (context) =>
//                                                 SignInScreen()));
//                                   });
//                                 },
//                                 child: const Text('Logout'),
//                               ),
//                             ],
//                           ),
//                         );
//                       } else if (value == 'edit_balance') {
//                         promptEditBalance();
//                       } else if (value == 'to_do') {
//                         Navigator.push(
//                           context,
//                           MaterialPageRoute(
//                             builder: (context) =>
//                                 TodoList(userId: widget.userId),
//                           ),
//                         );
//                       }
//                     },
//                     itemBuilder: (BuildContext context) {
//                       return [
//                         const PopupMenuItem(
//                           value: 'logout',
//                           child: Text('Logout'),
//                         ),
//                         const PopupMenuItem(
//                           value: 'edit_balance',
//                           child: Text('Edit Balance'),
//                         ),
//                         const PopupMenuItem(
//                           value: 'to_do',
//                           child: Text('To Do'),
//                         ),
//                       ];
//                     },
//                   ),
//                 ],
//               ),
//               const SizedBox(height: 20),
//               Container(
//                 width: MediaQuery.of(context).size.width,
//                 height: MediaQuery.of(context).size.width / 2,
//                 decoration: BoxDecoration(
//                   gradient: LinearGradient(
//                     colors: [
//                       Theme.of(context).colorScheme.primary,
//                       Theme.of(context).colorScheme.secondary,
//                       Theme.of(context).colorScheme.tertiary,
//                     ],
//                     transform: const GradientRotation(pi / 4),
//                   ),
//                   borderRadius: BorderRadius.circular(25),
//                   boxShadow: [
//                     BoxShadow(
//                       blurRadius: 4,
//                       color: Colors.grey.shade300,
//                       offset: const Offset(5, 5),
//                     ),
//                   ],
//                 ),
//                 child: Column(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//                     const Text(
//                       'Total Balance',
//                       style: TextStyle(
//                         fontSize: 16,
//                         color: Colors.white,
//                         fontWeight: FontWeight.w600,
//                       ),
//                     ),
//                     const SizedBox(height: 20),
//                     Text(
//                       '\$${totalBalance.toStringAsFixed(2)}',
//                       style: const TextStyle(
//                         fontSize: 40,
//                         color: Colors.white,
//                         fontWeight: FontWeight.bold,
//                       ),
//                     ),
//                     Padding(
//                       padding: const EdgeInsets.symmetric(
//                           vertical: 12, horizontal: 20),
//                       child: Row(
//                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                         children: [
//                           Row(
//                             children: [
//                               Container(
//                                 width: 25,
//                                 height: 25,
//                                 decoration: const BoxDecoration(
//                                   color: Colors.white30,
//                                   shape: BoxShape.circle,
//                                 ),
//                                 child: const Center(
//                                   child: Icon(
//                                     CupertinoIcons.arrow_up,
//                                     size: 16,
//                                     color: Colors.white,
//                                   ),
//                                 ),
//                               ),
//                               const SizedBox(width: 10),
//                               Column(
//                                 crossAxisAlignment: CrossAxisAlignment.start,
//                                 children: [
//                                   const Text(
//                                     'Income',
//                                     style: TextStyle(
//                                       color: Colors.white70,
//                                       fontSize: 12,
//                                     ),
//                                   ),
//                                   Text(
//                                     '\$${incomes.fold<double>(
//                                           0,
//                                           (previousValue, element) =>
//                                               previousValue + element.amount,
//                                         ).toStringAsFixed(2)}',
//                                     style: const TextStyle(
//                                       fontSize: 16,
//                                       color: Colors.white,
//                                       fontWeight: FontWeight.bold,
//                                     ),
//                                   ),
//                                 ],
//                               ),
//                             ],
//                           ),
//                           Row(
//                             children: [
//                               Container(
//                                 width: 25,
//                                 height: 25,
//                                 decoration: const BoxDecoration(
//                                   color: Colors.white30,
//                                   shape: BoxShape.circle,
//                                 ),
//                                 child: const Center(
//                                   child: Icon(
//                                     CupertinoIcons.arrow_down,
//                                     size: 16,
//                                     color: Colors.white,
//                                   ),
//                                 ),
//                               ),
//                               const SizedBox(width: 10),
//                               Column(
//                                 crossAxisAlignment: CrossAxisAlignment.start,
//                                 children: [
//                                   const Text(
//                                     'Expenses',
//                                     style: TextStyle(
//                                       color: Colors.white70,
//                                       fontSize: 12,
//                                     ),
//                                   ),
//                                   Text(
//                                     '\$${expenses.fold<double>(
//                                           0,
//                                           (previousValue, element) =>
//                                               previousValue + element.amount,
//                                         ).toStringAsFixed(2)}',
//                                     style: const TextStyle(
//                                       fontSize: 16,
//                                       color: Colors.white,
//                                       fontWeight: FontWeight.bold,
//                                     ),
//                                   ),
//                                 ],
//                               ),
//                             ],
//                           ),
//                         ],
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//               const SizedBox(height: 20),
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   InkWell(
//                     onTap: () {
//                       setState(() {
//                         showExpenses = true;
//                       });
//                     },
//                     child: Container(
//                       padding: const EdgeInsets.symmetric(
//                           vertical: 10, horizontal: 20),
//                       decoration: BoxDecoration(
//                         color: showExpenses
//                             ? Theme.of(context).colorScheme.primary
//                             : Colors.grey[300],
//                         borderRadius: BorderRadius.circular(20),
//                       ),
//                       child: const Text(
//                         'Expenses',
//                         style: TextStyle(
//                           fontSize: 16,
//                           fontWeight: FontWeight.bold,
//                           color: Colors.white,
//                         ),
//                       ),
//                     ),
//                   ),
//                   InkWell(
//                     onTap: () {
//                       setState(() {
//                         showExpenses = false;
//                       });
//                     },
//                     child: Container(
//                       padding: const EdgeInsets.symmetric(
//                           vertical: 10, horizontal: 20),
//                       decoration: BoxDecoration(
//                         color: !showExpenses
//                             ? Theme.of(context).colorScheme.primary
//                             : Colors.grey[300],
//                         borderRadius: BorderRadius.circular(20),
//                       ),
//                       child: const Text(
//                         'Incomes',
//                         style: TextStyle(
//                           fontSize: 16,
//                           fontWeight: FontWeight.bold,
//                           color: Colors.white,
//                         ),
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//               const SizedBox(height: 20),
//               Expanded(
//                 child: showExpenses
//                     ? ListView.builder(
//                         itemCount: expenses.length,
//                         itemBuilder: (context, index) {
//                           final expense = expenses[index];
//                           return ListTile(
//                             title: Text(expense.category.name), // Assuming category has a 'name' property
//                             subtitle: Text(
//                             DateFormat.yMMMd().format(expense.date.toDate()), // Convert Timestamp to DateTime
//                           ),
//                             trailing: Text(
//                               '- \$${expense.amount.toStringAsFixed(2)}',
//                               style: const TextStyle(color: Colors.red),
//                             ),
//                           );
//                         },
//                       )
//                     : ListView.builder(
//                         itemCount: incomes.length,
//                         itemBuilder: (context, index) {
//                           final income = incomes[index];
//                           return ListTile(
//                             title: Text(income.category.name), // Assuming category has a 'name' property
//                             subtitle: Text(
//                             DateFormat.yMMMd().format(income.date.toDate()), // Convert Timestamp to DateTime
//                           ),
//                           // return ListTile(
//                           //   title: Text(income.category),
//                           //   subtitle: Text(
//                           //     DateFormat.yMMMd().format(income.date),
//                           //   ),
//                             trailing: Text(
//                               '+ \$${income.amount.toStringAsFixed(2)}',
//                               style: const TextStyle(color: Colors.green),
//                             ),
//                           );
//                         },
//                       ),
//               ),
//               const SizedBox(height: 20),
//             ],
//           ),
//         ),
//       ),
//     );
//   }

//   Future<void> promptEditBalance() async {
//     final TextEditingController balanceController = TextEditingController();

//     await showDialog(
//       context: context,
//       builder: (context) => AlertDialog(
//         title: const Text('Edit Balance'),
//         content: TextField(
//           controller: balanceController,
//           keyboardType: TextInputType.number,
//           decoration: const InputDecoration(
//             labelText: 'Enter new balance',
//           ),
//         ),
//         actions: [
//           TextButton(
//             onPressed: () {
//               Navigator.of(context).pop();
//             },
//             child: const Text('Cancel'),
//           ),
//           ElevatedButton(
//             onPressed: () {
//               final newBalance = double.tryParse(balanceController.text);
//               if (newBalance != null) {
//                 setState(() {
//                   totalBalance = newBalance;
//                 });
//                 FirebaseFirestore.instance
//                     .collection('users')
//                     .doc(widget.userId)
//                     .collection('balance')
//                     .doc('balance')
//                     .update({'totalBalance': newBalance});
//                 Navigator.of(context).pop();
//               }
//             },
//             child: const Text('Save'),
//           ),
//         ],
//       ),
//     );
//   }
// }






















