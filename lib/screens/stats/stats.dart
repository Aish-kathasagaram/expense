// import 'package:flutter/material.dart';
// import 'package:mad_my_app/screens/stats/chart.dart';

// class StatScreen extends StatefulWidget {
//   const StatScreen({super.key});

//   @override
//   _StatScreenState createState() => _StatScreenState();
// }

// class _StatScreenState extends State<StatScreen> {
//   bool _showIncome = false;

//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//       child: Padding(
//         padding: const EdgeInsets.symmetric(horizontal: 25.0, vertical: 20),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             const Text(
//               'Transactions',
//               style: TextStyle(
//                 fontSize: 20,
//                 fontWeight: FontWeight.bold,
//               ),
//             ),
//             const SizedBox(height: 20),
//             ToggleButtons(
//               children: const [
//                 Padding(
//                   padding: EdgeInsets.symmetric(horizontal: 16.0),
//                   child: Text('Expenses'),
//                 ),
//                 Padding(
//                   padding: EdgeInsets.symmetric(horizontal: 16.0),
//                   child: Text('Income'),
//                 ),
//               ],
//               isSelected: [_showIncome, !_showIncome],
//               onPressed: (index) {
//                 setState(() {
//                   _showIncome = index == 1;
//                 });
//               },
//             ),
//             const SizedBox(height: 20),
//             Container(
//               width: MediaQuery.of(context).size.width,
//               height: MediaQuery.of(context).size.width,
//               decoration: BoxDecoration(
//                 color: Colors.white,
//                 borderRadius: BorderRadius.circular(12),
//               ),
//               child: Padding(
//                 padding: const EdgeInsets.fromLTRB(12, 30, 12, 12),
//                 child: MyChart(showIncome: _showIncome),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:mad_my_app/screens/stats/chart.dart';

class StatScreen extends StatefulWidget {
  const StatScreen({super.key});

  @override
  _StatScreenState createState() => _StatScreenState();
}

class _StatScreenState extends State<StatScreen> {
  bool _showIncome = false;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25.0, vertical: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Transactions',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 20),
            ToggleButtons(
              children: const [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.0),
                  child: Text('Expenses'),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.0),
                  child: Text('Income'),
                ),
              ],
              isSelected: !_showIncome ? [true, false] : [false, true],
              onPressed: (index) {
                setState(() {
                  _showIncome = index == 1;
                });
              },
            ),
            const SizedBox(height: 20),
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Padding(
                padding: const EdgeInsets.fromLTRB(12, 30, 12, 12),
                child: MyChart(showIncome: _showIncome),
              ),
            ),
          ],
        ),
      ),
    );
  }
}



// import 'package:flutter/material.dart';
// import 'package:flutter/widgets.dart';
// import 'package:mad_my_app/screens/stats/chart.dart';


// class StatScreen extends StatelessWidget {
//   const StatScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//       child: Padding(
//         padding: const EdgeInsets.symmetric(horizontal: 25.0, vertical: 20),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             const Text(
//               'Transactions',
//               style: TextStyle(
//                 fontSize: 20,
//                 fontWeight: FontWeight.bold
//               ),
//             ),
//             const SizedBox(height: 20),
//             Container(
//               width: MediaQuery.of(context).size.width,
//               height: MediaQuery.of(context).size.width,
//               decoration: BoxDecoration(
//                 color: Colors.white,
//                 borderRadius: BorderRadius.circular(12)
//               ),
//               child: const Padding(
//                 padding: EdgeInsets.fromLTRB(12, 30, 12, 12),
//                 child: MyChart(),
//               )
              
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }

