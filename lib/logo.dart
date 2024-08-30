// import 'dart:async';
// import 'package:flutter/material.dart';
// import 'package:mad_my_app/screens/signin_screen.dart';

// class SplashScreen extends StatefulWidget {
//   const SplashScreen({Key? key}) : super(key: key);

//   @override
//   _SplashScreenState createState() => _SplashScreenState();
// }

// class _SplashScreenState extends State<SplashScreen>
//     with SingleTickerProviderStateMixin {
//   late AnimationController _controller;
//   late Animation<double> _animation;

//   @override
//   void initState() {
//     super.initState();
    
//     // Initialize animation controller
//     _controller = AnimationController(
//       vsync: this,
//       duration: Duration(seconds: 2), // Adjust duration as needed
//     );

//     // Define animation
//     _animation = Tween<double>(begin: 0, end: 1).animate(_controller);

//     // Start animation
//     _controller.forward();

//     // Navigate to SignInScreen after animation completes
//     Timer(Duration(seconds: 3), () {
//       Navigator.pushReplacement(
//         context,
//         MaterialPageRoute(builder: (context) => const SignInScreen()),
//       );
//     });
//   }

//   @override
//   void dispose() {
//     _controller.dispose(); // Dispose animation controller
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white, // Adjust background color as needed
//       body: Center(
//         child: FadeTransition(
//           opacity: _animation,
//           child: Container(
//             width: 200, // Adjust size of logo container as needed
//             height: 200, // Adjust size of logo container as needed
//             decoration: BoxDecoration(
//               shape: BoxShape.circle,
//               gradient: RadialGradient(
//                 colors: [
//                   Color(0xFFEA80FC), // Pink
//                   Color(0xFF9575CD), // Purple
//                 ],
//                 radius: 0.8, // Adjust the radius for the radial gradient effect
//                 center: Alignment(0.0, -0.3), // Adjust the center for the radial gradient effect
//               ),
//               boxShadow: [
//                 BoxShadow(
//                   color: Colors.black.withOpacity(0.3),
//                   spreadRadius: 2,
//                   blurRadius: 4,
//                   offset: Offset(0, 3), // changes position of shadow
//                 ),
//               ],
//             ),
//             child: Center(
//               child: ClipOval(
//                 child: Container(
//                   color: Colors.white, // Solid background color for the circular logo
//                   child: Padding(
//                     padding: const EdgeInsets.all(12.0), // Padding around the logo
//                     child: Image.asset(
//                       "assets/exp.png", // Replace with your logo image path
//                       fit: BoxFit.cover,
//                       width: 100, // Adjust size of logo image as needed
//                       height: 100, // Adjust size of logo image as needed
//                     ),
//                   ),
//                 ),
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }


// import 'dart:async';
// import 'package:flutter/material.dart';
// import 'package:mad_my_app/screens/signin_screen.dart';

// class SplashScreen extends StatefulWidget {
//   const SplashScreen({Key? key}) : super(key: key);

//   @override
//   _SplashScreenState createState() => _SplashScreenState();
// }

// class _SplashScreenState extends State<SplashScreen>
//     with SingleTickerProviderStateMixin {
//   late AnimationController _controller;
//   late Animation<double> _animation;

//   @override
//   void initState() {
//     super.initState();
    
//     _controller = AnimationController(
//       vsync: this,
//       duration: Duration(seconds: 2),
//     );

//     _animation = Tween<double>(begin: 0, end: 1).animate(_controller);

//     _controller.forward();

//     Timer(Duration(seconds: 3), () {
//       Navigator.pushReplacement(
//         context,
//         MaterialPageRoute(builder: (context) => const SignInScreen()),
//       );
//     });
//   }

//   @override
//   void dispose() {
//     _controller.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.transparent,
//       body: AnimatedContainer(
//         duration: Duration(seconds: 2),
//         decoration: BoxDecoration(
//           gradient: LinearGradient(
//             colors: [
//               Color(0xFF6A1B9A), // Dark Purple
//               Color(0xFFD81B60), // Pink
//             ],
//             begin: Alignment.topLeft,
//             end: Alignment.bottomRight,
//             stops: [0.0, 1.0],
//           ),
//         ),
//         child: Center(
//           child: Hero(
//             tag: 'logoHero', // Tag for Hero animation
//             child: Container(
//               width: 200,
//               height: 200,
//               decoration: BoxDecoration(
//                 shape: BoxShape.circle,
//                 boxShadow: [
//                   BoxShadow(
//                     color: Colors.black.withOpacity(0.3),
//                     spreadRadius: 2,
//                     blurRadius: 4,
//                     offset: Offset(0, 3),
//                   ),
//                 ],
//               ),
//               child: ClipOval(
//                 child: Image.asset(
//                   "assets/exp.png", // Replace with your logo image path
//                   fit: BoxFit.cover,
//                 ),
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }



// import 'dart:async';
// import 'package:flutter/material.dart';
// import 'package:mad_my_app/screens/signin_screen.dart';

// class SplashScreen extends StatefulWidget {
//   const SplashScreen({Key? key}) : super(key: key);

//   @override
//   _SplashScreenState createState() => _SplashScreenState();
// }

// class _SplashScreenState extends State<SplashScreen>
//     with SingleTickerProviderStateMixin {
//   late AnimationController _controller;
//   late Animation<double> _animation;

