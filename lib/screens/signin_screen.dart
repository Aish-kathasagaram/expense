// import 'package:expense_repository/expense_repository.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:mad_my_app/reusable_widgets/reusable_widget.dart';
// import 'package:mad_my_app/screens/add_expense/blocs/get_categories_bloc/get_categories_bloc.dart';
// import 'package:mad_my_app/screens/home/blocs/get_expenses_bloc/get_expenses_bloc.dart';
// import 'package:mad_my_app/screens/home/blocs/get_expenses_bloc/get_expenses_event.dart';
// import 'package:mad_my_app/screens/home/views/home_screen.dart';
// import 'package:mad_my_app/screens/signup_screen.dart';
// import 'package:mad_my_app/utils/color_utils.dart';

// class SignInScreen extends StatefulWidget {
//   const SignInScreen({super.key});

//   @override
//   State<SignInScreen> createState() => _SignInScreenState();
// }

// class _SignInScreenState extends State<SignInScreen> {
//   TextEditingController _passwordTextController = TextEditingController();
//   TextEditingController _emailTextController = TextEditingController();
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Container(
//         width: MediaQuery.of(context).size.width,
//         height: MediaQuery.of(context).size.height,
//         decoration: BoxDecoration(
//             gradient: LinearGradient(colors: [
//           hexStringToColor("CB2B93"),
//           hexStringToColor("9546C4"),
//           hexStringToColor("5E61F4")
//         ], begin: Alignment.topCenter, end: Alignment.bottomCenter)),
//         child: SingleChildScrollView(
//           child: Padding(
//             padding: EdgeInsets.fromLTRB(
//                 20, MediaQuery.of(context).size.height * 0.2, 20, 0),
//             child: Column(
//               children: <Widget>[
//                 logoWidget("assets/exp.png"),
//                 SizedBox(
//                   height: 30,
//                 ),
//                 reusableTextField("Enter Email Id", Icons.person_outline, false,
//                     _emailTextController),
//                 SizedBox(
//                   height: 20,
//                 ),
//                 reusableTextField("Enter Password", Icons.lock_outline, true,
//                     _passwordTextController),
//                 SizedBox(
//                   height: 20,
//                 ),
//                 signInSignUpButton(context, true, () {
//                   FirebaseAuth.instance
//                       .signInWithEmailAndPassword(
//                           email: _emailTextController.text,
//                           password: _passwordTextController.text)
//                       .then((value) {
//                     Navigator.push(
//                         context,
//                         MaterialPageRoute(
//                             builder: (context) => MultiBlocProvider(
//                                   providers: [
//                                     BlocProvider(
//                                       create: (context) =>
//                                           GetExpensesBloc(FirebaseExpenseRepo())
//                                             ..add(FetchExpenses()),
//                                     ),
//                                     BlocProvider(
//                                       create: (context) => GetCategoriesBloc(
//                                           FirebaseExpenseRepo())
//                                         ..add(FetchCategories()),
//                                     ),
//                                   ],
//                                   child: const HomeScreen(),
//                                 )));
//                   }).onError((error, stackTrace) {
//                     print("kno moment ${error.toString()}");
//                   });
//                 }),
//                 signUpOption()
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }

//   Row signUpOption() {
//     return Row(
//       mainAxisAlignment: MainAxisAlignment.center,
//       children: [
//         const Text("Don't have account?",
//             style: TextStyle(color: Colors.white70)),
//         GestureDetector(
//           onTap: () {
//             Navigator.push(context,
//                 MaterialPageRoute(builder: (context) => SignUpScreen()));
//           },
//           child: const Text(
//             " Sign Up",
//             style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
//           ),
//         )
//       ],
//     );
//   }
// }

// // Widget logoWidget(String imagePath) {
// //   return Image.asset(
// //     imagePath,
// //     height: 150,
// //     width: 150,
// //     fit: BoxFit.contain,
// //     errorBuilder: (context, error, stackTrace) {
// //       return Text(
// //         'Logo not found',
// //         style: TextStyle(color: Colors.white),
// //       );
// //     },
// //   );
// // }

