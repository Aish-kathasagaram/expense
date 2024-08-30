// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:mad_my_app/reusable_widgets/reusable_widget.dart';
// //import 'package:mad_my_app/screens/home/views/home_screen.dart';
// import 'package:mad_my_app/screens/signin_screen.dart';
// import 'package:mad_my_app/utils/color_utils.dart';

// class SignUpScreen extends StatefulWidget {
//   const SignUpScreen({Key? key}) : super(key: key);

//   @override
//   _SignUpScreenState createState() => _SignUpScreenState();
// }

// class _SignUpScreenState extends State<SignUpScreen> {
//   TextEditingController _passwordTextController = TextEditingController();
//   TextEditingController _emailTextController = TextEditingController();
//   TextEditingController _userNameTextController = TextEditingController();
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       extendBodyBehindAppBar: true,
//       appBar: AppBar(
//         backgroundColor: Colors.transparent,
//         elevation: 0,
//         title: const Text(
//           "Sign Up",
//           style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
//         ),
//       ),
//       body: Container(
//           width: MediaQuery.of(context).size.width,
//           height: MediaQuery.of(context).size.height,
//           decoration: BoxDecoration(
//               gradient: LinearGradient(colors: [
//             hexStringToColor("CB2B93"),
//             hexStringToColor("9546C4"),
//             hexStringToColor("5E61F4")
//           ], begin: Alignment.topCenter, end: Alignment.bottomCenter)),
//           child: SingleChildScrollView(
//               child: Padding(
//             padding: EdgeInsets.fromLTRB(20, 120, 20, 0),
//             child: Column(
//               children: <Widget>[
//                 const SizedBox(
//                   height: 20,
//                 ),
//                 reusableTextField("Enter UserName", Icons.person_outline, false,
//                     _userNameTextController),
//                 const SizedBox(
//                   height: 20,
//                 ),
//                 reusableTextField("Enter Email Id", Icons.person_outline, false,
//                     _emailTextController),
//                 const SizedBox(
//                   height: 20,
//                 ),
//                 reusableTextField("Enter Password", Icons.lock_outlined, true,
//                     _passwordTextController),
//                 const SizedBox(
//                   height: 20,
//                 ),
//                 signInSignUpButton(context, false, () {
//                   FirebaseAuth.instance
//                       .createUserWithEmailAndPassword(
//                           email: _emailTextController.text,
//                           password: _passwordTextController.text)
//                       .then((value) {
//                     Navigator.push(
//                         context,
//                         MaterialPageRoute(
//                             builder: (context) => const SignInScreen()));
//                   }).onError((error, stackTrace) {
//                     print("kno moment ${error.toString()}");
//                   });
//                 })
//               ],
//             ),
//           ))),
//     );
//   }
// }

















import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mad_my_app/reusable_widgets/reusable_widget.dart';
import 'package:mad_my_app/screens/signin_screen.dart';
import 'package:mad_my_app/utils/color_utils.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final TextEditingController _passwordTextController = TextEditingController();
  final TextEditingController _emailTextController = TextEditingController();
  final TextEditingController _userNameTextController = TextEditingController();
  String? errorMessage; // Variable to hold the error message

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text(
          "Sign Up",
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
      ),
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
            padding: EdgeInsets.fromLTRB(20, 120, 20, 0),
            child: Column(
              children: <Widget>[
                const SizedBox(height: 20),
                reusableTextField(
                  "Enter UserName",
                  Icons.person_outline,
                  false,
                  _userNameTextController,
                ),
                const SizedBox(height: 20),
                reusableTextField(
                  "Enter Email Id",
                  Icons.person_outline,
                  false,
                  _emailTextController,
                ),
                const SizedBox(height: 20),
                reusableTextField(
                  "Enter Password",
                  Icons.lock_outlined,
                  true,
                  _passwordTextController,
                ),
                const SizedBox(height: 20),
                if (errorMessage != null) // Show error message if it exists
                  Text(
                    errorMessage!,
                    style: TextStyle(color: Colors.red),
                  ),
                const SizedBox(height: 20),
                signInSignUpButton(context, false, () {
                  _signUp();
                }),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _signUp() async {
    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: _emailTextController.text,
        password: _passwordTextController.text,
      );
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const SignInScreen()),
      );
    } on FirebaseAuthException catch (e) {
      setState(() {
        errorMessage = e.message; // Update the error message to display on the screen
      });
    }
  }
}

// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:mad_my_app/reusable_widgets/reusable_widget.dart';
// import 'package:mad_my_app/screens/signin_screen.dart';
// import 'package:mad_my_app/utils/color_utils.dart';

// class SignUpScreen extends StatefulWidget {
//   const SignUpScreen({Key? key}) : super(key: key);

//   @override
//   _SignUpScreenState createState() => _SignUpScreenState();
// }

