// import 'dart:math';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:expense_repository/expense_repository.dart';
// import 'package:fl_chart/fl_chart.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';

// class MyChart extends StatefulWidget {
//   final bool showIncome;

//   const MyChart({Key? key, required this.showIncome}) : super(key: key);

//   @override
//   State<MyChart> createState() => _MyChartState();
// }

// class _MyChartState extends State<MyChart> {
//   List<CategoryExpenseData> _categoryData = [];
//   bool _isLoading = true;

//   @override
//   void initState() {
//     super.initState();
//     _fetchData();
//   }

//   Future<void> _fetchData() async {
//     final userId = FirebaseAuth.instance.currentUser?.uid;
//     if (userId == null) {
//       ScaffoldMessenger.of(context).showSnackBar(
//         const SnackBar(content: Text('User not logged in.')),
//       );
//       return;
//     }

//     final now = DateTime.now();
//     final oneMonthAgo = now.subtract(const Duration(days: 30));
//     final Timestamp oneMonthAgoTimestamp = Timestamp.fromDate(oneMonthAgo);

//     final collectionName = widget.showIncome ? 'incomes' : 'expenses';
//     final records = await FirebaseFirestore.instance
//         .collection('users')
//         .doc(userId)
//         .collection(collectionName)
//         .where('date', isGreaterThan: oneMonthAgoTimestamp)
//         .get();

//     final categoryTotals = <String, int>{};

//     for (var doc in records.docs) {
//       final record = Expense.fromDocument(doc);
//       categoryTotals.update(
//           record.category.name, (value) => value + record.amount,
//           ifAbsent: () => record.amount);
//     }

//     final sortedCategories = categoryTotals.entries.toList()
//       ..sort((a, b) => b.value.compareTo(a.value));

//     setState(() {
//       _categoryData = sortedCategories
//           .take(6)
//           .map((e) =>
//               CategoryExpenseData(name: e.key, total: e.value.toDouble()))
//           .toList();
//       _isLoading = false;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return _isLoading
//         ? const Center(child: CircularProgressIndicator())
//         : SingleChildScrollView(
//             scrollDirection: Axis.horizontal,
//             child: Container(
//               width: MediaQuery.of(context).size.width * 1.2,
//               child: Padding(
//                 padding: const EdgeInsets.all(16.0),
//                 child: BarChart(
//                   mainBarData(),
//                   swapAnimationDuration: const Duration(milliseconds: 800),
//                   swapAnimationCurve: Curves.easeInOut,
//                 ),
//               ),
//             ),
//           );
//   }

//   BarChartGroupData makeGroupData(int x, double y) {
//     return BarChartGroupData(
//       x: x,
//       barRods: [
//         BarChartRodData(
//           toY: y,
//           gradient: LinearGradient(
//             colors: [
//               Theme.of(context).colorScheme.primary,
//               Theme.of(context).colorScheme.secondary,
//               Theme.of(context).colorScheme.tertiary,
//             ],
//             stops: [0.0, 0.5, 1.0],
//             transform: const GradientRotation(pi / 40),
//           ),
//           width: 13,
//           borderRadius: BorderRadius.circular(6),
//           backDrawRodData: BackgroundBarChartRodData(
//             show: true,
//             toY: 6,
//             color: Colors.grey.shade200,
//           ),
//         ),
//       ],
//     );
//   }

//   List<BarChartGroupData> showingGroups() {
//     return List.generate(_categoryData.length, (i) {
//       return makeGroupData(i, _categoryData[i].total);
//     });
//   }