//   @override
//   void initState() {
//     super.initState();
    
//     _controller = AnimationController(
//       vsync: this,
//       duration: Duration(seconds: 2),
//     );

//     _animation = Tween<double>(begin: 0, end: 1).animate(_controller);

//     _controller.forward();

//     Timer(Duration(seconds: 3), () {
//       Navigator.pushReplacement(
//         context,
//         MaterialPageRoute(builder: (context) => const SignInScreen()),
//       );
//     });
//   }

//   @override
//   void dispose() {
//     _controller.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.transparent,
//       body: Stack(
//         children: [
//           AnimatedBackground(animation: _animation),
//           Center(
//             child: Hero(
//               tag: 'logoHero',
//               child: Container(
//                 width: 200,
//                 height: 200,
//                 decoration: BoxDecoration(
//                   shape: BoxShape.circle,
//                   boxShadow: [
//                     BoxShadow(
//                       color: Colors.black.withOpacity(0.3),
//                       spreadRadius: 2,
//                       blurRadius: 4,
//                       offset: Offset(0, 3),
//                     ),
//                   ],
//                 ),
//                 child: ClipOval(
//                   child: Image.asset(
//                     "assets/exp.png", // Replace with your logo image path
//                     fit: BoxFit.cover,
//                   ),
//                 ),
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

// class AnimatedBackground extends StatelessWidget {
//   final Animation<double> animation;

//   const AnimatedBackground({required this.animation, Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return AnimatedBuilder(
//       animation: animation,
//       builder: (context, child) {
//         return Container(
//           decoration: BoxDecoration(
//             gradient: LinearGradient(
//               colors: [
//                 Color(0xFF6A1B9A), // Dark Purple
//                 Color(0xFFD81B60), // Pink
//               ],
//               begin: Alignment.topLeft,
//               end: Alignment.bottomRight,
//               stops: [0.0, 1.0],
//             ),
//           ),
//           child: Opacity(
//             opacity: 0.5, // Adjust opacity of pattern flow
//             child: CustomPaint(
//               size: Size(MediaQuery.of(context).size.width,
//                   MediaQuery.of(context).size.height),
//               painter: MyPainter(animation.value),
//             ),
//           ),
//         );
//       },
//     );
//   }
// }

// class MyPainter extends CustomPainter {
//   final double animationValue;

//   MyPainter(this.animationValue);

//   @override
//   void paint(Canvas canvas, Size size) {
//     Paint paint = Paint()
//       ..color = Colors.white.withOpacity(0.3) // Adjust color and opacity
//       ..style = PaintingStyle.fill;

//     // Draw your custom pattern or flow here
//     Path path = Path();
//     path.moveTo(0, size.height / 2);
//     path.quadraticBezierTo(
//         size.width * 0.25, size.height * 0.4, size.width * 0.5, size.height * 0.6);
//     path.quadraticBezierTo(
//         size.width * 0.75, size.height * 0.8, size.width, size.height * 0.7);
//     path.lineTo(size.width, size.height);
//     path.lineTo(0, size.height);
//     path.close();

//     canvas.drawPath(path, paint);
//   }

//   @override
//   bool shouldRepaint(covariant CustomPainter oldDelegate) {
//     return true;
//   }
// }


// //nice code
// import 'dart:async';
// import 'package:flutter/material.dart';
// import 'package:mad_my_app/screens/signin_screen.dart';

// class SplashScreen extends StatefulWidget {
//   const SplashScreen({Key? key}) : super(key: key);

//   @override
//   _SplashScreenState createState() => _SplashScreenState();
// }

// class _SplashScreenState extends State<SplashScreen>
//     with SingleTickerProviderStateMixin {
//   late AnimationController _controller;
//   late Animation<double> _scaleAnimation;
//   late Animation<double> _opacityAnimation;

//   @override
//   void initState() {
//     super.initState();

//     _controller = AnimationController(
//       vsync: this,
//       duration: Duration(seconds: 2),
//     );

//     _scaleAnimation = Tween<double>(begin: 0, end: 1).animate(
//       CurvedAnimation(parent: _controller, curve: Curves.easeInOutBack),
//     );

//     _opacityAnimation = Tween<double>(begin: 0, end: 1).animate(
//       CurvedAnimation(parent: _controller, curve: Curves.easeInOut),
//     );

//     _controller.forward();

//     Timer(Duration(seconds: 3), () {
//       Navigator.pushReplacement(
//         context,
//         MaterialPageRoute(builder: (context) => const SignInScreen()),
//       );
//     });
//   }

//   @override
//   void dispose() {
//     _controller.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.transparent,
//       body: Stack(
//         children: [
//           AnimatedBackground(),
//           Center(
//             child: AnimatedBuilder(
//               animation: _controller,
//               builder: (context, child) {
//                 return Opacity(
//                   opacity: _opacityAnimation.value,
//                   child: Transform.scale(
//                     scale: _scaleAnimation.value,
//                     child: Hero(
//                       tag: 'logoHero',
//                       child: Container(
//                         width: 200,
//                         height: 200,
//                         decoration: BoxDecoration(
//                           shape: BoxShape.circle,
//                           boxShadow: [
//                             BoxShadow(
//                               color: Colors.black.withOpacity(0.3),
//                               spreadRadius: 2,
//                               blurRadius: 4,
//                               offset: Offset(0, 3),
//                             ),
//                           ],
//                         ),
//                         child: ClipOval(
//                           child: Image.asset(
//                             "assets/exp.png", // Replace with your logo image path
//                             fit: BoxFit.cover,
//                           ),
//                         ),
//                       ),
//                     ),
//                   ),
//                 );
//               },
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

// class AnimatedBackground extends StatelessWidget {
//   const AnimatedBackground({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       decoration: BoxDecoration(
//         gradient: LinearGradient(
//           colors: [
//             Color(0xFF6A1B9A), // Dark Purple
//             Color(0xFFD81B60), // Pink
//           ],
//           begin: Alignment.topLeft,
//           end: Alignment.bottomRight,
//           stops: [0.0, 1.0],
//         ),
//       ),
//       child: Opacity(
//         opacity: 0.5, // Adjust opacity of pattern flow
//         child: CustomPaint(
//           size: Size(MediaQuery.of(context).size.width,
//               MediaQuery.of(context).size.height),
//           painter: MyPainter(),
//         ),
//       ),
//     );
//   }
// }

// class MyPainter extends CustomPainter {
//   @override
//   void paint(Canvas canvas, Size size) {
//     Paint paint = Paint()
//       ..color = Colors.white.withOpacity(0.3) // Adjust color and opacity
//       ..style = PaintingStyle.fill;

//     // Draw your custom pattern or flow here
//     Path path = Path();
//     path.moveTo(0, size.height / 2);
//     path.quadraticBezierTo(
//         size.width * 0.25, size.height * 0.4, size.width * 0.5, size.height * 0.6);
//     path.quadraticBezierTo(
//         size.width * 0.75, size.height * 0.8, size.width, size.height * 0.7);
//     path.lineTo(size.width, size.height);
//     path.lineTo(0, size.height);
//     path.close();

//     canvas.drawPath(path, paint);
//   }

//   @override
//   bool shouldRepaint(covariant CustomPainter oldDelegate) {
//     return true;
//   }
// }




// import 'dart:async';
// import 'package:flutter/material.dart';
// import 'package:mad_my_app/screens/signin_screen.dart';

// class SplashScreen extends StatefulWidget {
//   const SplashScreen({Key? key}) : super(key: key);

//   @override
//   _SplashScreenState createState() => _SplashScreenState();
// }

// class _SplashScreenState extends State<SplashScreen>
//     with SingleTickerProviderStateMixin {
//   late AnimationController _controller;
//   late Animation<double> _scaleAnimation;
//   late Animation<double> _opacityAnimation;
//   late Timer _timer;
//   String _slogan = '';
//   int _index = 0;

//   @override
//   void initState() {
//     super.initState();

//     _controller = AnimationController(
//       vsync: this,
//       duration: Duration(seconds: 3),
//     );

//     _scaleAnimation = Tween<double>(begin: 0, end: 1).animate(
//       CurvedAnimation(parent: _controller, curve: Curves.easeInOutBack),
//     );

//     _opacityAnimation = Tween<double>(begin: 0, end: 1).animate(
//       CurvedAnimation(parent: _controller, curve: Curves.easeInOut),
//     );

//     _controller.forward();

//     _timer = Timer.periodic(Duration(milliseconds: 300), (timer) {
//       if (_index < "Enhancing Your Daily Productivity".length) {
//         setState(() {
//           _index++;
//           _slogan = "Enhancing Your Daily Productivity".substring(0, _index);
//         });
//       } else {
//         timer.cancel();
//         _navigateToSignInScreen();
//       }
//     });
//   }

//   @override
//   void dispose() {
//     _controller.dispose();
//     _timer.cancel();
//     super.dispose();
//   }

//   void _navigateToSignInScreen() {
//     Navigator.pushReplacement(
//       context,
//       MaterialPageRoute(builder: (context) => const SignInScreen()),
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.transparent,
//       body: Stack(
//         children: [
//           AnimatedBackground(),
//           Center(
//             child: AnimatedBuilder(
//               animation: _controller,
//               builder: (context, child) {
//                 return Opacity(
//                   opacity: _opacityAnimation.value,
//                   child: Transform.scale(
//                     scale: _scaleAnimation.value,
//                     child: Hero(
//                       tag: 'logoHero',
//                       child: Container(
//                         width: 200,
//                         height: 200,
//                         decoration: BoxDecoration(
//                           shape: BoxShape.circle,
//                           boxShadow: [
//                             BoxShadow(
//                               color: Colors.black.withOpacity(0.3),
//                               spreadRadius: 2,
//                               blurRadius: 4,
//                               offset: Offset(0, 3),
//                             ),
//                           ],
//                         ),
//                         child: ClipOval(
//                           child: Image.asset(
//                             "assets/exp.png", // Replace with your logo image path
//                             fit: BoxFit.cover,
//                           ),
//                         ),
//                       ),
//                     ),
//                   ),
//                 );
//               },
//             ),
//           ),
//           Align(
//             alignment: Alignment.bottomCenter,
//             child: Padding(
//               padding: const EdgeInsets.only(bottom: 40.0),
//               child: FadeTransition(
//                 opacity: _opacityAnimation,
//                 child: Text(
//                   _slogan,
//                   style: TextStyle(
//                     color: Colors.white,
//                     fontSize: 24,
//                     fontWeight: FontWeight.bold,
//                   ),
//                 ),
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

// class AnimatedBackground extends StatelessWidget {
//   const AnimatedBackground({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       decoration: BoxDecoration(
//         gradient: LinearGradient(
//           colors: [
//             Color(0xFF6A1B9A), // Dark Purple
//             Color(0xFFD81B60), // Pink
//           ],
//           begin: Alignment.topLeft,
//           end: Alignment.bottomRight,
//           stops: [0.0, 1.0],
//         ),
//       ),
//       child: Opacity(
//         opacity: 0.5, // Adjust opacity of pattern flow
//         child: CustomPaint(
//           size: Size(MediaQuery.of(context).size.width,
//               MediaQuery.of(context).size.height),
//           painter: MyPainter(),
//         ),
//       ),
//     );
//   }
// }

// class MyPainter extends CustomPainter {
//   @override
//   void paint(Canvas canvas, Size size) {
//     Paint paint = Paint()
//       ..color = Colors.white.withOpacity(0.3) // Adjust color and opacity
//       ..style = PaintingStyle.fill;

//     // Draw your custom pattern or flow here
//     Path path = Path();
//     path.moveTo(0, size.height / 2);
//     path.quadraticBezierTo(
//         size.width * 0.25, size.height * 0.4, size.width * 0.5, size.height * 0.6);
//     path.quadraticBezierTo(
//         size.width * 0.75, size.height * 0.8, size.width, size.height * 0.7);
//     path.lineTo(size.width, size.height);
//     path.lineTo(0, size.height);
//     path.close();

//     canvas.drawPath(path, paint);
//   }

//   @override
//   bool shouldRepaint(covariant CustomPainter oldDelegate) {
//     return true;
//   }
// }




// import 'dart:async';
// import 'package:flutter/material.dart';
// import 'package:mad_my_app/screens/signin_screen.dart';

// class SplashScreen extends StatefulWidget {
//   const SplashScreen({Key? key}) : super(key: key);

//   @override
//   _SplashScreenState createState() => _SplashScreenState();
// }

// class _SplashScreenState extends State<SplashScreen>
//     with SingleTickerProviderStateMixin {
//   late AnimationController _controller;
//   late Animation<double> _scaleAnimation;
//   late Animation<double> _opacityAnimation;
//   late Timer _timer;
//   String _slogan = '';
//   int _index = 0;

//   @override
//   void initState() {
//     super.initState();

//     _controller = AnimationController(
//       vsync: this,
//       duration: Duration(seconds: 3),
//     );

//     _scaleAnimation = Tween<double>(begin: 0, end: 1).animate(
//       CurvedAnimation(parent: _controller, curve: Curves.easeInOutBack),
//     );

//     _opacityAnimation = Tween<double>(begin: 0, end: 1).animate(
//       CurvedAnimation(parent: _controller, curve: Curves.easeInOut),
//     );

//     _controller.forward();

//     _timer = Timer.periodic(Duration(milliseconds: 300), (timer) {
//       if (_index < "Enhancing Your Daily Productivity".length) {
//         setState(() {
//           _index++;
//           _slogan = "Enhancing Your Daily Productivity".substring(0, _index);
//         });
//       } else {
//         timer.cancel();
//         _navigateToSignInScreen();
//       }
//     });
//   }

//   @override
//   void dispose() {
//     _controller.dispose();
//     _timer.cancel();
//     super.dispose();
//   }

//   void _navigateToSignInScreen() {
//     Navigator.pushReplacement(
//       context,
//       MaterialPageRoute(builder: (context) => const SignInScreen()),
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.transparent,
//       body: Stack(
//         children: [
//           AnimatedBackground(),
//           Center(
//             child: AnimatedBuilder(
//               animation: _controller,
//               builder: (context, child) {
//                 return Opacity(
//                   opacity: _opacityAnimation.value,
//                   child: Transform.scale(
//                     scale: _scaleAnimation.value,
//                     child: Hero(
//                       tag: 'logoHero',
//                       child: Container(
//                         width: 200,
//                         height: 200,
//                         decoration: BoxDecoration(
//                           shape: BoxShape.circle,
//                           boxShadow: [
//                             BoxShadow(
//                               color: Colors.black.withOpacity(0.3),
//                               spreadRadius: 2,
//                               blurRadius: 4,
//                               offset: Offset(0, 3),
//                             ),
//                           ],
//                         ),
//                         child: ClipOval(
//                           child: Image.asset(
//                             "assets/exp.png", // Replace with your logo image path
//                             fit: BoxFit.cover,
//                           ),
//                         ),
//                       ),
//                     ),
//                   ),
//                 );
//               },
//             ),
//           ),
//           Align(
//             alignment: Alignment.bottomCenter,
//             child: Padding(
//               padding: const EdgeInsets.only(bottom: 40.0),
//               child: FadeTransition(
//                 opacity: _opacityAnimation,
//                 child: Column(
//                   mainAxisSize: MainAxisSize.min,
//                   children: [
//                     Text(
//                       _slogan,
//                       style: TextStyle(
//                         color: Colors.white,
//                         fontSize: 24,
//                         fontWeight: FontWeight.bold,
//                         fontFamily: 'Roboto', // Example of setting font family
//                       ),
//                       textAlign: TextAlign.center,
//                     ),
//                     SizedBox(height: 16),
//                     CircularProgressIndicator( // Example of adding a loading indicator
//                       valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

// class AnimatedBackground extends StatelessWidget {
//   const AnimatedBackground({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       decoration: BoxDecoration(
//         gradient: LinearGradient(
//           colors: [
//             Color(0xFF6A1B9A), // Dark Purple
//             Color(0xFFD81B60), // Pink
//           ],
//           begin: Alignment.topLeft,
//           end: Alignment.bottomRight,
//           stops: [0.0, 1.0],
//         ),
//       ),
//       child: Opacity(
//         opacity: 0.5, // Adjust opacity of pattern flow
//         child: CustomPaint(
//           size: Size(MediaQuery.of(context).size.width,
//               MediaQuery.of(context).size.height),
//           painter: MyPainter(),
//         ),
//       ),
//     );
//   }
// }

// class MyPainter extends CustomPainter {
//   @override
//   void paint(Canvas canvas, Size size) {
//     Paint paint = Paint()
//       ..color = Colors.white.withOpacity(0.3) // Adjust color and opacity
//       ..style = PaintingStyle.fill;

//     // Draw your custom pattern or flow here
//     Path path = Path();
//     path.moveTo(0, size.height / 2);
//     path.quadraticBezierTo(
//         size.width * 0.25, size.height * 0.4, size.width * 0.5, size.height * 0.6);
//     path.quadraticBezierTo(
//         size.width * 0.75, size.height * 0.8, size.width, size.height * 0.7);
//     path.lineTo(size.width, size.height);
//     path.lineTo(0, size.height);
//     path.close();

//     canvas.drawPath(path, paint);
//   }

//   @override
//   bool shouldRepaint(covariant CustomPainter oldDelegate) {
//     return true;
//   }
// }




//very good code
// import 'dart:async';
// import 'package:flutter/material.dart';
// import 'package:mad_my_app/screens/signin_screen.dart';

// class SplashScreen extends StatefulWidget {
//   const SplashScreen({Key? key}) : super(key: key);

//   @override
//   _SplashScreenState createState() => _SplashScreenState();
// }

// class _SplashScreenState extends State<SplashScreen>
//     with SingleTickerProviderStateMixin {
//   late AnimationController _controller;
//   late Animation<double> _scaleAnimation;
//   late Animation<double> _opacityAnimation;
//   late Timer _timer;
//   String _slogan = '';
//   int _index = 0;

//   @override
//   void initState() {
//     super.initState();

//     _controller = AnimationController(
//       vsync: this,
//       duration: Duration(milliseconds: 2000), // Adjust duration as needed
//     );

//     _scaleAnimation = Tween<double>(begin: 0, end: 1).animate(
//       CurvedAnimation(parent: _controller, curve: Curves.easeInOutBack),
//     );

//     _opacityAnimation = Tween<double>(begin: 0, end: 1).animate(
//       CurvedAnimation(parent: _controller, curve: Curves.easeInOut),
//     );

//     _controller.forward();

//     _timer = Timer.periodic(Duration(milliseconds: 150), (timer) {
//       if (_index < "Enhancing Your Daily Productivity".length) {
//         setState(() {
//           _index++;
//           _slogan = "Enhancing Your Daily Productivity".substring(0, _index);
//         });
//       } else {
//         timer.cancel();
//         _navigateToSignInScreen();
//       }
//     });
//   }

//   @override
//   void dispose() {
//     _controller.dispose();
//     _timer.cancel();
//     super.dispose();
//   }

//   void _navigateToSignInScreen() {
//     Navigator.pushReplacement(
//       context,
//       MaterialPageRoute(builder: (context) => const SignInScreen()),
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.transparent,
//       body: Stack(
//         children: [
//           AnimatedBackground(),
//           Center(
//             child: AnimatedBuilder(
//               animation: _controller,
//               builder: (context, child) {
//                 return Opacity(
//                   opacity: _opacityAnimation.value,
//                   child: Transform.scale(
//                     scale: _scaleAnimation.value,
//                     child: Hero(
//                       tag: 'logoHero',
//                       child: Container(
//                         width: 200,
//                         height: 200,
//                         decoration: BoxDecoration(
//                           shape: BoxShape.circle,
//                           boxShadow: [
//                             BoxShadow(
//                               color: Colors.black.withOpacity(0.3),
//                               spreadRadius: 2,
//                               blurRadius: 4,
//                               offset: Offset(0, 3),
//                             ),
//                           ],
//                         ),
//                         child: ClipOval(
//                           child: Image.asset(
//                             "assets/exp.png", // Replace with your logo image path
//                             fit: BoxFit.cover,
//                           ),
//                         ),
//                       ),
//                     ),
//                   ),
//                 );
//               },
//             ),
//           ),
//           Align(
//             alignment: Alignment.bottomCenter,
//             child: Padding(
//               padding: const EdgeInsets.only(bottom: 260.0),
//               child: FadeTransition(
//                 opacity: _opacityAnimation,
//                 child: Column(
//                   mainAxisSize: MainAxisSize.min,
//                   children: [
//                     Text(
//                       _slogan,
//                       style: TextStyle(
//                         color: Colors.white,
//                         fontSize: 20,
//                         fontWeight: FontWeight.bold,
//                         fontStyle: FontStyle.italic,
//                         fontFamily: 'Playwrite AU QLD',
//                       ),
//                       textAlign: TextAlign.center,
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