// class _SignUpScreenState extends State<SignUpScreen> {
//   TextEditingController _passwordTextController = TextEditingController();
//   TextEditingController _emailTextController = TextEditingController();
//   TextEditingController _userNameTextController = TextEditingController();

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       extendBodyBehindAppBar: true,
//       appBar: AppBar(
//         backgroundColor: Colors.transparent,
//         elevation: 0,
//         title: const Text(
//           "Sign Up",
//           style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
//         ),
//       ),
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
//             padding: EdgeInsets.fromLTRB(20, 120, 20, 0),
//             child: Column(
//               children: <Widget>[
//                 const SizedBox(height: 20),
//                 reusableTextField(
//                   "Enter UserName",
//                   Icons.person_outline,
//                   false,
//                   _userNameTextController,
//                 ),
//                 const SizedBox(height: 20),
//                 reusableTextField(
//                   "Enter Email Id",
//                   Icons.person_outline,
//                   false,
//                   _emailTextController,
//                 ),
//                 const SizedBox(height: 20),
//                 reusableTextField(
//                   "Enter Password",
//                   Icons.lock_outlined,
//                   true,
//                   _passwordTextController,
//                 ),
//                 const SizedBox(height: 20),
//                 signInSignUpButton(context, false, () {
//                   _signUp();
//                 }),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }

//   void _signUp() {
//     FirebaseAuth.instance
//         .createUserWithEmailAndPassword(
//           email: _emailTextController.text,
//           password: _passwordTextController.text,
//         )
//         .then((value) {
//       Navigator.push(
//         context,
//         MaterialPageRoute(builder: (context) => const SignInScreen()),
//       );
//     }).catchError((error) {
//       showDialog(
//         context: context,
//         builder: (context) {
//           return AlertDialog(
//             title: Text('Signup Failed'),
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
// }




// import 'dart:math';

// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:mad_my_app/reusable_widgets/reusable_widget.dart';
// //import 'package:mad_my_app/screens/home/views/home_screen.dart';
// import 'package:mad_my_app/screens/signin_screen.dart';
// import 'package:mad_my_app/utils/color_utils.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:fluttertoast/fluttertoast.dart';

// class SignUpScreen extends StatefulWidget {
//   const SignUpScreen({Key? key}) : super(key: key);

//   @override
//   _SignUpScreenState createState() => _SignUpScreenState();
// }

// class _SignUpScreenState extends State<SignUpScreen> {
//   TextEditingController _passwordTextController = TextEditingController();
//   TextEditingController _emailTextController = TextEditingController();
//   TextEditingController _userNameTextController = TextEditingController();
//   TextEditingController _otpTextController = TextEditingController();
//   bool isOTPSent = false;
//   String generatedOTP = "";

//   void sendOTP() {
//     // Generate a 6-digit OTP
//     generatedOTP = (100000 + (Random().nextInt(900000))).toString();

//     // Send the OTP to the email using a service like Firebase or any email API
//     // For demonstration, we use Fluttertoast to show the OTP
//     Fluttertoast.showToast(
//       msg: "OTP sent to email: $generatedOTP",
//       toastLength: Toast.LENGTH_SHORT,
//       gravity: ToastGravity.BOTTOM,
//     );

//     setState(() {
//       isOTPSent = true;
//     });
//   }

//   void verifyOTP() {
//     if (_otpTextController.text == generatedOTP) {
//       signUp();
//     } else {
//       Fluttertoast.showToast(
//         msg: "Invalid OTP",
//         toastLength: Toast.LENGTH_SHORT,
//         gravity: ToastGravity.BOTTOM,
//       );
//     }
//   }

//   void signUp() {
//     FirebaseAuth.instance
//         .createUserWithEmailAndPassword(
//             email: _emailTextController.text,
//             password: _passwordTextController.text)
//         .then((value) {
//       Navigator.push(
//           context, MaterialPageRoute(builder: (context) => const SignInScreen()));
//     }).onError((error, stackTrace) {
//       print("Error ${error.toString()}");
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       extendBodyBehindAppBar: true,
//       appBar: AppBar(
//         backgroundColor: Colors.transparent,
//         elevation: 0,
//         title: const Text(
//           "Sign Up",
//           style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
//         ),
//       ),
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
//             padding: EdgeInsets.fromLTRB(20, 120, 20, 0),
//             child: Column(
//               children: <Widget>[
//                 const SizedBox(height: 20),
//                 reusableTextField(
//                   "Enter UserName",
//                   Icons.person_outline,
//                   false,
//                   _userNameTextController,
//                 ),
//                 const SizedBox(height: 20),
//                 reusableTextField(
//                   "Enter Email Id",
//                   Icons.person_outline,
//                   false,
//                   _emailTextController,
//                 ),
//                 const SizedBox(height: 20),
//                 reusableTextField(
//                   "Enter Password",
//                   Icons.lock_outlined,
//                   true,
//                   _passwordTextController,
//                 ),
//                 const SizedBox(height: 20),
//                 if (isOTPSent)
//                   Column(
//                     children: [
//                       reusableTextField(
//                         "Enter OTP",
//                         Icons.security,
//                         false,
//                         _otpTextController,
//                       ),
//                       const SizedBox(height: 20),
//                       signInSignUpButton(context, false, verifyOTP),
//                       const SizedBox(height: 20),
//                       TextButton(
//                         onPressed: sendOTP,
//                         child: Text("Retry OTP"),
//                       ),
//                     ],
//                   )
//                 else
//                   signInSignUpButton(context, false, sendOTP),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