//   BarChartData mainBarData() {
//     return BarChartData(
//       barTouchData: BarTouchData(
//         touchTooltipData: BarTouchTooltipData(
//           tooltipMargin: 8,
//           tooltipPadding: const EdgeInsets.all(8),
//           getTooltipItem: (group, groupIndex, rod, rodIndex) {
//             final category = _categoryData[group.x];
//             return BarTooltipItem(
//               '${category.name}\n',
//               const TextStyle(
//                 color: Colors.white,
//                 fontWeight: FontWeight.bold,
//                 fontSize: 18,
//               ),
//               children: <TextSpan>[
//                 TextSpan(
//                   text: '\$${rod.toY.toStringAsFixed(0)}',
//                   style: const TextStyle(
//                     color: Colors.yellow,
//                     fontSize: 16,
//                     fontWeight: FontWeight.w500,
//                   ),
//                 ),
//               ],
//             );
//           },
//         ),
//       ),
//       titlesData: FlTitlesData(
//         show: true,
//         rightTitles: AxisTitles(
//           sideTitles: SideTitles(showTitles: false),
//         ),
//         topTitles: AxisTitles(
//           sideTitles: SideTitles(showTitles: false),
//         ),
//         bottomTitles: AxisTitles(
//           sideTitles: SideTitles(
//             showTitles: true,
//             reservedSize: 42,
//             getTitlesWidget: (value, meta) {
//               if (value.toInt() < _categoryData.length) {
//                 return Text(
//                   _categoryData[value.toInt()].name,
//                   style: const TextStyle(
//                     color: Colors.grey,
//                     fontWeight: FontWeight.bold,
//                     fontSize: 14,
//                   ),
//                 );
//               }
//               return const Text('');
//             },
//           ),
//         ),
//         leftTitles: AxisTitles(
//           sideTitles: SideTitles(
//             showTitles: true,
//             reservedSize: 42,
//             getTitlesWidget: (value, meta) {
//               if (value % 2000 == 0) {
//                 return Text(
//                   '\$${value.toInt()}',
//                   style: const TextStyle(
//                     color: Colors.grey,
//                     fontWeight: FontWeight.bold,
//                     fontSize: 10,
//                   ),
//                 );
//               }
//               return const Text('');
//             },
//           ),
//         ),
//       ),
//       borderData: FlBorderData(
//         show: false,
//       ),
//       gridData: FlGridData(
//         show: true,
//         drawHorizontalLine: true,
//         horizontalInterval: 2000, // Adjusted for clarity
//         getDrawingHorizontalLine: (value) {
//           return FlLine(
//             color: Colors.grey.shade300,
//             strokeWidth: 1,
//           );
//         },
//       ),
//       barGroups: showingGroups(),
//     );
//   }
// }

// class CategoryExpenseData {
//   final String name;
//   final double total;

//   CategoryExpenseData({
//     required this.name,
//     required this.total,
//   });
// }

import 'dart:math';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:expense_repository/expense_repository.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class MyChart extends StatefulWidget {
  final bool showIncome;

  const MyChart({Key? key, required this.showIncome}) : super(key: key);

  @override
  State<MyChart> createState() => _MyChartState();
}