// class AnimatedBackground extends StatelessWidget {
//   const AnimatedBackground({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       decoration: BoxDecoration(
//         gradient: LinearGradient(
//           colors: [
//             Color(0xFF6A1B9A), // Dark Purple
//             Color(0xFFD81B60), // Pink
//           ],
//           begin: Alignment.topLeft,
//           end: Alignment.bottomRight,
//           stops: [0.0, 1.0],
//         ),
//       ),
//       child: Opacity(
//         opacity: 0.5, // Adjust opacity of pattern flow
//         child: CustomPaint(
//           size: Size(MediaQuery.of(context).size.width,
//               MediaQuery.of(context).size.height),
//           painter: MyPainter(),
//         ),
//       ),
//     );
//   }
// }

// class MyPainter extends CustomPainter {
//   @override
//   void paint(Canvas canvas, Size size) {
//     Paint paint = Paint()
//       ..color = Colors.white.withOpacity(0.3) // Adjust color and opacity
//       ..style = PaintingStyle.fill;

//     // Draw your custom pattern or flow here
//     Path path = Path();
//     path.moveTo(0, size.height / 2);
//     path.quadraticBezierTo(
//         size.width * 0.25, size.height * 0.4, size.width * 0.5, size.height * 0.6);
//     path.quadraticBezierTo(
//         size.width * 0.75, size.height * 0.8, size.width, size.height * 0.7);
//     path.lineTo(size.width, size.height);
//     path.lineTo(0, size.height);
//     path.close();

//     canvas.drawPath(path, paint);
//   }

//   @override
//   bool shouldRepaint(covariant CustomPainter oldDelegate) {
//     return true;
//   }
// }




// import 'dart:async';
// import 'package:flutter/material.dart';
// import 'package:mad_my_app/screens/signin_screen.dart';

// class SplashScreen extends StatefulWidget {
//   const SplashScreen({Key? key}) : super(key: key);

//   @override
//   _SplashScreenState createState() => _SplashScreenState();
// }

// class _SplashScreenState extends State<SplashScreen>
//     with SingleTickerProviderStateMixin {
//   late AnimationController _controller;
//   late Animation<double> _scaleAnimation;
//   late Animation<double> _opacityAnimation;
//   late Timer _timer;
//   String _slogan = '';
//   int _index = 0;

//   @override
//   void initState() {
//     super.initState();

//     _controller = AnimationController(
//       vsync: this,
//       duration: Duration(milliseconds: 2000), // Adjust duration as needed
//     );

//     _scaleAnimation = Tween<double>(begin: 0, end: 1).animate(
//       CurvedAnimation(parent: _controller, curve: Curves.easeInOutBack),
//     );

//     _opacityAnimation = Tween<double>(begin: 0, end: 1).animate(
//       CurvedAnimation(parent: _controller, curve: Curves.easeInOut),
//     );

//     _controller.forward();

//     _timer = Timer.periodic(Duration(milliseconds: 150), (timer) {
//       if (_index < "Enhancing Your Daily Productivity".length) {
//         setState(() {
//           _index++;
//           _slogan = "Enhancing Your Daily Productivity".substring(0, _index);
//         });
//       } else {
//         timer.cancel();
//         _navigateToSignInScreen();
//       }
//     });
//   }

//   @override
//   void dispose() {
//     _controller.dispose();
//     _timer.cancel();
//     super.dispose();
//   }

//   void _navigateToSignInScreen() {
//     Future.delayed(Duration(seconds: 2), () {
//       Navigator.pushReplacement(
//         context,
//         MaterialPageRoute(builder: (context) => const SignInScreen()),
//       );
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.transparent,
//       body: Stack(
//         children: [
//           AnimatedBackground(),
//           Center(
//             child: AnimatedBuilder(
//               animation: _controller,
//               builder: (context, child) {
//                 return Opacity(
//                   opacity: _opacityAnimation.value,
//                   child: Transform.scale(
//                     scale: _scaleAnimation.value,
//                     child: Hero(
//                       tag: 'logoHero',
//                       child: Container(
//                         width: 200,
//                         height: 200,
//                         decoration: BoxDecoration(
//                           shape: BoxShape.circle,
//                           boxShadow: [
//                             BoxShadow(
//                               color: Colors.black.withOpacity(0.3),
//                               spreadRadius: 2,
//                               blurRadius: 4,
//                               offset: Offset(0, 3),
//                             ),
//                           ],
//                         ),
//                         child: ClipOval(
//                           child: Image.asset(
//                             "assets/exp.png", // Replace with your logo image path
//                             fit: BoxFit.cover,
//                           ),
//                         ),
//                       ),
//                     ),
//                   ),
//                 );
//               },
//             ),
//           ),
//           Align(
//             alignment: Alignment.bottomCenter,
//             child: Padding(
//               padding: const EdgeInsets.only(bottom: 260.0),
//               child: FadeTransition(
//                 opacity: _opacityAnimation,
//                 child: Column(
//                   mainAxisSize: MainAxisSize.min,
//                   children: [
//                     Text(
//                       _slogan,
//                       style: TextStyle(
//                         color: Colors.white,
//                         fontSize: 20,
//                         fontWeight: FontWeight.bold,
//                         fontStyle: FontStyle.italic,
//                         fontFamily: 'Playwrite AU QLD',
//                       ),
//                       textAlign: TextAlign.center,
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

