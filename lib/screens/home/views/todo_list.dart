// import 'package:flutter/material.dart';
// import 'package:flutter/widgets.dart';
// import 'package:to_do_app/TO%20DO/Model/todo_model.dart';
// import 'package:to_do_app/TO%20DO/Service/todo_database_service.dart';
// import 'package:to_do_app/TO%20DO/loader.dart';
// import 'package:to_do_app/TO%20DO/mytodo_dialog.dart';

// class TodoList extends StatefulWidget {
//   const TodoList({super.key});

//   @override 
//   State<TodoList> createState() => _TodoListState();
// }

// class _TodoListState extends State<TodoList> {
//   TextEditingController todoTitleController = TextEditingController();
//   @override 
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.blue[200],
//       body: SingleChildScrollView(
//         child: SafeArea(
//           child: StreamBuilder<List<TodoModel>>(
//             stream: ToDoDatabaseService().ListTodo(),
//             builder: (context, snapshot) {
//               if(!snapshot.hasData){
//                 return const Loader();
//               }
//               List<TodoModel>? todo = snapshot.data;
            
//             return Padding(
//               padding: const EdgeInsets.all(25.0),
//               child: Column(
//                 mainAxisAlignment: MainAxisAlignment.start,
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   const Text(
//                     "My To Do",
//                     style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
//                   ),
//                   const SizedBox(
//                     height: 10,
//                   ),
//                   const Divider(
//                     color: Colors.white,
//                   ),
//                   const SizedBox(
//                     height: 20,
//                   ),
//                   ListView.builder(
//                     shrinkWrap: true,
//                     itemCount: todo!.length,
//                     itemBuilder: (context,index){
//                       return Dismissible(
//                         key: Key(todo[index].uid),
//                         background: Container(
//                           alignment: Alignment.centerLeft,
//                           color: Colors.red,
//                           child: const Icon(Icons.delete),
//                         ),
//                         onDismissed: (direction) async {
//                           await ToDoDatabaseService().deleteTodo(todo[index].uid);
//                         },
//                         child: Padding(
//                           padding: const EdgeInsets.only(bottom: 20.0),
//                           child: Card(
//                             shape: RoundedRectangleBorder(
//                               borderRadius: BorderRadius.circular(6)
//                               ),
//                             child: ListTile(
//                               onTap: () {
//                                 bool newCompleteTask = !todo[index].isCompleted;
//                                 ToDoDatabaseService().updateTask(todo[index].uid, newCompleteTask);
//                               },
//                               leading: Container(
//                                 height: 25,
//                                 width: 25,
//                                 decoration: const BoxDecoration(
//                                   color: Colors.purple,
//                                   shape: BoxShape.rectangle,
//                                 ),
//                                 child: todo[index].isCompleted
//                                 ? const Icon(
//                                   Icons.check,
//                                   color:Colors.white ,
//                                   )
//                                 : Container(),
//                               ),
//                               title: Text(
//                                 todo[index].title,
//                                 style: const TextStyle(
//                                   fontSize: 30,
//                               ),
//                              ),
//                             ),
//                           ),
//                         ),
//                       );
//                     })
//                 ],
//               ),
//             );
//           })
//           )
//       ),
//         floatingActionButton: FloatingActionButton(
//           onPressed: (){
//             showDialog(context: context, builder: ((context) => ToDoDialog(todoTitleController: todoTitleController))
//             );
//           },
//           child: const Icon(Icons.add),
//         ),
//     );
//   }
// }





// // todo_list.dart
// import 'package:flutter/material.dart';
// import 'package:flutter_local_notifications/flutter_local_notifications.dart';
// import 'package:awesome_notifications/awesome_notifications.dart'; // Import Awesome Notifications
// import 'package:to_do_app/TO%20DO/Model/todo_model.dart';
// import 'package:to_do_app/TO%20DO/Service/todo_database_service.dart';
// import 'package:to_do_app/TO%20DO/loader.dart';
// import 'package:to_do_app/TO%20DO/mytodo_dialog.dart';

// class TodoList extends StatefulWidget {
//   const TodoList({Key? key}) : super(key: key);

//   @override
//   State<TodoList> createState() => _TodoListState();
// }

// class _TodoListState extends State<TodoList> {
//   TextEditingController todoTitleController = TextEditingController();
//   final AwesomeNotifications awesomeNotifications = AwesomeNotifications();

//   @override
//   void initState() {
//     super.initState();
//     // Initialize Awesome Notifications
//     awesomeNotifications.initialize(
//       'resource://drawable/ic_notification', // Icon for notifications
//       [
//         NotificationChannel(
//           channelKey: 'basic_channel',
//           channelName: 'Basic notifications',
//           channelDescription: 'Notification channel for basic notifications',
//           defaultColor: Color(0xFF9D50DD),
//           ledColor: Colors.white,
//         ),
//       ],
//     );
//   }

//   // Function to schedule notifications
//   void scheduleNotification(TodoModel todo) async {
//   if (todo.deadline != null) {
//     // Calculate the notification schedule time
//     DateTime scheduledDateTime = DateTime(
//       todo.deadline!.year,
//       todo.deadline!.month,
//       todo.deadline!.day,
//       14, // 2 PM
//       25, // 10 minutes
//     );

//     // Create notification content
//     String notificationTitle = 'Task Reminder';
//     String notificationBody = todo.title;

//     // Schedule notification with Awesome Notifications
//     awesomeNotifications.createNotification(
//       content: NotificationContent(
//         id: todo.uid.hashCode,
//         channelKey: 'basic_channel',
//         title: notificationTitle,
//         body: notificationBody,
//         notificationLayout: NotificationLayout.BigText,
//         payload: {'todoId': todo.uid},
//       ),
//       schedule: NotificationCalendar(
//         weekday: scheduledDateTime.weekday,
//         hour: scheduledDateTime.hour,
//         minute: scheduledDateTime.minute,
//         second: 0,
//         millisecond: 0,
//         repeats: false, // Set to true for recurring notifications
//       ),
//     );

//     print('Notification scheduled for: $scheduledDateTime');
//   }
// }


//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.blue[200],
//       body: SingleChildScrollView(
//         child: SafeArea(
//           child: StreamBuilder<List<TodoModel>>(
//             stream: ToDoDatabaseService().ListTodo(), // Adjusted method name
//             builder: (context, snapshot) {
//               if (!snapshot.hasData) {
//                 return const Loader();
//               }
//               List<TodoModel>? todoList = snapshot.data;
//               return Padding(
//                 padding: const EdgeInsets.all(25.0),
//                 child: Column(
//                   mainAxisAlignment: MainAxisAlignment.start,
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     const Text(
//                       "My To Do",
//                       style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
//                     ),
//                     const SizedBox(height: 10),
//                     const Divider(color: Colors.white),
//                     const SizedBox(height: 20),
//                     ListView.builder(
//                       shrinkWrap: true,
//                       itemCount: todoList!.length,
//                       itemBuilder: (context, index) {
//                         TodoModel todo = todoList[index];
//                         return Dismissible(
//                           key: Key(todo.uid), // Use uid as the key
//                           background: Container(
//                             alignment: Alignment.centerLeft,
//                             color: Colors.red,
//                             child: const Icon(Icons.delete),
//                           ),
//                           onDismissed: (direction) async {
//                             await ToDoDatabaseService().deleteTodo(todo.uid);
//                           },
//                           child: Padding(
//                             padding: const EdgeInsets.only(bottom: 20.0),
//                             child: Card(
//                               shape: RoundedRectangleBorder(
//                                 borderRadius: BorderRadius.circular(6),
//                               ),
//                               child: ListTile(
//                                 onTap: () {
//                                   bool newCompleteTask = !todo.isCompleted;
//                                   ToDoDatabaseService().updateTask(todo.uid, newCompleteTask);
//                                 },
//                                 leading: Container(
//                                   height: 25,
//                                   width: 25,
//                                   decoration: const BoxDecoration(
//                                     color: Colors.purple,
//                                     shape: BoxShape.rectangle,
//                                   ),
//                                   child: todo.isCompleted
//                                       ? const Icon(
//                                           Icons.check,
//                                           color: Colors.white,
//                                         )
//                                       : Container(),
//                                 ),
//                                 title: Text(
//                                   todo.title,
//                                   style: const TextStyle(fontSize: 30),
//                                 ),
//                                 subtitle: Column(
//                                   crossAxisAlignment: CrossAxisAlignment.start,
//                                   children: [
//                                     if (todo.deadline != null)
//                                       Text(
//                                         "Deadline: ${todo.deadline!.toString().split(' ')[0]}",
//                                         style: TextStyle(fontSize: 14, color: Colors.grey),
//                                       ),
//                                     if (todo.priority != null)
//                                       Text(
//                                         "Priority: ${todo.priority}",
//                                         style: TextStyle(fontSize: 14, color: Colors.grey),
//                                       ),
//                                   ],
//                                 ),
//                               ),
//                             ),
//                           ),
//                         );
//                       },
//                     )
//                   ],
//                 ),
//               );
//             },
//           ),
//         ),
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: () {
//           showDialog(
//             context: context,
//             builder: ((context) => ToDoDialog(
//                   todoTitleController: todoTitleController,
//                   scheduleNotification: scheduleNotification,
//                 )),
//           );
//         },
//         child: const Icon(Icons.add),
//       ),
//     );
//   }
// }


// import 'package:flutter/material.dart';
// import 'package:awesome_notifications/awesome_notifications.dart';
// import 'package:to_do_app/TO%20DO/Model/todo_model.dart';
// import 'package:to_do_app/TO%20DO/Service/todo_database_service.dart';
// import 'package:to_do_app/TO%20DO/loader.dart';
// import 'package:to_do_app/TO%20DO/mytodo_dialog.dart';

// class TodoList extends StatefulWidget {
//   const TodoList({Key? key}) : super(key: key);

//   @override
//   State<TodoList> createState() => _TodoListState();
// }

// class _TodoListState extends State<TodoList> {
//   TextEditingController todoTitleController = TextEditingController();
//   final AwesomeNotifications awesomeNotifications = AwesomeNotifications();

//   @override
//   void initState() {
//     super.initState();
//     awesomeNotifications.initialize(
//       'resource://drawable/ic_notification',
//       [
//         NotificationChannel(
//           channelKey: 'basic_channel',
//           channelName: 'Basic notifications',
//           channelDescription: 'Notification channel for basic notifications',
//           defaultColor: Color(0xFF9D50DD),
//           ledColor: Colors.white,
//         ),
//       ],
//     );
//   }

//   void scheduleNotification(TodoModel todo) async {
//     if (todo.deadline != null) {
//       DateTime scheduledDateTime = DateTime(
//         todo.deadline!.year,
//         todo.deadline!.month,
//         todo.deadline!.day,
//         14,
//         25,
//       );

//       String notificationTitle = 'Task Reminder';
//       String notificationBody = todo.title;

//       awesomeNotifications.createNotification(
//         content: NotificationContent(
//           id: todo.uid.hashCode,
//           channelKey: 'basic_channel',
//           title: notificationTitle,
//           body: notificationBody,
//           notificationLayout: NotificationLayout.BigText,
//           payload: {'todoId': todo.uid},
//         ),
//         schedule: NotificationCalendar(
//           weekday: scheduledDateTime.weekday,
//           hour: scheduledDateTime.hour,
//           minute: scheduledDateTime.minute,
//           second: 0,
//           millisecond: 0,
//           repeats: false,
//         ),
//       );

//       print('Notification scheduled for: $scheduledDateTime');
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.purple[50],
//       body: SingleChildScrollView(
//         child: SafeArea(
//           child: StreamBuilder<List<TodoModel>>(
//             stream: ToDoDatabaseService().ListTodo(),
//             builder: (context, snapshot) {
//               if (!snapshot.hasData) {
//                 return const Loader();
//               }
//               List<TodoModel>? todoList = snapshot.data;
//               return Padding(
//                 padding: const EdgeInsets.all(20.0),
//                 child: Column(
//                   mainAxisAlignment: MainAxisAlignment.start,
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     const Text(
//                       "My To Do",
//                       style: TextStyle(
//                         fontSize: 32,
//                         fontWeight: FontWeight.bold,
//                         color: Colors.purple,
//                       ),
//                     ),
//                     const SizedBox(height: 10),
//                     const Divider(color: Colors.grey),
//                     const SizedBox(height: 20),
//                     ListView.builder(
//                       shrinkWrap: true,
//                       itemCount: todoList!.length,
//                       itemBuilder: (context, index) {
//                         TodoModel todo = todoList[index];
//                         return Dismissible(
//                           key: Key(todo.uid),
//                           background: Container(
//                             alignment: Alignment.centerLeft,
//                             color: Colors.red,
//                             child: const Icon(Icons.delete, color: Colors.white),
//                           ),
//                           onDismissed: (direction) async {
//                             await ToDoDatabaseService().deleteTodo(todo.uid);
//                           },
//                           child: Padding(
//                             padding: const EdgeInsets.only(bottom: 20.0),
//                             child: Card(
//                               shape: RoundedRectangleBorder(
//                                 borderRadius: BorderRadius.circular(12),
//                               ),
//                               elevation: 5,
//                               color: Colors.white,
//                               child: ListTile(
//                                 onTap: () {
//                                   bool newCompleteTask = !todo.isCompleted;
//                                   ToDoDatabaseService().updateTask(todo.uid, newCompleteTask);
//                                 },
//                                 leading: Container(
//                                   height: 30,
//                                   width: 30,
//                                   decoration: BoxDecoration(
//                                     color: Colors.purple,
//                                     shape: BoxShape.circle,
//                                   ),
//                                   child: todo.isCompleted
//                                       ? const Icon(Icons.check, color: Colors.white)
//                                       : Container(),
//                                 ),
//                                 title: Text(
//                                   todo.title,
//                                   style: const TextStyle(
//                                     fontSize: 24,
//                                     fontWeight: FontWeight.w500,
//                                   ),
//                                 ),
//                                 subtitle: Column(
//                                   crossAxisAlignment: CrossAxisAlignment.start,
//                                   children: [
//                                     if (todo.deadline != null)
//                                       Text(
//                                         "Deadline: ${todo.deadline!.toString().split(' ')[0]}",
//                                         style: const TextStyle(fontSize: 14, color: Colors.grey),
//                                       ),
//                                     if (todo.priority != null)
//                                       Text(
//                                         "Priority: ${todo.priority}",
//                                         style: const TextStyle(fontSize: 14, color: Colors.grey),
//                                       ),
//                                   ],
//                                 ),
//                               ),
//                             ),
//                           ),
//                         );
//                       },
//                     )
//                   ],
//                 ),
//               );
//             },
//           ),
//         ),
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: () {
//           showDialog(
//             context: context,
//             builder: (context) => ToDoDialog(
//               todoTitleController: todoTitleController,
//               scheduleNotification: scheduleNotification,
//             ),
//           );
//         },
//         child: const Icon(Icons.add),
//         backgroundColor: Colors.purple,
//         elevation: 6,
//       ),
//     );
//   }
// }








// import 'package:flutter/material.dart';
// import 'package:awesome_notifications/awesome_notifications.dart';
// import 'package:to_do_app/TO%20DO/Model/todo_model.dart';
// import 'package:to_do_app/TO%20DO/Service/todo_database_service.dart';
// import 'package:to_do_app/TO%20DO/loader.dart';
// import 'package:to_do_app/TO%20DO/mytodo_dialog.dart';

// class TodoList extends StatefulWidget {
//   const TodoList({Key? key}) : super(key: key);

//   @override
//   State<TodoList> createState() => _TodoListState();
// }

// class _TodoListState extends State<TodoList> {
//   TextEditingController todoTitleController = TextEditingController();
//   final AwesomeNotifications awesomeNotifications = AwesomeNotifications();

//   @override
//   void initState() {
//     super.initState();
//     awesomeNotifications.initialize(
//       'resource://drawable/ic_notification',
//       [
//         NotificationChannel(
//           channelKey: 'basic_channel',
//           channelName: 'Basic notifications',
//           channelDescription: 'Notification channel for basic notifications',
//           defaultColor: Color(0xFF9D50DD),
//           ledColor: Colors.white,
//         ),
//       ],
//     );
//   }

//   void scheduleNotification(TodoModel todo) async {
//     if (todo.deadline != null) {
//       DateTime scheduledDateTime = DateTime(
//         todo.deadline!.year,
//         todo.deadline!.month,
//         todo.deadline!.day,
//         14,
//         25,
//       );

//       String notificationTitle = 'Task Reminder';
//       String notificationBody = todo.title;

//       awesomeNotifications.createNotification(
//         content: NotificationContent(
//           id: todo.uid.hashCode,
//           channelKey: 'basic_channel',
//           title: notificationTitle,
//           body: notificationBody,
//           notificationLayout: NotificationLayout.BigText,
//           payload: {'todoId': todo.uid},
//         ),
//         schedule: NotificationCalendar(
//           weekday: scheduledDateTime.weekday,
//           hour: scheduledDateTime.hour,
//           minute: scheduledDateTime.minute,
//           second: 0,
//           millisecond: 0,
//           repeats: false,
//         ),
//       );

//       print('Notification scheduled for: $scheduledDateTime');
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('My To Do'),
//         centerTitle: true,
//         flexibleSpace: Container(
//           decoration: BoxDecoration(
//             gradient: LinearGradient(
//               colors: [Color(0xFF9D50DD), Color(0xFFE91E63)],
//               begin: Alignment.topLeft,
//               end: Alignment.bottomRight,
//             ),
//           ),
//         ),
//       ),
//       backgroundColor: Colors.purple[50],
//       body: SingleChildScrollView(
//         child: SafeArea(
//           child: StreamBuilder<List<TodoModel>>(
//             stream: ToDoDatabaseService().ListTodo(),
//             builder: (context, snapshot) {
//               if (!snapshot.hasData) {
//                 return const Loader();
//               }
//               List<TodoModel>? todoList = snapshot.data;
//               return Padding(
//                 padding: const EdgeInsets.all(20.0),
//                 child: Column(
//                   mainAxisAlignment: MainAxisAlignment.start,
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     const Text(
//                       "My To Do",
//                       style: TextStyle(
//                         fontSize: 32,
//                         fontWeight: FontWeight.bold,
//                         color: Colors.purple,
//                       ),
//                     ),
//                     const SizedBox(height: 10),
//                     const Divider(color: Colors.grey),
//                     const SizedBox(height: 20),
//                     ListView.builder(
//                       shrinkWrap: true,
//                       itemCount: todoList!.length,
//                       itemBuilder: (context, index) {
//                         TodoModel todo = todoList[index];
//                         return Dismissible(
//                           key: Key(todo.uid),
//                           background: Container(
//                             alignment: Alignment.centerLeft,
//                             color: Colors.red,
//                             child: const Icon(Icons.delete, color: Colors.white),
//                           ),
//                           onDismissed: (direction) async {
//                             await ToDoDatabaseService().deleteTodo(todo.uid);
//                           },
//                           child: Padding(
//                             padding: const EdgeInsets.only(bottom: 20.0),
//                             child: Card(
//                               shape: RoundedRectangleBorder(
//                                 borderRadius: BorderRadius.circular(12),
//                               ),
//                               elevation: 5,
//                               shadowColor: Colors.purple,
//                               color: Colors.white,
//                               child: ListTile(
//                                 onTap: () {
//                                   bool newCompleteTask = !todo.isCompleted;
//                                   ToDoDatabaseService().updateTask(todo.uid, newCompleteTask);
//                                 },
//                                 leading: Container(
//                                   height: 30,
//                                   width: 30,
//                                   decoration: BoxDecoration(
//                                     color: Colors.purple,
//                                     shape: BoxShape.circle,
//                                   ),
//                                   child: todo.isCompleted
//                                       ? const Icon(Icons.check, color: Colors.white)
//                                       : Container(),
//                                 ),
//                                 title: Text(
//                                   todo.title,
//                                   style: const TextStyle(
//                                     fontSize: 24,
//                                     fontWeight: FontWeight.w500,
//                                     color: Colors.black87,
//                                   ),
//                                 ),
//                                 subtitle: Column(
//                                   crossAxisAlignment: CrossAxisAlignment.start,
//                                   children: [
//                                     if (todo.deadline != null)
//                                       Text(
//                                         "Deadline: ${todo.deadline!.toString().split(' ')[0]}",
//                                         style: const TextStyle(fontSize: 14, color: Colors.grey),
//                                       ),
//                                     if (todo.priority != null)
//                                       Text(
//                                         "Priority: ${todo.priority}",
//                                         style: const TextStyle(fontSize: 14, color: Colors.grey),
//                                       ),
//                                   ],
//                                 ),
//                               ),
//                             ),
//                           ),
//                         );
//                       },
//                     )
//                   ],
//                 ),
//               );
//             },
//           ),
//         ),
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: () {
//           showDialog(
//             context: context,
//             builder: (context) => ToDoDialog(
//               todoTitleController: todoTitleController,
//               scheduleNotification: scheduleNotification,
//             ),
//           );
//         },
//         child: const Icon(Icons.add),
//         backgroundColor: Colors.purple,
//         elevation: 6,
//         shape: RoundedRectangleBorder(
//           borderRadius: BorderRadius.circular(18.0),
//         ),
//       ),
//     );
//   }
// }




// //good UI one with scroll
// import 'package:flutter/material.dart';
// import 'package:awesome_notifications/awesome_notifications.dart';
// import 'package:to_do_app/TO%20DO/Model/todo_model.dart';
// import 'package:to_do_app/TO%20DO/Service/todo_database_service.dart';
// import 'package:to_do_app/TO%20DO/loader.dart';
// import 'package:to_do_app/TO%20DO/mytodo_dialog.dart';

// class TodoList extends StatefulWidget {
//   const TodoList({Key? key}) : super(key: key);

//   @override
//   State<TodoList> createState() => _TodoListState();
// }

// class _TodoListState extends State<TodoList> {
//   TextEditingController todoTitleController = TextEditingController();
//   final AwesomeNotifications awesomeNotifications = AwesomeNotifications();

//   @override
//   void initState() {
//     super.initState();
//     awesomeNotifications.initialize(
//       'resource://drawable/ic_notification',
//       [
//         NotificationChannel(
//           channelKey: 'basic_channel',
//           channelName: 'Basic notifications',
//           channelDescription: 'Notification channel for basic notifications',
//           defaultColor: Color(0xFF9D50DD),
//           ledColor: Colors.white,
//         ),
//       ],
//     );
//   }

//   void scheduleNotification(TodoModel todo) async {
//     if (todo.deadline != null) {
//       DateTime scheduledDateTime = DateTime(
//         todo.deadline!.year,
//         todo.deadline!.month,
//         todo.deadline!.day,
//         14,
//         25,
//       );

//       String notificationTitle = 'Task Reminder';
//       String notificationBody = todo.title;

//       awesomeNotifications.createNotification(
//         content: NotificationContent(
//           id: todo.uid.hashCode,
//           channelKey: 'basic_channel',
//           title: notificationTitle,
//           body: notificationBody,
//           notificationLayout: NotificationLayout.BigText,
//           payload: {'todoId': todo.uid},
//         ),
//         schedule: NotificationCalendar(
//           weekday: scheduledDateTime.weekday,
//           hour: scheduledDateTime.hour,
//           minute: scheduledDateTime.minute,
//           second: 0,
//           millisecond: 0,
//           repeats: false,
//         ),
//       );

//       print('Notification scheduled for: $scheduledDateTime');
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('My To Do'),
//         centerTitle: true,
//         flexibleSpace: Container(
//           decoration: BoxDecoration(
//             gradient: LinearGradient(
//               colors: [Color(0xFF9D50DD), Color(0xFFE91E63)],
//               begin: Alignment.topLeft,
//               end: Alignment.bottomRight,
//             ),
//           ),
//         ),
//       ),
//       backgroundColor: Colors.purple[50],
//       body: SafeArea(
//         child: StreamBuilder<List<TodoModel>>(
//           stream: ToDoDatabaseService().ListTodo(),
//           builder: (context, snapshot) {
//             if (!snapshot.hasData) {
//               return const Loader();
//             }
//             List<TodoModel>? todoList = snapshot.data;
//             return Padding(
//               padding: const EdgeInsets.all(20.0),
//               child: Column(
//                 mainAxisAlignment: MainAxisAlignment.start,
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   const Text(
//                     "My To Do",
//                     style: TextStyle(
//                       fontSize: 32,
//                       fontWeight: FontWeight.bold,
//                       color: Colors.purple,
//                     ),
//                   ),
//                   const SizedBox(height: 10),
//                   const Divider(color: Colors.grey),
//                   const SizedBox(height: 20),
//                   Expanded(
//                     child: ListView.builder(
//                       itemCount: todoList!.length,
//                       itemBuilder: (context, index) {
//                         TodoModel todo = todoList[index];
//                         return Dismissible(
//                           key: Key(todo.uid),
//                           background: Container(
//                             alignment: Alignment.centerLeft,
//                             color: Colors.red,
//                             child: const Icon(Icons.delete, color: Colors.white),
//                           ),
//                           onDismissed: (direction) async {
//                             await ToDoDatabaseService().deleteTodo(todo.uid);
//                           },
//                           child: Padding(
//                             padding: const EdgeInsets.only(bottom: 20.0),
//                             child: Card(
//                               shape: RoundedRectangleBorder(
//                                 borderRadius: BorderRadius.circular(12),
//                               ),
//                               elevation: 5,
//                               shadowColor: Colors.purple,
//                               color: Colors.white,
//                               child: ListTile(
//                                 onTap: () {
//                                   bool newCompleteTask = !todo.isCompleted;
//                                   ToDoDatabaseService().updateTask(todo.uid, newCompleteTask);
//                                 },
//                                 leading: Container(
//                                   height: 30,
//                                   width: 30,
//                                   decoration: BoxDecoration(
//                                     color: Colors.purple,
//                                     shape: BoxShape.circle,
//                                   ),
//                                   child: todo.isCompleted
//                                       ? const Icon(Icons.check, color: Colors.white)
//                                       : Container(),
//                                 ),
//                                 title: Text(
//                                   todo.title,
//                                   style: const TextStyle(
//                                     fontSize: 24,
//                                     fontWeight: FontWeight.w500,
//                                     color: Colors.black87,
//                                   ),
//                                 ),
//                                 subtitle: Column(
//                                   crossAxisAlignment: CrossAxisAlignment.start,
//                                   children: [
//                                     if (todo.deadline != null)
//                                       Text(
//                                         "Deadline: ${todo.deadline!.toString().split(' ')[0]}",
//                                         style: const TextStyle(fontSize: 14, color: Colors.grey),
//                                       ),
//                                     if (todo.priority != null)
//                                       Text(
//                                         "Priority: ${todo.priority}",
//                                         style: const TextStyle(fontSize: 14, color: Colors.grey),
//                                       ),
//                                   ],
//                                 ),
//                               ),
//                             ),
//                           ),
//                         );
//                       },
//                     ),
//                   ),
//                 ],
//               ),
//             );
//           },
//         ),
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: () {
//           showDialog(
//             context: context,
//             builder: (context) => ToDoDialog(
//               todoTitleController: todoTitleController,
//               scheduleNotification: scheduleNotification,
//             ),
//           );
//         },
//         child: const Icon(Icons.add),
//         backgroundColor: Colors.purple,
//         elevation: 6,
//         shape: RoundedRectangleBorder(
//           borderRadius: BorderRadius.circular(18.0),
//         ),
//       ),
//     );
//   }
// }

// // with ugly filter
// import 'package:flutter/material.dart';
// import 'package:awesome_notifications/awesome_notifications.dart';
// import 'package:to_do_app/TO%20DO/Model/todo_model.dart';
// import 'package:to_do_app/TO%20DO/Service/todo_database_service.dart';
// import 'package:to_do_app/TO%20DO/loader.dart';
// import 'package:to_do_app/TO%20DO/mytodo_dialog.dart';

// class TodoList extends StatefulWidget {
//   const TodoList({Key? key}) : super(key: key);

//   @override
//   State<TodoList> createState() => _TodoListState();
// }

// class _TodoListState extends State<TodoList> {
//   TextEditingController todoTitleController = TextEditingController();
//   final AwesomeNotifications awesomeNotifications = AwesomeNotifications();

//   String _filterType = 'priority';
//   bool _isDescending = true;

//   @override
//   void initState() {
//     super.initState();
//     awesomeNotifications.initialize(
//       'resource://drawable/ic_notification',
//       [
//         NotificationChannel(
//           channelKey: 'basic_channel',
//           channelName: 'Basic notifications',
//           channelDescription: 'Notification channel for basic notifications',
//           defaultColor: Color(0xFF9D50DD),
//           ledColor: Colors.white,
//         ),
//       ],
//     );
//   }

//   void scheduleNotification(TodoModel todo) async {
//     if (todo.deadline != null) {
//       DateTime scheduledDateTime = DateTime(
//         todo.deadline!.year,
//         todo.deadline!.month,
//         todo.deadline!.day,
//         14,
//         25,
//       );

//       String notificationTitle = 'Task Reminder';
//       String notificationBody = todo.title;

//       awesomeNotifications.createNotification(
//         content: NotificationContent(
//           id: todo.uid.hashCode,
//           channelKey: 'basic_channel',
//           title: notificationTitle,
//           body: notificationBody,
//           notificationLayout: NotificationLayout.BigText,
//           payload: {'todoId': todo.uid},
//         ),
//         schedule: NotificationCalendar(
//           weekday: scheduledDateTime.weekday,
//           hour: scheduledDateTime.hour,
//           minute: scheduledDateTime.minute,
//           second: 0,
//           millisecond: 0,
//           repeats: false,
//         ),
//       );

//       print('Notification scheduled for: $scheduledDateTime');
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('My To Do'),
//         centerTitle: true,
//         flexibleSpace: Container(
//           decoration: BoxDecoration(
//             gradient: LinearGradient(
//               colors: [Color(0xFF9D50DD), Color(0xFFE91E63)],
//               begin: Alignment.topLeft,
//               end: Alignment.bottomRight,
//             ),
//           ),
//         ),
//         actions: [
//           DropdownButton<String>(
//             value: _filterType,
//             icon: const Icon(Icons.filter_list, color: Colors.white),
//             onChanged: (String? newValue) {
//               setState(() {
//                 _filterType = newValue!;
//               });
//             },
//             items: <String>['priority', 'deadline']
//                 .map<DropdownMenuItem<String>>((String value) {
//               return DropdownMenuItem<String>(
//                 value: value,
//                 child: Text(value, style: TextStyle(color: Colors.black)),
//               );
//             }).toList(),
//           ),
//           DropdownButton<bool>(
//             value: _isDescending,
//             icon: const Icon(Icons.sort, color: Colors.white),
//             onChanged: (bool? newValue) {
//               setState(() {
//                 _isDescending = newValue!;
//               });
//             },
//             items: <bool>[true, false]
//                 .map<DropdownMenuItem<bool>>((bool value) {
//               return DropdownMenuItem<bool>(
//                 value: value,
//                 child: Text(
//                   value ? 'Descending' : 'Ascending',
//                   style: TextStyle(color: Colors.black),
//                 ),
//               );
//             }).toList(),
//           ),
//         ],
//       ),
//       backgroundColor: Colors.purple[50],
//       body: SafeArea(
//         child: StreamBuilder<List<TodoModel>>(
//           stream: ToDoDatabaseService().listTodo(
//             orderBy: _filterType,
//             descending: _isDescending,
//           ),
//           builder: (context, snapshot) {
//             if (!snapshot.hasData) {
//               return const Loader();
//             }
//             List<TodoModel>? todoList = snapshot.data;
//             return Padding(
//               padding: const EdgeInsets.all(20.0),
//               child: Column(
//                 mainAxisAlignment: MainAxisAlignment.start,
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   const Text(
//                     "My To Do",
//                     style: TextStyle(
//                       fontSize: 32,
//                       fontWeight: FontWeight.bold,
//                       color: Colors.purple,
//                     ),
//                   ),
//                   const SizedBox(height: 10),
//                   const Divider(color: Colors.grey),
//                   const SizedBox(height: 20),
//                   Expanded(
//                     child: ListView.builder(
//                       itemCount: todoList!.length,
//                       itemBuilder: (context, index) {
//                         TodoModel todo = todoList[index];
//                         return Dismissible(
//                           key: Key(todo.uid),
//                           background: Container(
//                             alignment: Alignment.centerLeft,
//                             color: Colors.red,
//                             child: const Icon(Icons.delete, color: Colors.white),
//                           ),
//                           onDismissed: (direction) async {
//                             await ToDoDatabaseService().deleteTodo(todo.uid);
//                           },
//                           child: Padding(
//                             padding: const EdgeInsets.only(bottom: 20.0),
//                             child: Card(
//                               shape: RoundedRectangleBorder(
//                                 borderRadius: BorderRadius.circular(12),
//                               ),
//                               elevation: 5,
//                               shadowColor: Colors.purple,
//                               color: Colors.white,
//                               child: ListTile(
//                                 onTap: () {
//                                   bool newCompleteTask = !todo.isCompleted;
//                                   ToDoDatabaseService().updateTask(todo.uid, newCompleteTask);
//                                 },
//                                 leading: Container(
//                                   height: 30,
//                                   width: 30,
//                                   decoration: BoxDecoration(
//                                     color: Colors.purple,
//                                     shape: BoxShape.circle,
//                                   ),
//                                   child: todo.isCompleted
//                                       ? const Icon(Icons.check, color: Colors.white)
//                                       : Container(),
//                                 ),
//                                 title: Text(
//                                   todo.title,
//                                   style: const TextStyle(
//                                     fontSize: 24,
//                                     fontWeight: FontWeight.w500,
//                                     color: Colors.black87,
//                                   ),
//                                 ),
//                                 subtitle: Column(
//                                   crossAxisAlignment: CrossAxisAlignment.start,
//                                   children: [
//                                     if (todo.deadline != null)
//                                       Text(
//                                         "Deadline: ${todo.deadline!.toString().split(' ')[0]}",
//                                         style: const TextStyle(fontSize: 14, color: Colors.grey),
//                                       ),
//                                     if (todo.priority != null)
//                                       Text(
//                                         "Priority: ${todo.priority}",
//                                         style: const TextStyle(fontSize: 14, color: Colors.grey),
//                                       ),
//                                   ],
//                                 ),
//                               ),
//                             ),
//                           ),
//                         );
//                       },
//                     ),
//                   ),
//                 ],
//               ),
//             );
//           },
//         ),
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: () {
//           showDialog(
//             context: context,
//             builder: (context) => ToDoDialog(
//               todoTitleController: todoTitleController,
//               scheduleNotification: scheduleNotification,
//             ),
//           );
//         },
//         child: const Icon(Icons.add),
//         backgroundColor: Colors.purple,
//         elevation: 6,
//         shape: RoundedRectangleBorder(
//           borderRadius: BorderRadius.circular(18.0),
//         ),
//       ),
//     );
//   }
// }


// import 'package:flutter/material.dart';
// import 'package:awesome_notifications/awesome_notifications.dart';
// import 'package:to_do_app/TO%20DO/Model/todo_model.dart';
// import 'package:to_do_app/TO%20DO/Service/todo_database_service.dart';
// import 'package:to_do_app/TO%20DO/loader.dart';
// import 'package:to_do_app/TO%20DO/mytodo_dialog.dart';

// class TodoList extends StatefulWidget {
//   const TodoList({Key? key}) : super(key: key);

//   @override
//   State<TodoList> createState() => _TodoListState();
// }

// class _TodoListState extends State<TodoList> {
//   TextEditingController todoTitleController = TextEditingController();
//   final AwesomeNotifications awesomeNotifications = AwesomeNotifications();

//   String _filterType = 'priority';
//   bool _isDescending = true;

//   @override
//   void initState() {
//     super.initState();
//     awesomeNotifications.initialize(
//       'resource://drawable/ic_notification',
//       [
//         NotificationChannel(
//           channelKey: 'basic_channel',
//           channelName: 'Basic notifications',
//           channelDescription: 'Notification channel for basic notifications',
//           defaultColor: Color(0xFF9D50DD),
//           ledColor: Colors.white,
//         ),
//       ],
//     );
//   }

//   void scheduleNotification(TodoModel todo) async {
//     if (todo.deadline != null) {
//       DateTime scheduledDateTime = DateTime(
//         todo.deadline!.year,
//         todo.deadline!.month,
//         todo.deadline!.day,
//         14,
//         25,
//       );

//       String notificationTitle = 'Task Reminder';
//       String notificationBody = todo.title;

//       awesomeNotifications.createNotification(
//         content: NotificationContent(
//           id: todo.uid.hashCode,
//           channelKey: 'basic_channel',
//           title: notificationTitle,
//           body: notificationBody,
//           notificationLayout: NotificationLayout.BigText,
//           payload: {'todoId': todo.uid},
//         ),
//         schedule: NotificationCalendar(
//           weekday: scheduledDateTime.weekday,
//           hour: scheduledDateTime.hour,
//           minute: scheduledDateTime.minute,
//           second: 0,
//           millisecond: 0,
//           repeats: false,
//         ),
//       );

//       print('Notification scheduled for: $scheduledDateTime');
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('My To Do List'),
//         centerTitle: true,
//         flexibleSpace: Container(
//           decoration: BoxDecoration(
//             gradient: LinearGradient(
//               colors: [Color(0xFF9D50DD), Color(0xFFE91E63)],
//               begin: Alignment.topLeft,
//               end: Alignment.bottomRight,
//             ),
//           ),
//         ),
//         actions: [
//           DropdownButton<String>(
//             value: _filterType,
//             icon: const Icon(Icons.filter_list, color: Colors.white),
//             onChanged: (String? newValue) {
//               setState(() {
//                 _filterType = newValue!;
//               });
//             },
//             items: <String>['priority', 'deadline']
//                 .map<DropdownMenuItem<String>>((String value) {
//               return DropdownMenuItem<String>(
//                 value: value,
//                 child: Text(value, style: TextStyle(color: Colors.black)),
//               );
//             }).toList(),
//           ),
//           DropdownButton<bool>(
//             value: _isDescending,
//             icon: const Icon(Icons.sort, color: Colors.white),
//             onChanged: (bool? newValue) {
//               setState(() {
//                 _isDescending = newValue!;
//               });
//             },
//             items: <bool>[true, false]
//                 .map<DropdownMenuItem<bool>>((bool value) {
//               return DropdownMenuItem<bool>(
//                 value: value,
//                 child: Text(
//                   value ? 'Descending' : 'Ascending',
//                   style: TextStyle(color: Colors.black),
//                 ),
//               );
//             }).toList(),
//           ),
//         ],
//       ),
//       backgroundColor: Colors.grey[200],
//       body: SafeArea(
//         child: StreamBuilder<List<TodoModel>>(
//           stream: ToDoDatabaseService().listTodo(
//             orderBy: _filterType,
//             descending: _isDescending,
//           ),
//           builder: (context, snapshot) {
//             if (!snapshot.hasData) {
//               return const Loader();
//             }
//             List<TodoModel>? todoList = snapshot.data;
//             return Padding(
//               padding: const EdgeInsets.all(20.0),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   const Text(
//                     "My To Do List",
//                     style: TextStyle(
//                       fontSize: 28,
//                       fontWeight: FontWeight.bold,
//                       color: Colors.purple,
//                     ),
//                   ),
//                   const SizedBox(height: 10),
//                   const Divider(color: Colors.grey),
//                   const SizedBox(height: 20),
//                   Expanded(
//                     child: ListView.builder(
//                       itemCount: todoList!.length,
//                       itemBuilder: (context, index) {
//                         TodoModel todo = todoList[index];
//                         return Dismissible(
//                           key: Key(todo.uid),
//                           background: Container(
//                             alignment: Alignment.centerLeft,
//                             color: Colors.red,
//                             child: const Icon(Icons.delete, color: Colors.white),
//                           ),
//                           onDismissed: (direction) async {
//                             await ToDoDatabaseService().deleteTodo(todo.uid);
//                           },
//                           child: Card(
//                             shape: RoundedRectangleBorder(
//                               borderRadius: BorderRadius.circular(12),
//                             ),
//                             elevation: 5,
//                             shadowColor: Colors.purple,
//                             child: ListTile(
//                               onTap: () {
//                                 bool newCompleteTask = !todo.isCompleted;
//                                 ToDoDatabaseService().updateTask(todo.uid, newCompleteTask);
//                               },
//                               leading: Container(
//                                 height: 30,
//                                 width: 30,
//                                 decoration: BoxDecoration(
//                                   color: Colors.purple,
//                                   shape: BoxShape.circle,
//                                 ),
//                                 child: todo.isCompleted
//                                     ? const Icon(Icons.check, color: Colors.white)
//                                     : Container(),
//                               ),
//                               title: Text(
//                                 todo.title,
//                                 style: const TextStyle(
//                                   fontSize: 20,
//                                   fontWeight: FontWeight.w500,
//                                   color: Colors.black87,
//                                 ),
//                               ),
//                               subtitle: Column(
//                                 crossAxisAlignment: CrossAxisAlignment.start,
//                                 children: [
//                                   if (todo.deadline != null)
//                                     Text(
//                                       "Deadline: ${todo.deadline!.toString().split(' ')[0]}",
//                                       style: const TextStyle(fontSize: 14, color: Colors.grey),
//                                     ),
//                                   if (todo.priority != null)
//                                     Text(
//                                       "Priority: ${todo.priority}",
//                                       style: const TextStyle(fontSize: 14, color: Colors.grey),
//                                     ),
//                                 ],
//                               ),
//                             ),
//                           ),
//                         );
//                       },
//                     ),
//                   ),
//                 ],
//               ),
//             );
//           },
//         ),
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: () {
//           showDialog(
//             context: context,
//             builder: (context) => ToDoDialog(
//               todoTitleController: todoTitleController,
//               scheduleNotification: scheduleNotification,
//             ),
//           );
//         },
//         child: const Icon(Icons.add),
//         backgroundColor: Colors.purple,
//         elevation: 6,
//         shape: RoundedRectangleBorder(
//           borderRadius: BorderRadius.circular(18.0),
//         ),
//       ),
//     );
//   }
// }


//good code
// import 'package:flutter/material.dart';
// import 'package:awesome_notifications/awesome_notifications.dart';
// import 'package:to_do_app/TO%20DO/Model/todo_model.dart';
// import 'package:to_do_app/TO%20DO/Service/todo_database_service.dart';
// import 'package:to_do_app/TO%20DO/loader.dart';
// import 'package:to_do_app/TO%20DO/mytodo_dialog.dart';

// class TodoList extends StatefulWidget {
//   const TodoList({Key? key}) : super(key: key);

//   @override
//   State<TodoList> createState() => _TodoListState();
// }

// class _TodoListState extends State<TodoList> {
//   TextEditingController todoTitleController = TextEditingController();
//   final AwesomeNotifications awesomeNotifications = AwesomeNotifications();

//   String _filterType = 'priority';
//   bool _isDescending = true;

//   @override
//   void initState() {
//     super.initState();
//     awesomeNotifications.initialize(
//       'resource://drawable/ic_notification',
//       [
//         NotificationChannel(
//           channelKey: 'basic_channel',
//           channelName: 'Basic notifications',
//           channelDescription: 'Notification channel for basic notifications',
//           defaultColor: Color(0xFF9D50DD),
//           ledColor: Colors.white,
//         ),
//       ],
//     );
//   }

//   void scheduleNotification(TodoModel todo) async {
//     if (todo.deadline != null) {
//       DateTime scheduledDateTime = DateTime(
//         todo.deadline!.year,
//         todo.deadline!.month,
//         todo.deadline!.day,
//         14,
//         25,
//       );

//       String notificationTitle = 'Task Reminder';
//       String notificationBody = todo.title;

//       awesomeNotifications.createNotification(
//         content: NotificationContent(
//           id: todo.uid.hashCode,
//           channelKey: 'basic_channel',
//           title: notificationTitle,
//           body: notificationBody,
//           notificationLayout: NotificationLayout.BigText,
//           payload: {'todoId': todo.uid},
//         ),
//         schedule: NotificationCalendar(
//           weekday: scheduledDateTime.weekday,
//           hour: scheduledDateTime.hour,
//           minute: scheduledDateTime.minute,
//           second: 0,
//           millisecond: 0,
//           repeats: false,
//         ),
//       );

//       print('Notification scheduled for: $scheduledDateTime');
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Row(
//           mainAxisAlignment: MainAxisAlignment.start,
//           children: const [
//             Text('Todo', textAlign: TextAlign.left),
//           ],
//         ),
//         actions: [
//           DropdownButton<String>(
//             value: _filterType,
//             icon: const Icon(Icons.filter_list, color: Colors.white),
//             onChanged: (String? newValue) {
//               setState(() {
//                 _filterType = newValue!;
//               });
//             },
//             items: <String>['priority', 'deadline']
//                 .map<DropdownMenuItem<String>>((String value) {
//               return DropdownMenuItem<String>(
//                 value: value,
//                 child: Text(value, style: const TextStyle(color: Colors.black)),
//               );
//             }).toList(),
//           ),
//           const SizedBox(width: 10), // Spacer for better separation
//           DropdownButton<bool>(
//             value: _isDescending,
//             icon: const Icon(Icons.sort, color: Colors.white),
//             onChanged: (bool? newValue) {
//               setState(() {
//                 _isDescending = newValue!;
//               });
//             },
//             items: <bool>[true, false]
//                 .map<DropdownMenuItem<bool>>((bool value) {
//               return DropdownMenuItem<bool>(
//                 value: value,
//                 child: Text(
//                   value ? 'Descending' : 'Ascending',
//                   style: const TextStyle(color: Colors.black),
//                 ),
//               );
//             }).toList(),
//           ),
//         ],
//         flexibleSpace: Container(
//           decoration: const BoxDecoration(
//             gradient: LinearGradient(
//               colors: [Color(0xFF9D50DD), Color(0xFFE91E63)],
//               begin: Alignment.topLeft,
//               end: Alignment.bottomRight,
//             ),
//           ),
//         ),
//       ),
//       backgroundColor: Colors.purple[50],
//       body: SafeArea(
//         child: StreamBuilder<List<TodoModel>>(
//           stream: ToDoDatabaseService().listTodo(
//             orderBy: _filterType,
//             descending: _isDescending,
//           ),
//           builder: (context, snapshot) {
//             if (!snapshot.hasData) {
//               return const Loader();
//             }
//             List<TodoModel>? todoList = snapshot.data;
//             return Padding(
//               padding: const EdgeInsets.all(20.0),
//               child: Column(
//                 mainAxisAlignment: MainAxisAlignment.start,
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   const Text(
//                     "My To Do",
//                     style: TextStyle(
//                       fontSize: 32,
//                       fontWeight: FontWeight.bold,
//                       color: Colors.purple,
//                     ),
//                   ),
//                   const SizedBox(height: 10),
//                   const Divider(color: Colors.grey),
//                   const SizedBox(height: 20),
//                   Expanded(
//                     child: ListView.builder(
//                       itemCount: todoList!.length,
//                       itemBuilder: (context, index) {
//                         TodoModel todo = todoList[index];
//                         return Dismissible(
//                           key: Key(todo.uid),
//                           background: Container(
//                             alignment: Alignment.centerLeft,
//                             color: Colors.red,
//                             child: const Icon(Icons.delete, color: Colors.white),
//                           ),
//                           onDismissed: (direction) async {
//                             await ToDoDatabaseService().deleteTodo(todo.uid);
//                           },
//                           child: Padding(
//                             padding: const EdgeInsets.only(bottom: 20.0),
//                             child: Card(
//                               shape: RoundedRectangleBorder(
//                                 borderRadius: BorderRadius.circular(12),
//                               ),
//                               elevation: 5,
//                               shadowColor: Colors.purple,
//                               color: Colors.white,
//                               child: ListTile(
//                                 onTap: () {
//                                   bool newCompleteTask = !todo.isCompleted;
//                                   ToDoDatabaseService().updateTask(todo.uid, newCompleteTask);
//                                 },
//                                 leading: Container(
//                                   height: 30,
//                                   width: 30,
//                                   decoration: BoxDecoration(
//                                     color: Colors.purple,
//                                     shape: BoxShape.circle,
//                                   ),
//                                   child: todo.isCompleted
//                                       ? const Icon(Icons.check, color: Colors.white)
//                                       : Container(),
//                                 ),
//                                 title: Text(
//                                   todo.title,
//                                   style: const TextStyle(
//                                     fontSize: 24,
//                                     fontWeight: FontWeight.w500,
//                                     color: Colors.black87,
//                                   ),
//                                 ),
//                                 subtitle: Column(
//                                   crossAxisAlignment: CrossAxisAlignment.start,
//                                   children: [
//                                     if (todo.deadline != null)
//                                       Text(
//                                         "Deadline: ${todo.deadline!.toString().split(' ')[0]}",
//                                         style: const TextStyle(fontSize: 14, color: Colors.grey),
//                                       ),
//                                     if (todo.priority != null)
//                                       Text(
//                                         "Priority: ${todo.priority}",
//                                         style: const TextStyle(fontSize: 14, color: Colors.grey),
//                                       ),
//                                   ],
//                                 ),
//                               ),
//                             ),
//                           ),
//                         );
//                       },
//                     ),
//                   ),
//                 ],
//               ),
//             );
//           },
//         ),
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: () {
//           showDialog(
//             context: context,
//             builder: (context) => ToDoDialog(
//               todoTitleController: todoTitleController,
//               scheduleNotification: scheduleNotification,
//             ),
//           );
//         },
//         child: const Icon(Icons.add),
//         backgroundColor: Colors.purple,
//         elevation: 6,
//         shape: RoundedRectangleBorder(
//           borderRadius: BorderRadius.circular(18.0),
//         ),
//       ),
//     );
//   }
// }


////good code 2
// import 'package:flutter/material.dart';
// import 'package:awesome_notifications/awesome_notifications.dart';
// import 'package:to_do_app/TO%20DO/Model/todo_model.dart';
// import 'package:to_do_app/TO%20DO/Service/todo_database_service.dart';
// import 'package:to_do_app/TO%20DO/loader.dart';
// import 'package:to_do_app/TO%20DO/mytodo_dialog.dart';

// class TodoList extends StatefulWidget {
//   const TodoList({Key? key}) : super(key: key);

//   @override
//   State<TodoList> createState() => _TodoListState();
// }

// class _TodoListState extends State<TodoList> {
//   TextEditingController todoTitleController = TextEditingController();
//   final AwesomeNotifications awesomeNotifications = AwesomeNotifications();

//   String _filterType = 'priority';
//   bool _isDescending = true;

//   @override
//   void initState() {
//     super.initState();
//     awesomeNotifications.initialize(
//       'resource://drawable/ic_notification',
//       [
//         NotificationChannel(
//           channelKey: 'basic_channel',
//           channelName: 'Basic notifications',
//           channelDescription: 'Notification channel for basic notifications',
//           defaultColor: Color(0xFF9D50DD),
//           ledColor: Colors.white,
//         ),
//       ],
//     );
//   }

//   void scheduleNotification(TodoModel todo) async {
//     if (todo.deadline != null) {
//       DateTime scheduledDateTime = DateTime(
//         todo.deadline!.year,
//         todo.deadline!.month,
//         todo.deadline!.day,
//         14,
//         25,
//       );

//       String notificationTitle = 'Task Reminder';
//       String notificationBody = todo.title;

//       awesomeNotifications.createNotification(
//         content: NotificationContent(
//           id: todo.uid.hashCode,
//           channelKey: 'basic_channel',
//           title: notificationTitle,
//           body: notificationBody,
//           notificationLayout: NotificationLayout.BigText,
//           payload: {'todoId': todo.uid},
//         ),
//         schedule: NotificationCalendar(
//           weekday: scheduledDateTime.weekday,
//           hour: scheduledDateTime.hour,
//           minute: scheduledDateTime.minute,
//           second: 0,
//           millisecond: 0,
//           repeats: false,
//         ),
//       );

//       print('Notification scheduled for: $scheduledDateTime');
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Row(
//           mainAxisAlignment: MainAxisAlignment.start,
//           children: const [
//             Text('Todo', textAlign: TextAlign.left),
//           ],
//         ),
//         actions: [
//           DropdownButton<String>(
//             value: _filterType,
//             icon: const Icon(Icons.filter_list, color: Colors.white),
//             underline: Container(), // Removes the underline
//             onChanged: (String? newValue) {
//               setState(() {
//                 _filterType = newValue!;
//               });
//             },
//             items: <String>['priority', 'deadline']
//                 .map<DropdownMenuItem<String>>((String value) {
//               return DropdownMenuItem<String>(
//                 value: value,
//                 child: Text(value, style: const TextStyle(color: Colors.white)), // Adjusted text style
//               );
//             }).toList(),
//           ),
//           const SizedBox(width: 10), // Spacer for better separation
//           DropdownButton<bool>(
//             value: _isDescending,
//             icon: const Icon(Icons.sort, color: Colors.white),
//             underline: Container(), // Removes the underline
//             onChanged: (bool? newValue) {
//               setState(() {
//                 _isDescending = newValue!;
//               });
//             },
//             items: <bool>[true, false]
//                 .map<DropdownMenuItem<bool>>((bool value) {
//               return DropdownMenuItem<bool>(
//                 value: value,
//                 child: Text(
//                   value ? 'Descending' : 'Ascending',
//                   style: const TextStyle(color: Colors.white), // Adjusted text style
//                 ),
//               );
//             }).toList(),
//           ),
//         ],
//         flexibleSpace: Container(
//           decoration: const BoxDecoration(
//             gradient: LinearGradient(
//               colors: [Color(0xFF9D50DD), Color(0xFFE91E63)],
//               begin: Alignment.topLeft,
//               end: Alignment.bottomRight,
//             ),
//           ),
//         ),
//       ),
//       backgroundColor: Colors.purple[50],
//       body: SafeArea(
//         child: StreamBuilder<List<TodoModel>>(
//           stream: ToDoDatabaseService().listTodo(
//             orderBy: _filterType,
//             descending: _isDescending,
//           ),
//           builder: (context, snapshot) {
//             if (!snapshot.hasData) {
//               return const Loader();
//             }
//             List<TodoModel>? todoList = snapshot.data;
//             return Padding(
//               padding: const EdgeInsets.all(20.0),
//               child: Column(
//                 mainAxisAlignment: MainAxisAlignment.start,
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   const Text(
//                     "My To Do",
//                     style: TextStyle(
//                       fontSize: 32,
//                       fontWeight: FontWeight.bold,
//                       color: Colors.purple,
//                     ),
//                   ),
//                   const SizedBox(height: 10),
//                   const Divider(color: Colors.grey),
//                   const SizedBox(height: 20),
//                   Expanded(
//                     child: ListView.builder(
//                       itemCount: todoList!.length,
//                       itemBuilder: (context, index) {
//                         TodoModel todo = todoList[index];
//                         return Dismissible(
//                           key: Key(todo.uid),
//                           background: Container(
//                             alignment: Alignment.centerLeft,
//                             color: Colors.red,
//                             child: const Icon(Icons.delete, color: Colors.white),
//                           ),
//                           onDismissed: (direction) async {
//                             await ToDoDatabaseService().deleteTodo(todo.uid);
//                           },
//                           child: Padding(
//                             padding: const EdgeInsets.only(bottom: 20.0),
//                             child: Card(
//                               shape: RoundedRectangleBorder(
//                                 borderRadius: BorderRadius.circular(12),
//                               ),
//                               elevation: 5,
//                               shadowColor: Colors.purple,
//                               color: Colors.white,
//                               child: ListTile(
//                                 onTap: () {
//                                   bool newCompleteTask = !todo.isCompleted;
//                                   ToDoDatabaseService().updateTask(todo.uid, newCompleteTask);
//                                 },
//                                 leading: Container(
//                                   height: 30,
//                                   width: 30,
//                                   decoration: BoxDecoration(
//                                     color: Colors.purple,
//                                     shape: BoxShape.circle,
//                                   ),
//                                   child: todo.isCompleted
//                                       ? const Icon(Icons.check, color: Colors.white)
//                                       : Container(),
//                                 ),
//                                 title: Text(
//                                   todo.title,
//                                   style: const TextStyle(
//                                     fontSize: 24,
//                                     fontWeight: FontWeight.w500,
//                                     color: Colors.black87,
//                                   ),
//                                 ),
//                                 subtitle: Column(
//                                   crossAxisAlignment: CrossAxisAlignment.start,
//                                   children: [
//                                     if (todo.deadline != null)
//                                       Text(
//                                         "Deadline: ${todo.deadline!.toString().split(' ')[0]}",
//                                         style: const TextStyle(fontSize: 14, color: Colors.grey),
//                                       ),
//                                     if (todo.priority != null)
//                                       Text(
//                                         "Priority: ${todo.priority}",
//                                         style: const TextStyle(fontSize: 14, color: Colors.grey),
//                                       ),
//                                   ],
//                                 ),
//                               ),
//                             ),
//                           ),
//                         );
//                       },
//                     ),
//                   ),
//                 ],
//               ),
//             );
//           },
//         ),
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: () {
//           showDialog(
//             context: context,
//             builder: (context) => ToDoDialog(
//               todoTitleController: todoTitleController,
//               scheduleNotification: scheduleNotification,
//             ),
//           );
//         },
//         child: const Icon(Icons.add),
//         backgroundColor: Colors.purple,
//         elevation: 6,
//         shape: RoundedRectangleBorder(
//           borderRadius: BorderRadius.circular(18.0),
//         ),
//       ),
//     );
//   }
// }


// import 'package:flutter/material.dart';
// import 'package:mad_my_app/screens/home/views/Model/todo_model.dart';
// import 'package:mad_my_app/screens/home/views/Service/todo_database_service.dart';
// import 'package:mad_my_app/screens/home/views/loader.dart';
// import 'package:mad_my_app/screens/home/views/mytodo_dialog.dart';

// class TodoList extends StatefulWidget {
//   final String userId;

//   const TodoList({Key? key, required this.userId}) : super(key: key);

//   @override
//   State<TodoList> createState() => _TodoListState();
// }

// class _TodoListState extends State<TodoList> {
//   TextEditingController todoTitleController = TextEditingController();
//   // final AwesomeNotifications awesomeNotifications = AwesomeNotifications();

//   String _filterType = 'priority';
//   bool _isDescending = true;

//   @override
//   void initState() {
//     super.initState();
//     // awesomeNotifications.initialize(
//     //   'resource://drawable/ic_notification',
//     //   [
//     //     NotificationChannel(
//     //       channelKey: 'basic_channel',
//     //       channelName: 'Basic notifications',
//     //       channelDescription: 'Notification channel for basic notifications',
//     //       defaultColor: Color(0xFF9D50DD),
//     //       ledColor: Colors.white,
//     //     ),
//     //   ],
//     //);
//   }

//   void scheduleNotification(TodoModel todo) async {
//     if (todo.deadline != null) {
//       DateTime scheduledDateTime = DateTime(
//         todo.deadline!.year,
//         todo.deadline!.month,
//         todo.deadline!.day,
//         14,
//         25,
//       );

//       String notificationTitle = 'Task Reminder';
//       String notificationBody = todo.title;

//       // awesomeNotifications.createNotification(
//       //   content: NotificationContent(
//       //     id: todo.uid.hashCode,
//       //     channelKey: 'basic_channel',
//       //     title: notificationTitle,
//       //     body: notificationBody,
//       //     notificationLayout: NotificationLayout.BigText,
//       //     payload: {'todoId': todo.uid},
//       //   ),
//       //   schedule: NotificationCalendar(
//       //     weekday: scheduledDateTime.weekday,
//       //     hour: scheduledDateTime.hour,
//       //     minute: scheduledDateTime.minute,
//       //     second: 0,
//       //     millisecond: 0,
//       //     repeats: false,
//       //   ),
//       // );

//       print('Notification scheduled for: $scheduledDateTime');
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Row(
//           mainAxisAlignment: MainAxisAlignment.start,
//           children: [
//             Text('Todo List', textAlign: TextAlign.left),
//           ],
//         ),
//         actions: [
//           DropdownButton<String>(
//             value: _filterType,
//             icon: const Icon(Icons.filter_list, color: Colors.white),
//             underline: Container(), // Removes the underline
//             onChanged: (String? newValue) {
//               setState(() {
//                 _filterType = newValue!;
//               });
//             },
//             items: <String>['priority', 'deadline']
//                 .map<DropdownMenuItem<String>>((String value) {
//               return DropdownMenuItem<String>(
//                 value: value,
//                 child: Text(value, style: const TextStyle(color: Colors.black)), // Adjusted text style
//               );
//             }).toList(),
//           ),
//           const SizedBox(width: 10), // Spacer for better separation
//           DropdownButton<bool>(
//             value: _isDescending,
//             icon: const Icon(Icons.filter_list, color: Colors.white), // Use the same icon for consistency
//             underline: Container(), // Removes the underline
//             onChanged: (bool? newValue) {
//               setState(() {
//                 _isDescending = newValue!;
//               });
//             },
//             items: <bool>[true, false]
//                 .map<DropdownMenuItem<bool>>((bool value) {
//               return DropdownMenuItem<bool>(
//                 value: value,
//                 child: Text(
//                   value ? 'descending' : 'ascending',
//                   style: const TextStyle(color: Colors.black), // Adjusted text style
//                 ),
//               );
//             }).toList(),
//           ),
//         ],
//         flexibleSpace: Container(
//           decoration: const BoxDecoration(
//             gradient: LinearGradient(
//               colors: [Color(0xFF9D50DD), Color(0xFFE91E63)],
//               begin: Alignment.topLeft,
//               end: Alignment.bottomRight,
//             ),
//           ),
//         ),
//       ),
//       backgroundColor: Colors.purple[50],
//       body: SafeArea(
//         child: StreamBuilder<List<TodoModel>>(
//           stream: ToDoDatabaseService(widget.userId).listTodo(
//             orderBy: _filterType,
//             descending: _isDescending,
//           ),
//           builder: (context, snapshot) {
//             if (!snapshot.hasData) {
//               return const Loader();
//             }
//             List<TodoModel>? todoList = snapshot.data;
//             return Padding(
//               padding: const EdgeInsets.all(20.0),
//               child: Column(
//                 mainAxisAlignment: MainAxisAlignment.start,
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   const Text(
//                     "My To Do",
//                     style: TextStyle(
//                       fontSize: 32,
//                       fontWeight: FontWeight.bold,
//                       color: Colors.purple,
//                     ),
//                   ),
//                   const SizedBox(height: 10),
//                   const Divider(color: Colors.grey),
//                   const SizedBox(height: 20),
//                   Expanded(
//                     child: ListView.builder(
//                       itemCount: todoList!.length,
//                       itemBuilder: (context, index) {
//                         TodoModel todo = todoList[index];
//                         return Dismissible(
//                           key: Key(todo.uid),
//                           background: Container(
//                             alignment: Alignment.centerLeft,
//                             color: Colors.red,
//                             child: const Icon(Icons.delete, color: Colors.white),
//                           ),
//                           onDismissed: (direction) async {
//                             await ToDoDatabaseService(widget.userId).deleteTodo(todo.uid);
//                           },
//                           child: Padding(
//                             padding: const EdgeInsets.only(bottom: 20.0),
//                             child: Card(
//                               shape: RoundedRectangleBorder(
//                                 borderRadius: BorderRadius.circular(12),
//                               ),
//                               elevation: 5,
//                               shadowColor: Colors.purple,
//                               color: Colors.white,
//                               child: ListTile(
//                                 onTap: () {
//                                   bool newCompleteTask = !todo.isCompleted;
//                                   ToDoDatabaseService(widget.userId).updateTask(todo.uid, newCompleteTask);
//                                 },
//                                 leading: Container(
//                                   height: 30,
//                                   width: 30,
//                                   decoration: const BoxDecoration(
//                                     color: Colors.purple,
//                                     shape: BoxShape.circle,
//                                   ),
//                                   child: todo.isCompleted
//                                       ? const Icon(Icons.check, color: Colors.white)
//                                       : Container(),
//                                 ),
//                                 title: Text(
//                                   todo.title,
//                                   style: const TextStyle(
//                                     fontSize: 24,
//                                     fontWeight: FontWeight.w500,
//                                     color: Colors.black87,
//                                   ),
//                                 ),
//                                 subtitle: Column(
//                                   crossAxisAlignment: CrossAxisAlignment.start,
//                                   children: [
//                                     if (todo.deadline != null)
//                                       Text(
//                                         "Deadline: ${todo.deadline!.toString().split(' ')[0]}",
//                                         style: const TextStyle(fontSize: 14, color: Colors.grey),
//                                       ),
//                                     if (todo.priority != null)
//                                       Text(
//                                         "Priority: ${todo.priority}",
//                                         style: const TextStyle(fontSize: 14, color: Colors.grey),
//                                       ),
//                                   ],
//                                 ),
//                               ),
//                             ),
//                           ),
//                         );
//                       },
//                     ),
//                   ),
//                 ],
//               ),
//             );
//           },
//         ),
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: () {
//           showDialog(
//             context: context,
//             builder: (context) => ToDoDialog(
//               todoTitleController: todoTitleController,
//               scheduleNotification: scheduleNotification, userId: '',
//             ),
//           );
//         },
//         child: const Icon(Icons.add),
//         backgroundColor: Colors.purple,
//         elevation: 6,
//         shape: RoundedRectangleBorder(
//           borderRadius: BorderRadius.circular(18.0),
//         ),
//       ),
//     );
//   }
// }




import 'package:flutter/material.dart';
import 'package:mad_my_app/screens/home/views/Model/todo_model.dart';
import 'package:mad_my_app/screens/home/views/Service/todo_database_service.dart';
import 'package:mad_my_app/screens/home/views/loader.dart';
import 'package:mad_my_app/screens/home/views/mytodo_dialog.dart';

class TodoList extends StatefulWidget {
  final String userId;

  const TodoList({Key? key, required this.userId}) : super(key: key);

  @override
  State<TodoList> createState() => _TodoListState();
}

class _TodoListState extends State<TodoList> {
  TextEditingController todoTitleController = TextEditingController();
  // final AwesomeNotifications awesomeNotifications = AwesomeNotifications();

  String _filterType = 'priority';
  bool _isDescending = true;

  @override
  void initState() {
    super.initState();
    // awesomeNotifications.initialize(
    //   'resource://drawable/ic_notification',
    //   [
    //     NotificationChannel(
    //       channelKey: 'basic_channel',
    //       channelName: 'Basic notifications',
    //       channelDescription: 'Notification channel for basic notifications',
    //       defaultColor: Color(0xFF9D50DD),
    //       ledColor: Colors.white,
    //     ),
    //   ],
    // );
  }

  void scheduleNotification(TodoModel todo) async {
    if (todo.deadline != null) {
      DateTime scheduledDateTime = DateTime(
        todo.deadline!.year,
        todo.deadline!.month,
        todo.deadline!.day,
        14,
        25,
      );

      String notificationTitle = 'Task Reminder';
      String notificationBody = todo.title;

      // awesomeNotifications.createNotification(
      //   content: NotificationContent(
      //     id: todo.uid.hashCode,
      //     channelKey: 'basic_channel',
      //     title: notificationTitle,
      //     body: notificationBody,
      //     notificationLayout: NotificationLayout.BigText,
      //     payload: {'todoId': todo.uid},
      //   ),
      //   schedule: NotificationCalendar(
      //     weekday: scheduledDateTime.weekday,
      //     hour: scheduledDateTime.hour,
      //     minute: scheduledDateTime.minute,
      //     second: 0,
      //     millisecond: 0,
      //     repeats: false,
      //   ),
      // );

      print('Notification scheduled for: $scheduledDateTime');
    }
  }

  @override
  Widget build(BuildContext context) {
    final String userId = widget.userId;
    assert(userId.isNotEmpty, 'userId must not be empty');

    return Scaffold(
      appBar: AppBar(
        title: const Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text('Todo List', textAlign: TextAlign.left),
          ],
        ),
        actions: [
          DropdownButton<String>(
            value: _filterType,
            icon: const Icon(Icons.filter_list, color: Colors.white),
            underline: Container(), // Removes the underline
            onChanged: (String? newValue) {
              setState(() {
                _filterType = newValue!;
              });
            },
            items: <String>['priority', 'deadline']
                .map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value, style: const TextStyle(color: Colors.black)), // Adjusted text style
              );
            }).toList(),
          ),
          const SizedBox(width: 10), // Spacer for better separation
          DropdownButton<bool>(
            value: _isDescending,
            icon: const Icon(Icons.filter_list, color: Colors.white), // Use the same icon for consistency
            underline: Container(), // Removes the underline
            onChanged: (bool? newValue) {
              setState(() {
                _isDescending = newValue!;
              });
            },
            items: <bool>[true, false]
                .map<DropdownMenuItem<bool>>((bool value) {
              return DropdownMenuItem<bool>(
                value: value,
                child: Text(
                  value ? 'descending' : 'ascending',
                  style: const TextStyle(color: Colors.black), // Adjusted text style
                ),
              );
            }).toList(),
          ),
        ],
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [Color(0xFF9D50DD), Color(0xFFE91E63)],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
        ),
      ),
      backgroundColor: Colors.purple[50],
      body: SafeArea(
        child: StreamBuilder<List<TodoModel>>(
          stream: ToDoDatabaseService(userId).listTodo(
            orderBy: _filterType,
            descending: _isDescending,
          ),
          builder: (context, snapshot) {
            if (!snapshot.hasData) {
              return const Loader();
            }
            List<TodoModel>? todoList = snapshot.data;
            return Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "My To Do",
                    style: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                      color: Colors.purple,
                    ),
                  ),
                  const SizedBox(height: 10),
                  const Divider(color: Colors.grey),
                  const SizedBox(height: 20),
                  Expanded(
                    child: ListView.builder(
                      itemCount: todoList!.length,
                      itemBuilder: (context, index) {
                        TodoModel todo = todoList[index];
                        return Dismissible(
                          key: Key(todo.uid),
                          background: Container(
                            alignment: Alignment.centerLeft,
                            color: Colors.red,
                            child: const Icon(Icons.delete, color: Colors.white),
                          ),
                          onDismissed: (direction) async {
                            await ToDoDatabaseService(userId).deleteTodo(todo.uid);
                          },
                          child: Padding(
                            padding: const EdgeInsets.only(bottom: 20.0),
                            child: Card(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                              elevation: 5,
                              shadowColor: Colors.purple,
                              color: Colors.white,
                              child: ListTile(
                                onTap: () {
                                  bool newCompleteTask = !todo.isCompleted;
                                  ToDoDatabaseService(userId).updateTask(todo.uid, newCompleteTask);
                                },
                                leading: Container(
                                  height: 30,
                                  width: 30,
                                  decoration: const BoxDecoration(
                                    color: Colors.purple,
                                    shape: BoxShape.circle,
                                  ),
                                  child: todo.isCompleted
                                      ? const Icon(Icons.check, color: Colors.white)
                                      : Container(),
                                ),
                                title: Text(
                                  todo.title,
                                  style: const TextStyle(
                                    fontSize: 24,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.black87,
                                  ),
                                ),
                                subtitle: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    if (todo.deadline != null)
                                      Text(
                                        "Deadline: ${todo.deadline!.toString().split(' ')[0]}",
                                        style: const TextStyle(fontSize: 14, color: Colors.grey),
                                      ),
                                    if (todo.priority != null)
                                      Text(
                                        "Priority: ${todo.priority}",
                                        style: const TextStyle(fontSize: 14, color: Colors.grey),
                                      ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
            context: context,
            builder: (context) => ToDoDialog(
              todoTitleController: todoTitleController,
              scheduleNotification: scheduleNotification, 
              userId: userId, // Correctly pass userId here
            ),
          );
        },
        child: const Icon(Icons.add),
        backgroundColor: Colors.purple,
        elevation: 6,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(18.0),
        ),
      ),
    );
  }
}



// import 'package:flutter/material.dart';
// import 'package:awesome_notifications/awesome_notifications.dart';
// import 'package:shared_preferences/shared_preferences.dart';
// import 'package:to_do_app/TO%20DO/Model/todo_model.dart';
// import 'package:to_do_app/TO%20DO/Service/todo_database_service.dart';
// import 'package:to_do_app/TO%20DO/loader.dart';
// import 'package:to_do_app/TO%20DO/mytodo_dialog.dart';

// class TodoList extends StatefulWidget {
//   const TodoList({Key? key}) : super(key: key);

//   @override
//   State<TodoList> createState() => _TodoListState();
// }

// class _TodoListState extends State<TodoList> {
//   TextEditingController todoTitleController = TextEditingController();
//   final AwesomeNotifications awesomeNotifications = AwesomeNotifications();

//   String _filterType = 'priority';
//   bool _isDescending = true;

//   @override
//   void initState() {
//     super.initState();
//     _loadFilterSettings();
//     awesomeNotifications.initialize(
//       'resource://drawable/ic_notification',
//       [
//         NotificationChannel(
//           channelKey: 'basic_channel',
//           channelName: 'Basic notifications',
//           channelDescription: 'Notification channel for basic notifications',
//           defaultColor: Color(0xFF9D50DD),
//           ledColor: Colors.white,
//         ),
//       ],
//     );
//   }

//   void _loadFilterSettings() async {
//     SharedPreferences prefs = await SharedPreferences.getInstance();
//     setState(() {
//       _filterType = prefs.getString('filterType') ?? 'priority';
//       _isDescending = prefs.getBool('isDescending') ?? true;
//     });
//   }

//   void _saveFilterSettings() async {
//     SharedPreferences prefs = await SharedPreferences.getInstance();
//     prefs.setString('filterType', _filterType);
//     prefs.setBool('isDescending', _isDescending);
//   }

//   void scheduleNotification(TodoModel todo) async {
//     if (todo.deadline != null) {
//       DateTime scheduledDateTime = DateTime(
//         todo.deadline!.year,
//         todo.deadline!.month,
//         todo.deadline!.day,
//         14,
//         25,
//       );

//       String notificationTitle = 'Task Reminder';
//       String notificationBody = todo.title;

//       awesomeNotifications.createNotification(
//         content: NotificationContent(
//           id: todo.uid.hashCode,
//           channelKey: 'basic_channel',
//           title: notificationTitle,
//           body: notificationBody,
//           notificationLayout: NotificationLayout.BigText,
//           payload: {'todoId': todo.uid},
//         ),
//         schedule: NotificationCalendar(
//           weekday: scheduledDateTime.weekday,
//           hour: scheduledDateTime.hour,
//           minute: scheduledDateTime.minute,
//           second: 0,
//           millisecond: 0,
//           repeats: false,
//         ),
//       );

//       print('Notification scheduled for: $scheduledDateTime');
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('My To Do'),
//         centerTitle: true,
//         flexibleSpace: Container(
//           decoration: const BoxDecoration(
//             gradient: LinearGradient(
//               colors: [Color(0xFF9D50DD), Color(0xFFE91E63)],
//               begin: Alignment.topLeft,
//               end: Alignment.bottomRight,
//             ),
//           ),
//         ),
//         actions: [
//           DropdownButton<String>(
//             value: _filterType,
//             icon: const Icon(Icons.filter_list, color: Colors.white),
//             onChanged: (String? newValue) {
//               setState(() {
//                 _filterType = newValue!;
//                 _saveFilterSettings();
//               });
//             },
//             items: <String>['priority', 'deadline']
//                 .map<DropdownMenuItem<String>>((String value) {
//               return DropdownMenuItem<String>(
//                 value: value,
//                 child: Text(value, style: TextStyle(color: Colors.black)),
//               );
//             }).toList(),
//           ),
//           DropdownButton<bool>(
//             value: _isDescending,
//             icon: const Icon(Icons.sort, color: Colors.white),
//             onChanged: (bool? newValue) {
//               setState(() {
//                 _isDescending = newValue!;
//                 _saveFilterSettings();
//               });
//             },
//             items: <bool>[true, false]
//                 .map<DropdownMenuItem<bool>>((bool value) {
//               return DropdownMenuItem<bool>(
//                 value: value,
//                 child: Text(
//                   value ? 'Descending' : 'Ascending',
//                   style: TextStyle(color: Colors.black),
//                 ),
//               );
//             }).toList(),
//           ),
//         ],
//       ),
//       backgroundColor: Colors.purple[50],
//       body: SafeArea(
//         child: StreamBuilder<List<TodoModel>>(
//           stream: ToDoDatabaseService().listTodo(
//             orderBy: _filterType,
//             descending: _isDescending,
//           ),
//           builder: (context, snapshot) {
//             if (!snapshot.hasData) {
//               return const Loader();
//             }
//             List<TodoModel>? todoList = snapshot.data;
//             return Padding(
//               padding: const EdgeInsets.all(20.0),
//               child: Column(
//                 mainAxisAlignment: MainAxisAlignment.start,
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   const Text(
//                     "My To Do",
//                     style: TextStyle(
//                       fontSize: 32,
//                       fontWeight: FontWeight.bold,
//                       color: Colors.purple,
//                     ),
//                   ),
//                   const SizedBox(height: 10),
//                   const Divider(color: Colors.grey),
//                   const SizedBox(height: 20),
//                   Expanded(
//                     child: ListView.builder(
//                       itemCount: todoList!.length,
//                       itemBuilder: (context, index) {
//                         TodoModel todo = todoList[index];
//                         return Dismissible(
//                           key: Key(todo.uid),
//                           background: Container(
//                             alignment: Alignment.centerLeft,
//                             color: Colors.red,
//                             child: const Icon(Icons.delete, color: Colors.white),
//                           ),
//                           onDismissed: (direction) async {
//                             await ToDoDatabaseService().deleteTodo(todo.uid);
//                           },
//                           child: Padding(
//                             padding: const EdgeInsets.only(bottom: 20.0),
//                             child: Card(
//                               shape: RoundedRectangleBorder(
//                                 borderRadius: BorderRadius.circular(12),
//                               ),
//                               elevation: 5,
//                               shadowColor: Colors.purple,
//                               color: Colors.white,
//                               child: ListTile(
//                                 onTap: () {
//                                   bool newCompleteTask = !todo.isCompleted;
//                                   ToDoDatabaseService().updateTask(todo.uid, newCompleteTask);
//                                 },
//                                 leading: Container(
//                                   height: 30,
//                                   width: 30,
//                                   decoration: BoxDecoration(
//                                     color: Colors.purple,
//                                     shape: BoxShape.circle,
//                                   ),
//                                   child: todo.isCompleted
//                                       ? const Icon(Icons.check, color: Colors.white)
//                                       : Container(),
//                                 ),
//                                 title: Text(
//                                   todo.title,
//                                   style: const TextStyle(
//                                     fontSize: 24,
//                                     fontWeight: FontWeight.w500,
//                                     color: Colors.black87,
//                                   ),
//                                 ),
//                                 subtitle: Column(
//                                   crossAxisAlignment: CrossAxisAlignment.start,
//                                   children: [
//                                     if (todo.deadline != null)
//                                       Text(
//                                         "Deadline: ${todo.deadline!.toString().split(' ')[0]}",
//                                         style: const TextStyle(fontSize: 14, color: Colors.grey),
//                                       ),
//                                     if (todo.priority != null)
//                                       Text(
//                                         "Priority: ${todo.priority}",
//                                         style: const TextStyle(fontSize: 14, color: Colors.grey),
//                                       ),
//                                   ],
//                                 ),
//                               ),
//                             ),
//                           ),
//                         );
//                       },
//                     ),
//                   ),
//                 ],
//               ),
//             );
//           },
//         ),
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: () {
//           showDialog(
//             context: context,
//             builder: ((context) => ToDoDialog(
//                   todoTitleController: todoTitleController,
//                   scheduleNotification: scheduleNotification,
//                 )),
//           );
//         },
//         child: const Icon(Icons.add),
//         backgroundColor: Colors.purple,
//       ),
//     );
//   }
// }









// import 'package:flutter/material.dart';
// import 'package:shared_preferences/shared_preferences.dart';
// import 'package:flutter_local_notifications/flutter_local_notifications.dart';
// import 'package:awesome_notifications/awesome_notifications.dart';
// import 'package:to_do_app/TO%20DO/Model/todo_model.dart';
// import 'package:to_do_app/TO%20DO/Service/todo_database_service.dart';
// import 'package:to_do_app/TO%20DO/loader.dart';
// import 'package:to_do_app/TO%20DO/mytodo_dialog.dart';

// class TodoList extends StatefulWidget {
//   const TodoList({Key? key}) : super(key: key);

//   @override
//   State<TodoList> createState() => _TodoListState();
// }

// class _TodoListState extends State<TodoList> {
//   TextEditingController todoTitleController = TextEditingController();
//   final AwesomeNotifications awesomeNotifications = AwesomeNotifications();
//   late SharedPreferences prefs; // Declare SharedPreferences variable

//   bool _filterByPriority = false; // Default filter settings
//   bool _sortByAscending = true;

//   @override
//   void initState() {
//     super.initState();
//     initializeNotifications();
//     initSharedPreferences(); // Initialize SharedPreferences
//   }

//   // Initialize Awesome Notifications
//   void initializeNotifications() {
//     awesomeNotifications.initialize(
//       'resource://drawable/ic_notification',
//       [
//         NotificationChannel(
//           channelKey: 'basic_channel',
//           channelName: 'Basic notifications',
//           channelDescription: 'Notification channel for basic notifications',
//           defaultColor: Color(0xFF9D50DD),
//           ledColor: Colors.white,
//         ),
//       ],
//     );
//   }

//   // Initialize SharedPreferences
//   void initSharedPreferences() async {
//     prefs = await SharedPreferences.getInstance();
//     // Retrieve filter settings from SharedPreferences
//     _filterByPriority = prefs.getBool('filterByPriority') ?? false;
//     _sortByAscending = prefs.getBool('sortByAscending') ?? true;
//     setState(() {}); // Update UI after retrieving SharedPreferences
//   }

//   // Save filter settings to SharedPreferences
//   void saveFilterSettings(bool filterByPriority, bool sortByAscending) async {
//     await prefs.setBool('filterByPriority', filterByPriority);
//     await prefs.setBool('sortByAscending', sortByAscending);
//     setState(() {
//       _filterByPriority = filterByPriority;
//       _sortByAscending = sortByAscending;
//     });
//   }

//   // Function to toggle filter settings
//   void toggleFilter(bool value) {
//     if (value) {
//       saveFilterSettings(true, _sortByAscending);
//     } else {
//       saveFilterSettings(false, _sortByAscending);
//     }
//   }

//   // Function to toggle sort order
//   void toggleSortOrder(bool value) {
//     if (value) {
//       saveFilterSettings(_filterByPriority, true);
//     } else {
//       saveFilterSettings(_filterByPriority, false);
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.blue[200],
//       body: SingleChildScrollView(
//         child: SafeArea(
//           child: StreamBuilder<List<TodoModel>>(
//             stream: ToDoDatabaseService().listTodo(),
//             builder: (context, snapshot) {
//               if (!snapshot.hasData) {
//                 return const Loader();
//               }
//               List<TodoModel>? todoList = snapshot.data;
//               // Apply filter and sorting based on preferences
//               if (_filterByPriority) {
//                 todoList!.sort((a, b) => _sortByAscending
//                     ? a.priority.compareTo(b.priority)
//                     : b.priority.compareTo(a.priority));
//               } else {
//                 todoList!.sort((a, b) => _sortByAscending
//                     ? a.deadline!.compareTo(b.deadline!)
//                     : b.deadline!.compareTo(a.deadline!));
//               }
//               return Padding(
//                 padding: const EdgeInsets.all(25.0),
//                 child: Column(
//                   mainAxisAlignment: MainAxisAlignment.start,
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                       children: [
//                         const Text(
//                           "My To Do",
//                           style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
//                         ),
//                         Row(
//                           children: [
//                             Text('Filter by Priority'),
//                             Switch(
//                               value: _filterByPriority,
//                               onChanged: toggleFilter,
//                             ),
//                             Text(_sortByAscending ? 'Ascending' : 'Descending'),
//                             Switch(
//                               value: _sortByAscending,
//                               onChanged: toggleSortOrder,
//                             ),
//                           ],
//                         ),
//                       ],
//                     ),
//                     const SizedBox(height: 10),
//                     const Divider(color: Colors.white),
//                     const SizedBox(height: 20),
//                     ListView.builder(
//                       shrinkWrap: true,
//                       itemCount: todoList.length,
//                       itemBuilder: (context, index) {
//                         TodoModel todo = todoList[index];
//                         return Dismissible(
//                           key: Key(todo.uid),
//                           background: Container(
//                             alignment: Alignment.centerLeft,
//                             color: Colors.red,
//                             child: const Icon(Icons.delete),
//                           ),
//                           onDismissed: (direction) async {
//                             await ToDoDatabaseService().deleteTodo(todo.uid);
//                           },
//                           child: Padding(
//                             padding: const EdgeInsets.only(bottom: 20.0),
//                             child: Card(
//                               shape: RoundedRectangleBorder(
//                                 borderRadius: BorderRadius.circular(6),
//                               ),
//                               child: ListTile(
//                                 onTap: () {
//                                   bool newCompleteTask = !todo.isCompleted;
//                                   ToDoDatabaseService()
//                                       .updateTask(todo.uid, newCompleteTask);
//                                 },
//                                 leading: Container(
//                                   height: 25,
//                                   width: 25,
//                                   decoration: const BoxDecoration(
//                                     color: Colors.purple,
//                                     shape: BoxShape.rectangle,
//                                   ),
//                                   child: todo.isCompleted
//                                       ? const Icon(
//                                           Icons.check,
//                                           color: Colors.white,
//                                         )
//                                       : Container(),
//                                 ),
//                                 title: Text(
//                                   todo.title,
//                                   style: const TextStyle(fontSize: 30),
//                                 ),
//                                 subtitle: Column(
//                                   crossAxisAlignment: CrossAxisAlignment.start,
//                                   children: [
//                                     if (todo.deadline != null)
//                                       Text(
//                                         "Deadline: ${todo.deadline!.toString().split(' ')[0]}",
//                                         style: TextStyle(fontSize: 14, color: Colors.grey),
//                                       ),
//                                     if (todo.priority != null)
//                                       Text(
//                                         "Priority: ${todo.priority}",
//                                         style: TextStyle(fontSize: 14, color: Colors.grey),
//                                       ),
//                                   ],
//                                 ),
//                               ),
//                             ),
//                           ),
//                         );
//                       },
//                     )
//                   ],
//                 ),
//               );
//             },
//           ),
//         ),
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: () {
//           showDialog(
//             context: context,
//             builder: ((context) => ToDoDialog(
//                   todoTitleController: todoTitleController,
//                   scheduleNotification: scheduleNotification,
//                 )),
//           );
//         },
//         child: const Icon(Icons.add),
//       ),
//     );
//   }
// }



// import 'package:flutter/material.dart';
// import 'package:flutter_local_notifications/flutter_local_notifications.dart';
// import 'package:awesome_notifications/awesome_notifications.dart';
// import 'package:shared_preferences/shared_preferences.dart';
// import 'package:to_do_app/TO%20DO/Model/todo_model.dart';
// import 'package:to_do_app/TO%20DO/Service/todo_database_service.dart';
// import 'package:to_do_app/TO%20DO/loader.dart';
// import 'package:to_do_app/TO%20DO/mytodo_dialog.dart';

// class TodoList extends StatefulWidget {
//   const TodoList({Key? key}) : super(key: key);

//   @override
//   State<TodoList> createState() => _TodoListState();
// }

// class _TodoListState extends State<TodoList> {
//   late SharedPreferences prefs;
//   bool _prefsLoaded = false;

//   @override
//   void initState() {
//     super.initState();
//     initSharedPreferences();
//   }

//   Future<void> initSharedPreferences() async {
//     try {
//       prefs = await SharedPreferences.getInstance();
//       setState(() {
//         _prefsLoaded = true;
//       });
//     } catch (e) {
//       // Handle initialization error
//       print('Failed to initialize SharedPreferences: $e');
//     }
//   }

//   Future<void> saveFilter(String filterType) async {
//     await prefs.setString('filterType', filterType);
//   }

//   String getFilter() {
//     return prefs.getString('filterType') ?? 'priorityHighToLow';
//   }

//   void toggleFilter() {
//     String currentFilter = getFilter();
//     String newFilter = currentFilter == 'priorityHighToLow' ? 'priorityLowToHigh' : 'priorityHighToLow';
//     saveFilter(newFilter);
//     setState(() {});
//   }

//   @override
//   Widget build(BuildContext context) {
//     if (!_prefsLoaded) {
//       return Scaffold(
//         body: Center(
//           child: CircularProgressIndicator(),
//         ),
//       );
//     }

//     return Scaffold(
//       backgroundColor: Colors.blue[200],
//       body: SingleChildScrollView(
//         child: SafeArea(
//           child: StreamBuilder<List<TodoModel>>(
//             stream: ToDoDatabaseService().listTodo(),
//             builder: (context, snapshot) {
//               if (!snapshot.hasData) {
//                 return const Loader();
//               }
//               List<TodoModel>? todoList = snapshot.data;
//               return Padding(
//                 padding: const EdgeInsets.all(25.0),
//                 child: Column(
//                   mainAxisAlignment: MainAxisAlignment.start,
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Row(
//                       children: [
//                         const Text(
//                           "My To Do",
//                           style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
//                         ),
//                         const Spacer(),
//                         IconButton(
//                           icon: Icon(Icons.filter_list),
//                           onPressed: toggleFilter,
//                         ),
//                       ],
//                     ),
//                     const SizedBox(height: 10),
//                     const Divider(color: Colors.white),
//                     const SizedBox(height: 20),
//                     ListView.builder(
//                       shrinkWrap: true,
//                       physics: NeverScrollableScrollPhysics(),
//                       itemCount: todoList!.length,
//                       itemBuilder: (context, index) {
//                         TodoModel todo = todoList[index];
//                         return Dismissible(
//                           key: Key(todo.uid),
//                           background: Container(
//                             alignment: Alignment.centerLeft,
//                             color: Colors.red,
//                             child: const Icon(Icons.delete),
//                           ),
//                           onDismissed: (direction) async {
//                             await ToDoDatabaseService().deleteTodo(todo.uid);
//                           },
//                           child: Padding(
//                             padding: const EdgeInsets.only(bottom: 20.0),
//                             child: Card(
//                               shape: RoundedRectangleBorder(
//                                 borderRadius: BorderRadius.circular(6),
//                               ),
//                               child: ListTile(
//                                 onTap: () {
//                                   bool newCompleteTask = !todo.isCompleted;
//                                   ToDoDatabaseService().updateTask(todo.uid, newCompleteTask);
//                                 },
//                                 leading: Container(
//                                   height: 25,
//                                   width: 25,
//                                   decoration: BoxDecoration(
//                                     color: Colors.purple,
//                                     shape: BoxShape.rectangle,
//                                   ),
//                                   child: todo.isCompleted
//                                       ? const Icon(
//                                           Icons.check,
//                                           color: Colors.white,
//                                         )
//                                       : Container(),
//                                 ),
//                                 title: Text(
//                                   todo.title,
//                                   style: const TextStyle(fontSize: 30),
//                                 ),
//                                 subtitle: Column(
//                                   crossAxisAlignment: CrossAxisAlignment.start,
//                                   children: [
//                                     if (todo.deadline != null)
//                                       Text(
//                                         "Deadline: ${todo.deadline!.toString().split(' ')[0]}",
//                                         style: TextStyle(fontSize: 14, color: Colors.grey),
//                                       ),
//                                     if (todo.priority != null)
//                                       Text(
//                                         "Priority: ${todo.priority}",
//                                         style: TextStyle(fontSize: 14, color: Colors.grey),
//                                       ),
//                                   ],
//                                 ),
//                               ),
//                             ),
//                           ),
//                         );
//                       },
//                     )
//                   ],
//                 ),
//               );
//             },
//           ),
//         ),
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: () {
//           showDialog(
//             context: context,
//             builder: ((context) => ToDoDialog(
//                   todoTitleController: TextEditingController(),
//                   scheduleNotification: scheduleNotification,
//                 )),
//           );
//         },
//         child: const Icon(Icons.add),
//       ),
//     );
//   }

//   void scheduleNotification(TodoModel todo) async {
//     if (todo.deadline != null) {
//       String notificationTitle = 'Task Reminder';
//       String notificationBody = todo.title;

//       DateTime scheduledDateTime = DateTime(
//         todo.deadline!.year,
//         todo.deadline!.month,
//         todo.deadline!.day,
//         14, // 2 PM
//         25, // 10 minutes
//       );

//       AwesomeNotifications().createNotification(
//         content: NotificationContent(
//           id: todo.uid.hashCode,
//           channelKey: 'basic_channel',
//           title: notificationTitle,
//           body: notificationBody,
//           notificationLayout: NotificationLayout.BigText,
//           payload: {'todoId': todo.uid},
//         ),
//         schedule: NotificationCalendar(
//           weekday: scheduledDateTime.weekday,
//           hour: scheduledDateTime.hour,
//           minute: scheduledDateTime.minute,
//           second: 0,
//           millisecond: 0,
//           repeats: false,
//         ),
//       );

//       print('Notification scheduled for: $scheduledDateTime');
//     }
//   }
// }