class _MyChartState extends State<MyChart> {
  List<CategoryExpenseData> _categoryData = [];
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _fetchData();
  }

  @override
  void didUpdateWidget(MyChart oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.showIncome != widget.showIncome) {
      _fetchData();
    }
  }

  Future<void> _fetchData() async {
    setState(() {
      _isLoading = true;
    });

    final userId = FirebaseAuth.instance.currentUser?.uid;
    if (userId == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('User not logged in.')),
      );
      return;
    }

    final now = DateTime.now();
    final oneMonthAgo = now.subtract(const Duration(days: 30));
    final Timestamp oneMonthAgoTimestamp = Timestamp.fromDate(oneMonthAgo);

    final collectionName = widget.showIncome ? 'incomes' : 'expenses';
    final records = await FirebaseFirestore.instance
        .collection('users')
        .doc(userId)
        .collection(collectionName)
        .where('date', isGreaterThan: oneMonthAgoTimestamp)
        .get();

    final categoryTotals = <String, int>{};

    for (var doc in records.docs) {
      if (widget.showIncome) {
        final income = Income.fromDocument(doc);
        categoryTotals.update(
          income.category.name, (value) => value + income.amount,
          ifAbsent: () => income.amount);
      } else {
        final expense = Expense.fromDocument(doc);
        categoryTotals.update(
          expense.category.name, (value) => value + expense.amount,
          ifAbsent: () => expense.amount);
      }
    }

    final sortedCategories = categoryTotals.entries.toList()
      ..sort((a, b) => b.value.compareTo(a.value));

    setState(() {
      _categoryData = sortedCategories
          .take(6)
          .map((e) =>
              CategoryExpenseData(name: e.key, total: e.value.toDouble()))
          .toList();
      _isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return _isLoading
        ? const Center(child: CircularProgressIndicator())
        : SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Container(
              width: MediaQuery.of(context).size.width * 1.2,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: BarChart(
                  mainBarData(),
                  swapAnimationDuration: const Duration(milliseconds: 800),
                  swapAnimationCurve: Curves.easeInOut,
                ),
              ),
            ),
          );
  }

  BarChartGroupData makeGroupData(int x, double y) {
    return BarChartGroupData(
      x: x,
      barRods: [
        BarChartRodData(
          toY: y,
          gradient: LinearGradient(
            colors: [
              Theme.of(context).colorScheme.primary,
              Theme.of(context).colorScheme.secondary,
              Theme.of(context).colorScheme.tertiary,
            ],
            stops: [0.0, 0.5, 1.0],
            transform: const GradientRotation(pi / 40),
          ),
          width: 13,
          borderRadius: BorderRadius.circular(6),
          backDrawRodData: BackgroundBarChartRodData(
            show: true,
            toY: 6,
            color: Colors.grey.shade200,
          ),
        ),
      ],
    );
  }

  List<BarChartGroupData> showingGroups() {
    return List.generate(_categoryData.length, (i) {
      return makeGroupData(i, _categoryData[i].total);
    });
  }

  BarChartData mainBarData() {
    return BarChartData(
      barTouchData: BarTouchData(
        touchTooltipData: BarTouchTooltipData(
          tooltipMargin: -50,
          tooltipPadding: const EdgeInsets.all(8),
          getTooltipItem: (group, groupIndex, rod, rodIndex) {
            final category = _categoryData[group.x];
            return BarTooltipItem(
              '${category.name}\n',
              const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w400,
                fontSize: 18,
              ),
              children: <TextSpan>[
                TextSpan(
                  text: '\$${rod.toY.toStringAsFixed(0)}',
                  style: const TextStyle(
                    color: Color.fromARGB(255, 203, 143, 214),
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            );
          },
        ),
      ),
      titlesData: FlTitlesData(
        show: true,
        rightTitles: AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
        topTitles: AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
        bottomTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: true,
            reservedSize: 42,
            getTitlesWidget: (value, meta) {
              if (value.toInt() < _categoryData.length) {
                return Text(
                  _categoryData[value.toInt()].name,
                  style: const TextStyle(
                    color: Colors.grey,
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                  ),
                );
              }
              return const Text('');
            },
          ),
        ),
        leftTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: true,
            reservedSize: 42,
            getTitlesWidget: (value, meta) {
              if (value % 2000 == 0) {
                return Text(
                  '\$${value.toInt()}',
                  style: const TextStyle(
                    color: Colors.grey,
                    fontWeight: FontWeight.bold,
                    fontSize: 10,
                  ),
                );
              }
              return const Text('');
            },
          ),
        ),
      ),
      borderData: FlBorderData(
        show: false,
      ),
      gridData: FlGridData(
        show: true,
        drawHorizontalLine: true,
        horizontalInterval: 2000, // Adjusted for clarity
        getDrawingHorizontalLine: (value) {
          return FlLine(
            color: Colors.grey.shade300,
            strokeWidth: 1,
          );
        },
      ),
      barGroups: showingGroups(),
    );
  }
}

class CategoryExpenseData {
  final String name;
  final double total;

  CategoryExpenseData({
    required this.name,
    required this.total,
  });
}



// //nice codeeee
// import 'dart:math';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:expense_repository/expense_repository.dart';
// import 'package:fl_chart/fl_chart.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';

// class MyChart extends StatefulWidget {
//   const MyChart({Key? key}) : super(key: key);

//   @override
//   State<MyChart> createState() => _MyChartState();
// }

// class _MyChartState extends State<MyChart> {
//   List<CategoryExpenseData> _categoryData = [];
//   bool _isLoading = true;

//   @override
//   void initState() {
//     super.initState();
//     _fetchData();
//   }

//   Future<void> _fetchData() async {
//     final userId = FirebaseAuth.instance.currentUser?.uid;
//     if (userId == null) {
//       ScaffoldMessenger.of(context).showSnackBar(
//         const SnackBar(content: Text('User not logged in.')),
//       );
//       return;
//     }

//     final now = DateTime.now();
//     final oneMonthAgo = now.subtract(const Duration(days: 30));
//     final Timestamp oneMonthAgoTimestamp = Timestamp.fromDate(oneMonthAgo);

//     final expenses = await FirebaseFirestore.instance
//         .collection('users')
//         .doc(userId)
//         .collection('expenses')
//         .where('date', isGreaterThan: oneMonthAgoTimestamp)
//         .get();

//     final categoryTotals = <String, int>{};

//     for (var doc in expenses.docs) {
//       final expense = Expense.fromDocument(doc);
//       categoryTotals.update(
//           expense.category.name, (value) => value + expense.amount,
//           ifAbsent: () => expense.amount);
//     }

//     final sortedCategories = categoryTotals.entries.toList()
//       ..sort((a, b) => b.value.compareTo(a.value));