// class AnimatedBackground extends StatelessWidget {
//   const AnimatedBackground({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       decoration: BoxDecoration(
//         gradient: LinearGradient(
//           colors: [
//             Color(0xFF6A1B9A), // Dark Purple
//             Color(0xFFD81B60), // Pink
//           ],
//           begin: Alignment.topLeft,
//           end: Alignment.bottomRight,
//           stops: [0.0, 1.0],
//         ),
//       ),
//       child: Opacity(
//         opacity: 0.5, // Adjust opacity of pattern flow
//         child: CustomPaint(
//           size: Size(MediaQuery.of(context).size.width,
//               MediaQuery.of(context).size.height),
//           painter: MyPainter(),
//         ),
//       ),
//     );
//   }
// }

// class MyPainter extends CustomPainter {
//   @override
//   void paint(Canvas canvas, Size size) {
//     Paint paint = Paint()
//       ..color = Colors.white.withOpacity(0.3) // Adjust color and opacity
//       ..style = PaintingStyle.fill;

//     // Draw your custom pattern or flow here
//     Path path = Path();
//     path.moveTo(0, size.height / 2);
//     path.quadraticBezierTo(
//         size.width * 0.25, size.height * 0.4, size.width * 0.5, size.height * 0.6);
//     path.quadraticBezierTo(
//         size.width * 0.75, size.height * 0.8, size.width, size.height * 0.7);
//     path.lineTo(size.width, size.height);
//     path.lineTo(0, size.height);
//     path.close();

//     canvas.drawPath(path, paint);
//   }

//   @override
//   bool shouldRepaint(covariant CustomPainter oldDelegate) {
//     return true;
//   }
// }


// import 'dart:async';
// import 'package:flutter/material.dart';
// import 'package:mad_my_app/screens/signin_screen.dart';

// class SplashScreen extends StatefulWidget {
//   const SplashScreen({Key? key}) : super(key: key);

//   @override
//   _SplashScreenState createState() => _SplashScreenState();
// }

// class _SplashScreenState extends State<SplashScreen>
//     with SingleTickerProviderStateMixin {
//   late AnimationController _controller;
//   late Animation<double> _scaleAnimation;
//   late Animation<double> _opacityAnimation;
//   late Timer _timer;
//   String _slogan = '';
//   int _index = 0;

//   @override
//   void initState() {
//     super.initState();

//     _controller = AnimationController(
//       vsync: this,
//       duration: Duration(milliseconds: 2000), // Adjust duration as needed
//     );

//     _scaleAnimation = Tween<double>(begin: 0, end: 1).animate(
//       CurvedAnimation(parent: _controller, curve: Curves.easeInOutBack),
//     );

//     _opacityAnimation = Tween<double>(begin: 0, end: 1).animate(
//       CurvedAnimation(parent: _controller, curve: Curves.easeInOut),
//     );

//     _controller.forward();

//     _timer = Timer.periodic(Duration(milliseconds: 150), (timer) {
//       if (_index < "Enhancing Your Daily Productivity".length) {
//         setState(() {
//           _index++;
//           _slogan = "Enhancing Your Daily Productivity".substring(0, _index);
//         });
//       } else {
//         timer.cancel();
//         _startDelayBeforeNavigate();
//       }
//     });
//   }

//   @override
//   void dispose() {
//     _controller.dispose();
//     _timer.cancel();
//     super.dispose();
//   }

//   void _startDelayBeforeNavigate() {
//     Future.delayed(Duration(seconds: 2), () {
//       _navigateToSignInScreen();
//     });
//   }

//   void _navigateToSignInScreen() {
//     Navigator.pushReplacement(
//       context,
//       MaterialPageRoute(builder: (context) => const SignInScreen()),
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.transparent,
//       body: Stack(
//         children: [
//           AnimatedBackground(),
//           Center(
//             child: AnimatedBuilder(
//               animation: _controller,
//               builder: (context, child) {
//                 return Opacity(
//                   opacity: _opacityAnimation.value,
//                   child: Transform.scale(
//                     scale: _scaleAnimation.value,
//                     child: Hero(
//                       tag: 'logoHero',
//                       child: Container(
//                         width: 200,
//                         height: 200,
//                         decoration: BoxDecoration(
//                           shape: BoxShape.circle,
//                           boxShadow: [
//                             BoxShadow(
//                               color: Colors.black.withOpacity(0.3),
//                               spreadRadius: 2,
//                               blurRadius: 4,
//                               offset: Offset(0, 3),
//                             ),
//                           ],
//                         ),
//                         child: ClipOval(
//                           child: Image.asset(
//                             "assets/exp.png", // Replace with your logo image path
//                             fit: BoxFit.cover,
//                           ),
//                         ),
//                       ),
//                     ),
//                   ),
//                 );
//               },
//             ),
//           ),
//           Align(
//             alignment: Alignment.bottomCenter,
//             child: Padding(
//               padding: const EdgeInsets.only(bottom: 260.0),
//               child: FadeTransition(
//                 opacity: _opacityAnimation,
//                 child: Column(
//                   mainAxisSize: MainAxisSize.min,
//                   children: [
//                     Text(
//                       _slogan,
//                       style: TextStyle(
//                         color: Colors.white,
//                         fontSize: 20,
//                         fontWeight: FontWeight.bold,
//                         fontStyle: FontStyle.italic,
//                         fontFamily: 'Playwrite AU QLD',
//                       ),
//                       textAlign: TextAlign.center,
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