// // Widget logoWidget(String imagePath) {
// //   return Container(
// //     width: 150, // Adjust size as needed for your circular logo
// //     height: 150, // Adjust size as needed for your circular logo
// //     decoration: BoxDecoration(
// //       shape: BoxShape.circle,
// //       gradient: LinearGradient(
// //         colors: [
// //           Color(0xFFE040FB), // Pink color
// //           Color(0xFF833AB4), // Violet-purple color
// //         ],
// //         begin: Alignment.topCenter, // Adjust gradient begin alignment
// //         end: Alignment.bottomCenter, // Adjust gradient end alignment
// //       ),
// //     ),
// //     child: Center(
// //       child: ClipOval(
// //         child: Image.asset(
// //           imagePath,
// //           fit: BoxFit.cover,
// //           width: 140, // Adjust size as needed for your circular logo
// //           height: 140, // Adjust size as needed for your circular logo
// //         ),
// //       ),
// //     ),
// //   );
// // // }

// // Widget logoWidget(String imagePath) {
// //   return Container(
// //     width: 150, // Adjust size as needed for your circular logo
// //     height: 150, // Adjust size as needed for your circular logo
// //     decoration: BoxDecoration(
// //       shape: BoxShape.circle,
// //       gradient: LinearGradient(
// //         colors: [
// //           Color(0xFF64B5F6), // Light Blue
// //           Color(0xFF9575CD), // Purple
// //           Color(0xFFE57373), // Red
// //         ],
// //         stops: [0.0, 0.5, 1.0], // Gradient stops for smooth transitions
// //         begin: Alignment.topLeft, // Adjust gradient begin alignment
// //         end: Alignment.bottomRight, // Adjust gradient end alignment
// //       ),
// //       boxShadow: [
// //         BoxShadow(
// //           color: Colors.black.withOpacity(0.3),
// //           spreadRadius: 2,
// //           blurRadius: 4,
// //           offset: Offset(0, 3), // changes position of shadow
// //         ),
// //       ],
// //     ),
// //     child: Center(
// //       child: ClipOval(
// //         child: Container(
// //           color: Colors.white, // Solid background color for the circular logo
// //           child: Padding(
// //             padding: const EdgeInsets.all(8.0),
// //             child: Image.asset(
// //               imagePath,
// //               fit: BoxFit.cover,
// //               width: 130, // Adjust size as needed for your circular logo
// //               height: 130, // Adjust size as needed for your circular logo
// //             ),
// //           ),
// //         ),
// //       ),
// //     ),
// //   );
// // }

// Widget logoWidget(String imagePath) {
//   return Container(
//     width: 154, // Adjust size as needed for your circular logo
//     height: 154, // Adjust size as needed for your circular logo
//     decoration: BoxDecoration(
//       shape: BoxShape.circle,
//       gradient: RadialGradient(
//         colors: [
//           Color(0xFFEA80FC), // Pink
//           Color(0xFF9575CD), // Purple
//         ],
//         radius: 0.8, // Adjust the radius for the radial gradient effect
//         center: Alignment(0.0, -0.3), // Adjust the center for the radial gradient effect
//       ),
//       boxShadow: [
//         BoxShadow(
//           color: Colors.black.withOpacity(0.3),
//           spreadRadius: 2,
//           blurRadius: 4,
//           offset: Offset(0, 3), // changes position of shadow
//         ),
//       ],
//     ),
//     child: Center(
//       child: ClipOval(
//         child: Container(
//           color: Colors.white, // Solid background color for the circular logo
//           child: Padding(
//             padding: const EdgeInsets.all(8.0),
//             child: Image.asset(
//               imagePath,
//               fit: BoxFit.cover,
//               width: 130, // Adjust size as needed for your circular logo
//               height: 130, // Adjust size as needed for your circular logo
//             ),
//           ),
//         ),
//       ),
//     ),
//   );
// }