//     setState(() {
//       _categoryData = sortedCategories
//           .take(6)
//           .map((e) =>
//               CategoryExpenseData(name: e.key, total: e.value.toDouble()))
//           .toList();
//       _isLoading = false;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return _isLoading
//         ? const Center(child: CircularProgressIndicator())
//         : SingleChildScrollView(
//             scrollDirection: Axis.horizontal,
//             child: Container(
//               width: MediaQuery.of(context).size.width * 1.2, 
//               child: Padding(
//                 padding: const EdgeInsets.all(16.0),
//                 child: BarChart(
//                   mainBarData(),
//                   swapAnimationDuration: const Duration(milliseconds: 800),
//                   swapAnimationCurve: Curves.easeInOut,
//                 ),
//               ),
//             ),
//           );
//   }

//   BarChartGroupData makeGroupData(int x, double y) {
//     return BarChartGroupData(
//       x: x,
//       barRods: [
//         BarChartRodData(
//           toY: y,
//           gradient: LinearGradient(
//             colors: [
//               Theme.of(context).colorScheme.primary,
//               Theme.of(context).colorScheme.secondary,
//               Theme.of(context).colorScheme.tertiary,
//             ],
//             stops: [0.0, 0.5, 1.0],
//             transform: const GradientRotation(pi / 40),
//           ),
//           width: 13,
//           borderRadius: BorderRadius.circular(6),
//           backDrawRodData: BackgroundBarChartRodData(
//             show: true,
//             toY: 6,
//             color: Colors.grey.shade200,
//           ),
//         ),
//       ],
//     );
//   }

//   List<BarChartGroupData> showingGroups() {
//     return List.generate(_categoryData.length, (i) {
//       return makeGroupData(i, _categoryData[i].total);
//     });
//   }

//   BarChartData mainBarData() {
//     return BarChartData(
//       barTouchData: BarTouchData(
//         touchTooltipData: BarTouchTooltipData(
//           tooltipMargin: 8,
//           tooltipPadding: const EdgeInsets.all(8),
//           getTooltipItem: (group, groupIndex, rod, rodIndex) {
//             final category = _categoryData[group.x];
//             return BarTooltipItem(
//               '${category.name}\n',
//               const TextStyle(
//                 color: Colors.white,
//                 fontWeight: FontWeight.bold,
//                 fontSize: 18,
//               ),
//               children: <TextSpan>[
//                 TextSpan(
//                   text: '\$${rod.toY.toStringAsFixed(0)}',
//                   style: const TextStyle(
//                     color: Colors.yellow,
//                     fontSize: 16,
//                     fontWeight: FontWeight.w500,
//                   ),
//                 ),
//               ],
//             );
//           },
//         ),
//       ),
//       titlesData: FlTitlesData(
//         show: true,
//         rightTitles: AxisTitles(
//           sideTitles: SideTitles(showTitles: false),
//         ),
//         topTitles: AxisTitles(
//           sideTitles: SideTitles(showTitles: false),
//         ),
//         bottomTitles: AxisTitles(
//           sideTitles: SideTitles(
//             showTitles: true,
//             reservedSize: 42,
//             getTitlesWidget: (value, meta) {
//               if (value.toInt() < _categoryData.length) {
//                 return Text(
//                   _categoryData[value.toInt()].name,
//                   style: const TextStyle(
//                     color: Colors.grey,
//                     fontWeight: FontWeight.bold,
//                     fontSize: 14,
//                   ),
//                 );
//               }
//               return const Text('');
//             },
//           ),
//         ),
//         leftTitles: AxisTitles(
//           sideTitles: SideTitles(
//             showTitles: true,
//             reservedSize: 42,
//             getTitlesWidget: (value, meta) {
//               if (value % 2000 == 0) {
//                 return Text(
//                   '\$${value.toInt()}',
//                   style: const TextStyle(
//                     color: Colors.grey,
//                     fontWeight: FontWeight.bold,
//                     fontSize: 10,
//                   ),
//                 );
//               }
//               return const Text('');
//             },
//           ),
//         ),
//       ),
//       borderData: FlBorderData(
//         show: false,
//       ),
//       gridData: FlGridData(
//         show: true,
//         drawHorizontalLine: true,
//         horizontalInterval: 2000, // Adjusted for clarity
//         getDrawingHorizontalLine: (value) {
//           return FlLine(
//             color: Colors.grey.shade300,
//             strokeWidth: 1,
//           );
//         },
//       ),
//       barGroups: showingGroups(),
//     );
//   }
// }

// class CategoryExpenseData {
//   final String name;
//   final double total;

//   CategoryExpenseData({
//     required this.name,
//     required this.total,
//   });
// }