// class AnimatedBackground extends StatelessWidget {
//   const AnimatedBackground({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       decoration: BoxDecoration(
//         gradient: LinearGradient(
//           colors: [
//             Color(0xFF6A1B9A), // Dark Purple
//             Color(0xFFD81B60), // Pink
//           ],
//           begin: Alignment.topLeft,
//           end: Alignment.bottomRight,
//           stops: [0.0, 1.0],
//         ),
//       ),
//       child: Opacity(
//         opacity: 0.5, // Adjust opacity of pattern flow
//         child: CustomPaint(
//           size: Size(MediaQuery.of(context).size.width,
//               MediaQuery.of(context).size.height),
//           painter: MyPainter(),
//         ),
//       ),
//     );
//   }
// }

// class MyPainter extends CustomPainter {
//   @override
//   void paint(Canvas canvas, Size size) {
//     Paint paint = Paint()
//       ..color = Colors.white.withOpacity(0.3) // Adjust color and opacity
//       ..style = PaintingStyle.fill;

//     // Draw your custom pattern or flow here
//     Path path = Path();
//     path.moveTo(0, size.height / 2);
//     path.quadraticBezierTo(
//         size.width * 0.25, size.height * 0.4, size.width * 0.5, size.height * 0.6);
//     path.quadraticBezierTo(
//         size.width * 0.75, size.height * 0.8, size.width, size.height * 0.7);
//     path.lineTo(size.width, size.height);
//     path.lineTo(0, size.height);
//     path.close();

//     canvas.drawPath(path, paint);
//   }

//   @override
//   bool shouldRepaint(covariant CustomPainter oldDelegate) {
//     return true;
//   }
// }



import 'dart:async';
import 'package:flutter/material.dart';
import 'package:mad_my_app/screens/signin_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _scaleAnimation;
  late Animation<double> _opacityAnimation;
  late Timer _timer;
  String _slogan = '';
  int _index = 0;
  bool _logoAnimationComplete = false;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 2000), // Adjust duration as needed
    );

    _scaleAnimation = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeInOutBack),
    );

    _opacityAnimation = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeInOut),
    );

    _controller.forward().whenComplete(() {
      setState(() {
        _logoAnimationComplete = true;
      });
      _startSloganAnimation();
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _startSloganAnimation() {
    _timer = Timer.periodic(Duration(milliseconds: 150), (timer) {
      if (_index < "Enhancing Your Daily Productivity".length) {
        setState(() {
          _index++;
          _slogan = "Enhancing Your Daily Productivity".substring(0, _index);
        });
      } else {
        timer.cancel();
        _startDelayBeforeNavigate();
      }
    });
  }

  void _startDelayBeforeNavigate() {
    Future.delayed(Duration(seconds: 2), () {
      _navigateToSignInScreen();
    });
  }

  void _navigateToSignInScreen() {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => const SignInScreen()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Stack(
        children: [
          AnimatedBackground(),
          Center(
            child: AnimatedBuilder(
              animation: _controller,
              builder: (context, child) {
                return Opacity(
                  opacity: _opacityAnimation.value,
                  child: Transform.scale(
                    scale: _scaleAnimation.value,
                    child: Hero(
                      tag: 'logoHero',
                      child: Container(
                        width: 200,
                        height: 200,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.3),
                              spreadRadius: 2,
                              blurRadius: 4,
                              offset: Offset(0, 3),
                            ),
                          ],
                        ),
                        child: ClipOval(
                          child: Image.asset(
                            "assets/exp.png", // Replace with your logo image path
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
          
          Align(
            alignment: Alignment.bottomCenter,
            child: AnimatedOpacity(
              opacity: _logoAnimationComplete ? 1.0 : 0.0,
              duration: Duration(milliseconds: 500),
              curve: Curves.easeInOut,
              child: Padding(
                padding: const EdgeInsets.only(bottom: 300.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SizedBox(height: 20),
                    Text(
                      _slogan,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        fontStyle: FontStyle.italic,
                        fontFamily: 'Playwrite AU QLD',
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class AnimatedBackground extends StatelessWidget {
  const AnimatedBackground({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Color(0xFF6A1B9A), // Dark Purple
            Color(0xFFD81B60), // Pink
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          stops: [0.0, 1.0],
        ),
      ),
      child: Opacity(
        opacity: 0.5, // Adjust opacity of pattern flow
        child: CustomPaint(
          size: Size(MediaQuery.of(context).size.width,
              MediaQuery.of(context).size.height),
          painter: MyPainter(),
        ),
      ),
    );
  }
}

class MyPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = Colors.white.withOpacity(0.3) // Adjust color and opacity
      ..style = PaintingStyle.fill;

    // Draw your custom pattern or flow here
    Path path = Path();
    path.moveTo(0, size.height / 2);
    path.quadraticBezierTo(
        size.width * 0.25, size.height * 0.4, size.width * 0.5, size.height * 0.6);
    path.quadraticBezierTo(
        size.width * 0.75, size.height * 0.8, size.width, size.height * 0.7);
    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);
    path.close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