import 'package:expense_repository/expense_repository.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mad_my_app/reusable_widgets/reusable_widget.dart';
import 'package:mad_my_app/screens/add_expense/blocs/get_categories_bloc/get_categories_bloc.dart';
import 'package:mad_my_app/screens/home/blocs/get_expenses_bloc/get_expenses_bloc.dart';
import 'package:mad_my_app/screens/home/blocs/get_expenses_bloc/get_expenses_event.dart';
import 'package:mad_my_app/screens/home/views/home_screen.dart';
import 'package:mad_my_app/screens/signup_screen.dart';
import 'package:mad_my_app/utils/color_utils.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final TextEditingController _passwordTextController = TextEditingController();
  final TextEditingController _emailTextController = TextEditingController();
  String? errorMessage; // Variable to hold the error message

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              hexStringToColor("CB2B93"),
              hexStringToColor("9546C4"),
              hexStringToColor("5E61F4")
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.fromLTRB(
              20,
              MediaQuery.of(context).size.height * 0.2,
              20,
              0,
            ),
            child: Column(
              children: <Widget>[
                logoWidget("assets/exp.png"),
                SizedBox(height: 30),
                reusableTextField(
                  "Enter Email Id",
                  Icons.person_outline,
                  false,
                  _emailTextController,
                ),
                SizedBox(height: 20),
                reusableTextField(
                  "Enter Password",
                  Icons.lock_outline,
                  true,
                  _passwordTextController,
                ),
                SizedBox(height: 20),
                if (errorMessage != null) // Show error message if it exists
                  Text(
                    errorMessage!,
                    style: TextStyle(color: Colors.red),
                  ),
                SizedBox(height: 20),
                signInSignUpButton(context, true, () {
                  _signIn();
                }),
                signUpOption(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _signIn() async {
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: _emailTextController.text,
        password: _passwordTextController.text,
      );
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => MultiBlocProvider(
            providers: [
              BlocProvider(
                create: (context) =>
                    GetExpensesBloc(FirebaseExpenseRepo())..add(FetchExpenses()),
              ),
              BlocProvider(
                create: (context) =>
                    GetCategoriesBloc(FirebaseExpenseRepo())..add(FetchCategories()),
              ),
            ],
            child: const HomeScreen(),
          ),
        ),
      );
    } on FirebaseAuthException catch (e) {
      setState(() {
        errorMessage = e.message; // Update the error message to display on the screen
      });
    }
  }

  Row signUpOption() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text(
          "Don't have an account?",
          style: TextStyle(color: Colors.white70),
        ),
        GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => SignUpScreen()),
            );
          },
          child: const Text(
            " Sign Up",
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
        ),
      ],
    );
  }
}

Widget logoWidget(String imagePath) {
  return Container(
    width: 154,
    height: 154,
    decoration: BoxDecoration(
      shape: BoxShape.circle,
      gradient: RadialGradient(
        colors: [
          Color(0xFFEA80FC),
          Color(0xFF9575CD),
        ],
        radius: 0.8,
        center: Alignment(0.0, -0.3),
      ),
      boxShadow: [
        BoxShadow(
          color: Colors.black.withOpacity(0.3),
          spreadRadius: 2,
          blurRadius: 4,
          offset: Offset(0, 3),
        ),
      ],
    ),
    child: Center(
      child: ClipOval(
        child: Container(
          color: Colors.white,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Image.asset(
              imagePath,
              fit: BoxFit.cover,
              width: 130,
              height: 130,
            ),
          ),
        ),
      ),
    ),
  );
}

// import 'package:expense_repository/expense_repository.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:mad_my_app/reusable_widgets/reusable_widget.dart';
// import 'package:mad_my_app/screens/add_expense/blocs/get_categories_bloc/get_categories_bloc.dart';
// import 'package:mad_my_app/screens/home/blocs/get_expenses_bloc/get_expenses_bloc.dart';
// import 'package:mad_my_app/screens/home/blocs/get_expenses_bloc/get_expenses_event.dart';
// import 'package:mad_my_app/screens/home/views/home_screen.dart';
// import 'package:mad_my_app/screens/signup_screen.dart';
// import 'package:mad_my_app/utils/color_utils.dart';

// class SignInScreen extends StatefulWidget {
//   const SignInScreen({super.key});

//   @override
//   State<SignInScreen> createState() => _SignInScreenState();
// }

// class _SignInScreenState extends State<SignInScreen> {
//   TextEditingController _passwordTextController = TextEditingController();
//   TextEditingController _emailTextController = TextEditingController();

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Container(
//         width: MediaQuery.of(context).size.width,
//         height: MediaQuery.of(context).size.height,
//         decoration: BoxDecoration(
//           gradient: LinearGradient(
//             colors: [
//               hexStringToColor("CB2B93"),
//               hexStringToColor("9546C4"),
//               hexStringToColor("5E61F4")
//             ],
//             begin: Alignment.topCenter,
//             end: Alignment.bottomCenter,
//           ),
//         ),
//         child: SingleChildScrollView(
//           child: Padding(
//             padding: EdgeInsets.fromLTRB(
//               20,
//               MediaQuery.of(context).size.height * 0.2,
//               20,
//               0,
//             ),
//             child: Column(
//               children: <Widget>[
//                 logoWidget("assets/exp.png"),
//                 SizedBox(height: 30),
//                 reusableTextField(
//                   "Enter Email Id",
//                   Icons.person_outline,
//                   false,
//                   _emailTextController,
//                 ),
//                 SizedBox(height: 20),
//                 reusableTextField(
//                   "Enter Password",
//                   Icons.lock_outline,
//                   true,
//                   _passwordTextController,
//                 ),
//                 SizedBox(height: 20),
//                 signInSignUpButton(context, true, () {
//                   _signIn();
//                 }),
//                 signUpOption(),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }

//   void _signIn() {
//     FirebaseAuth.instance
//         .signInWithEmailAndPassword(
//           email: _emailTextController.text,
//           password: _passwordTextController.text,
//         )
//         .then((value) {
//       Navigator.push(
//         context,
//         MaterialPageRoute(
//           builder: (context) => MultiBlocProvider(
//             providers: [
//               BlocProvider(
//                 create: (context) =>
//                     GetExpensesBloc(FirebaseExpenseRepo())..add(FetchExpenses()),
//               ),
//               BlocProvider(
//                 create: (context) =>
//                     GetCategoriesBloc(FirebaseExpenseRepo())..add(FetchCategories()),
//               ),
//             ],
//             child: const HomeScreen(),
//           ),
//         ),
//       );
//     }).catchError((error) {
//       showDialog(
//         context: context,
//         builder: (context) {
//           return AlertDialog(
//             title: Text('Login Failed'),
//             content: Text(error.message), // Display Firebase error message
//             actions: [
//               TextButton(
//                 onPressed: () {
//                   Navigator.of(context).pop();
//                 },
//                 child: Text('OK'),
//               ),
//             ],
//           );
//         },
//       );
//     });
//   }

//   Row signUpOption() {
//     return Row(
//       mainAxisAlignment: MainAxisAlignment.center,
//       children: [
//         const Text(
//           "Don't have an account?",
//           style: TextStyle(color: Colors.white70),
//         ),
//         GestureDetector(
//           onTap: () {
//             Navigator.push(
//               context,
//               MaterialPageRoute(builder: (context) => SignUpScreen()),
//             );
//           },
//           child: const Text(
//             " Sign Up",
//             style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
//           ),
//         ),
//       ],
//     );
//   }
// }

// Widget logoWidget(String imagePath) {
//   return Container(
//     width: 154,
//     height: 154,
//     decoration: BoxDecoration(
//       shape: BoxShape.circle,
//       gradient: RadialGradient(
//         colors: [
//           Color(0xFFEA80FC),
//           Color(0xFF9575CD),
//         ],
//         radius: 0.8,
//         center: Alignment(0.0, -0.3),
//       ),
//       boxShadow: [
//         BoxShadow(
//           color: Colors.black.withOpacity(0.3),
//           spreadRadius: 2,
//           blurRadius: 4,
//           offset: Offset(0, 3),
//         ),
//       ],
//     ),
//     child: Center(
//       child: ClipOval(
//         child: Container(
//           color: Colors.white,
//           child: Padding(
//             padding: const EdgeInsets.all(8.0),
//             child: Image.asset(
//               imagePath,
//               fit: BoxFit.cover,
//               width: 130,
//               height: 130,
//             ),
//           ),
//         ),
//       ),
//     ),
//   );
// }




// Widget logoWidget(String imagePath) {
//   return Container(
//     width: 160, // Adjust size as needed for your circular logo
//     height: 160, // Adjust size as needed for your circular logo
//     decoration: BoxDecoration(
//       shape: BoxShape.circle,
//       gradient: RadialGradient(
//         colors: [
//           Color(0xFFEA80FC), // Pink
//           Color(0xFF9575CD), // Purple
//         ],
//         radius: 0.8, // Adjust the radius for the radial gradient effect
//         center: Alignment(0.0, -0.3), // Adjust the center for the radial gradient effect
//       ),
//       boxShadow: [
//         BoxShadow(
//           color: Colors.black.withOpacity(0.3),
//           spreadRadius: 2,
//           blurRadius: 4,
//           offset: Offset(0, 3), // changes position of shadow
//         ),
//       ],
//     ),
//     child: Center(
//       child: ClipOval(
//         child: Container(
//           color: Colors.white, // Solid background color for the circular logo
//           child: Padding(
//             padding: const EdgeInsets.all(10.0), // Increased padding for zoom effect
//             child: Image.asset(
//               imagePath,
//               fit: BoxFit.cover,
//               width: 140, // Adjust size as needed for your circular logo
//               height: 140, // Adjust size as needed for your circular logo
//             ),
//           ),
//         ),
//       ),
//     ),
//   );
// }