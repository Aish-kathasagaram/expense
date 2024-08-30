// import 'package:flutter/material.dart';
// import 'package:to_do_app/TO%20DO/Service/todo_database_service.dart';

// class ToDoDialog extends StatelessWidget {
//   const ToDoDialog({super.key, required this.todoTitleController});
//   final TextEditingController todoTitleController;

//   @override
//   Widget build(BuildContext context) {
//     return SimpleDialog(
//       contentPadding: const EdgeInsets.symmetric(horizontal: 24, vertical: 19),
//       backgroundColor: Colors.black,
//       shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
//       title: Row(
//         children: [
//           const Text(
//             "Add ToDo", 
//             style: TextStyle(fontSize: 21, fontWeight: FontWeight.bold, color: Colors.white),
//           ),
//           const Spacer(),
//           IconButton(onPressed: () {
//             Navigator.pop(context);
//           }, icon: const Icon(Icons.cancel, color: Colors.white,))
//         ],
//         ),
//         children: [
//           TextFormField(
//             controller: todoTitleController,
//             style: const TextStyle(fontSize: 20, color: Colors.white),
//             autofocus: true,
//             decoration: const InputDecoration(
//               hintText: "eg: Pay Akash for tea",
//               hintStyle: TextStyle(color: Colors.white)
//             ),
//           ),
//           const SizedBox(height: 20,),
//           SizedBox(
//             height: 40,
//             width: MediaQuery.of(context).size.width,
//             child: ElevatedButton(
//               onPressed: () async {
//                 if(todoTitleController.text.isNotEmpty) {
//                   await ToDoDatabaseService().createNewTodo(todoTitleController.text.trim());
//                 }
//                 Navigator.pop(context);
//                 todoTitleController.clear();
//               },
//               child: const Text("Add"),
//             ),
//           )
//         ],
//     );
//   }
// }

// // mytodo_dialog.dartimport 'package:flutter/material.dart';
// import 'package:flutter/material.dart';
// import 'package:mad_my_app/screens/home/views/Model/todo_model.dart';
// import 'package:mad_my_app/screens/home/views/Service/todo_database_service.dart';
// class ToDoDialog extends StatefulWidget {
//   const ToDoDialog({
//     Key? key,
//     required this.todoTitleController,
//     required this.scheduleNotification,
//     required this.userId,
//   }) : super(key: key);

//   final TextEditingController todoTitleController;
//   final Function(TodoModel) scheduleNotification;
//   final String userId;

//   @override
//   _ToDoDialogState createState() => _ToDoDialogState();
// }

// class _ToDoDialogState extends State<ToDoDialog> {
//   DateTime? _selectedDeadline;
//   int _selectedPriority = 1;

//   @override
//   Widget build(BuildContext context) {
//     return SimpleDialog(
//       contentPadding: const EdgeInsets.symmetric(horizontal: 24, vertical: 19),
//       backgroundColor: Colors.black,
//       shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
//       title: Row(
//         children: [
//           const Text(
//             "Add ToDo",
//             style: TextStyle(fontSize: 21, fontWeight: FontWeight.bold, color: Colors.white),
//           ),
//           const Spacer(),
//           IconButton(
//             onPressed: () {
//               Navigator.pop(context);
//             },
//             icon: const Icon(Icons.cancel, color: Colors.white),
//           )
//         ],
//       ),
//       children: [
//         TextFormField(
//           controller: widget.todoTitleController,
//           style: const TextStyle(fontSize: 20, color: Colors.white),
//           autofocus: true,
//           decoration: const InputDecoration(
//             hintText: "eg: Pay Akash for tea",
//             hintStyle: TextStyle(color: Colors.white),
//           ),
//         ),
//         const SizedBox(height: 20),
//         Row(
//           children: [
//             Expanded(
//               child: Text(
//                 _selectedDeadline == null
//                     ? 'No deadline chosen!'
//                     : 'Deadline: ${_selectedDeadline.toString().split(' ')[0]}',
//                 style: const TextStyle(color: Colors.white),
//               ),
//             ),
//             IconButton(
//               icon: const Icon(Icons.calendar_today, color: Colors.white),
//               onPressed: () async {
//                 DateTime? pickedDate = await showDatePicker(
//                   context: context,
//                   initialDate: DateTime.now(),
//                   firstDate: DateTime.now(),
//                   lastDate: DateTime(2101),
//                 );
//                 if (pickedDate != null) {
//                   setState(() {
//                     _selectedDeadline = pickedDate;
//                   });
//                 }
//               },
//             ),
//           ],
//         ),
//         const SizedBox(height: 20),
//         Row(
//           children: [
//             const Text(
//               'Priority:',
//               style: TextStyle(color: Colors.white),
//             ),
//             const Spacer(),
//             DropdownButton<int>(
//               value: _selectedPriority,
//               dropdownColor: Colors.black,
//               items: [1, 2, 3, 4, 5]
//                   .map((int value) {
//                     return DropdownMenuItem<int>(
//                       value: value,
//                       child: Text(
//                         value.toString(),
//                         style: const TextStyle(color: Colors.white),
//                       ),
//                     );
//                   })
//                   .toList(),
//               onChanged: (int? newValue) {
//                 setState(() {
//                   _selectedPriority = newValue!;
//                 });
//               },
//             ),
//           ],
//         ),
//         const SizedBox(height: 20),
//         SizedBox(
//           height: 40,
//           width: MediaQuery.of(context).size.width,
//           child: ElevatedButton(
//             onPressed: () async {
//               if (widget.todoTitleController.text.isNotEmpty) {
//                 String uid = DateTime.now().millisecondsSinceEpoch.toString(); // Generate a unique ID
//                 var newTodo = TodoModel(
//                   uid: uid,
//                   title: widget.todoTitleController.text.trim(),
//                   isCompleted: false,
//                   deadline: _selectedDeadline,
//                   priority: _selectedPriority,
//                 );

//                 // Save new todo to database
//                 await ToDoDatabaseService(widget.userId).createNewTodo(
//                   newTodo.title,
//                   newTodo.deadline!,
//                   newTodo.priority!,
//                 );

//                 // Schedule local notification
//                 widget.scheduleNotification(newTodo);

//                 Navigator.pop(context);
//                 widget.todoTitleController.clear();
//               }
//             },
//             child: const Text("Add"),
//           ),
//         )
//       ],
//     );
//   }
// }


import 'package:flutter/material.dart';
import 'package:mad_my_app/screens/home/views/Model/todo_model.dart';
import 'package:mad_my_app/screens/home/views/Service/todo_database_service.dart';

class ToDoDialog extends StatefulWidget {
  const ToDoDialog({
    Key? key,
    required this.todoTitleController,
    required this.scheduleNotification,
    required this.userId,
  }) : super(key: key);

  final TextEditingController todoTitleController;
  final Function(TodoModel) scheduleNotification;
  final String userId;

  @override
  _ToDoDialogState createState() => _ToDoDialogState();
}

class _ToDoDialogState extends State<ToDoDialog> {
  DateTime? _selectedDeadline;
  int _selectedPriority = 1;

  @override
  Widget build(BuildContext context) {
    return SimpleDialog(
      contentPadding: const EdgeInsets.symmetric(horizontal: 24, vertical: 19),
      backgroundColor: Colors.black,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      title: Row(
        children: [
          const Text(
            "Add ToDo",
            style: TextStyle(fontSize: 21, fontWeight: FontWeight.bold, color: Colors.white),
          ),
          const Spacer(),
          IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(Icons.cancel, color: Colors.white),
          )
        ],
      ),
      children: [
        TextFormField(
          controller: widget.todoTitleController,
          style: const TextStyle(fontSize: 20, color: Colors.white),
          autofocus: true,
          decoration: const InputDecoration(
            hintText: "eg: Pay Akash for tea",
            hintStyle: TextStyle(color: Colors.white),
          ),
        ),
        const SizedBox(height: 20),
        Row(
          children: [
            Expanded(
              child: Text(
                _selectedDeadline == null
                    ? 'No deadline chosen!'
                    : 'Deadline: ${_selectedDeadline.toString().split(' ')[0]}',
                style: const TextStyle(color: Colors.white),
              ),
            ),
            IconButton(
              icon: const Icon(Icons.calendar_today, color: Colors.white),
              onPressed: () async {
                DateTime? pickedDate = await showDatePicker(
                  context: context,
                  initialDate: DateTime.now(),
                  firstDate: DateTime.now(),
                  lastDate: DateTime(2101),
                );
                if (pickedDate != null) {
                  setState(() {
                    _selectedDeadline = pickedDate;
                  });
                }
              },
            ),
          ],
        ),
        const SizedBox(height: 20),
        Row(
          children: [
            const Text(
              'Priority:',
              style: TextStyle(color: Colors.white),
            ),
            const Spacer(),
            DropdownButton<int>(
              value: _selectedPriority,
              dropdownColor: Colors.black,
              items: [1, 2, 3, 4, 5]
                  .map((int value) {
                    return DropdownMenuItem<int>(
                      value: value,
                      child: Text(
                        value.toString(),
                        style: const TextStyle(color: Colors.white),
                      ),
                    );
                  })
                  .toList(),
              onChanged: (int? newValue) {
                setState(() {
                  _selectedPriority = newValue!;
                });
              },
            ),
          ],
        ),
        const SizedBox(height: 20),
        SizedBox(
          height: 40,
          width: MediaQuery.of(context).size.width,
          child: ElevatedButton(
            onPressed: () async {
              if (widget.todoTitleController.text.isNotEmpty) {
                String uid = DateTime.now().millisecondsSinceEpoch.toString(); // Generate a unique ID
                var newTodo = TodoModel(
                  uid: uid,
                  title: widget.todoTitleController.text.trim(),
                  isCompleted: false,
                  deadline: _selectedDeadline,
                  priority: _selectedPriority,
                );

                // Save new todo to database
                await ToDoDatabaseService(widget.userId).createNewTodo(
                  newTodo.title,
                  newTodo.deadline!,
                  newTodo.priority!,
                );

                // Schedule local notification
                widget.scheduleNotification(newTodo);

                Navigator.pop(context);
                widget.todoTitleController.clear();
              }
            },
            child: const Text("Add"),
          ),
        )
      ],
    );
  }
}

// // mytodo_dialog.dartimport 'package:flutter/material.dart';
// import 'package:flutter/material.dart';
// import 'package:mad_my_app/screens/home/views/Model/todo_model.dart';
// import 'package:mad_my_app/screens/home/views/Service/todo_database_service.dart';

// class ToDoDialog extends StatefulWidget {
//   const ToDoDialog({
//     super.key,
//     required this.todoTitleController,
//     required this.scheduleNotification,
//     required this.userId,
//   });

//   final TextEditingController todoTitleController;
//   final Function(TodoModel) scheduleNotification;
//   final String userId;

//   @override
//   _ToDoDialogState createState() => _ToDoDialogState();
// }

// class _ToDoDialogState extends State<ToDoDialog> {
//   DateTime? _selectedDeadline;
//   int _selectedPriority = 1;

//   @override
//   Widget build(BuildContext context) {
//     return SimpleDialog(
//       contentPadding: const EdgeInsets.symmetric(horizontal: 24, vertical: 19),
//       backgroundColor: Colors.black,
//       shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
//       title: Row(
//         children: [
//           const Text(
//             "Add ToDo",
//             style: TextStyle(fontSize: 21, fontWeight: FontWeight.bold, color: Colors.white),
//           ),
//           const Spacer(),
//           IconButton(
//             onPressed: () {
//               Navigator.pop(context);
//             },
//             icon: const Icon(Icons.cancel, color: Colors.white),
//           )
//         ],
//       ),
//       children: [
//         TextFormField(
//           controller: widget.todoTitleController,
//           style: const TextStyle(fontSize: 20, color: Colors.white),
//           autofocus: true,
//           decoration: const InputDecoration(
//             hintText: "eg: Pay Akash for tea",
//             hintStyle: TextStyle(color: Colors.white),
//           ),
//         ),
//         const SizedBox(height: 20),
//         Row(
//           children: [
//             Expanded(
//               child: Text(
//                 _selectedDeadline == null
//                     ? 'No deadline chosen!'
//                     : 'Deadline: ${_selectedDeadline.toString().split(' ')[0]}',
//                 style: const TextStyle(color: Colors.white),
//               ),
//             ),
//             IconButton(
//               icon: const Icon(Icons.calendar_today, color: Colors.white),
//               onPressed: () async {
//                 DateTime? pickedDate = await showDatePicker(
//                   context: context,
//                   initialDate: DateTime.now(),
//                   firstDate: DateTime.now(),
//                   lastDate: DateTime(2101),
//                 );
//                 if (pickedDate != null) {
//                   setState(() {
//                     _selectedDeadline = pickedDate;
//                   });
//                 }
//               },
//             ),
//           ],
//         ),
//         const SizedBox(height: 20),
//         Row(
//           children: [
//             const Text(
//               'Priority:',
//               style: TextStyle(color: Colors.white),
//             ),
//             const Spacer(),
//             DropdownButton<int>(
//               value: _selectedPriority,
//               dropdownColor: Colors.black,
//               items: [1, 2, 3, 4, 5]
//                   .map((int value) {
//                     return DropdownMenuItem<int>(
//                       value: value,
//                       child: Text(
//                         value.toString(),
//                         style: const TextStyle(color: Colors.white),
//                       ),
//                     );
//                   })
//                   .toList(),
//               onChanged: (int? newValue) {
//                 setState(() {
//                   _selectedPriority = newValue!;
//                 });
//               },
//             ),
//           ],
//         ),
//         const SizedBox(height: 20),
//         SizedBox(
//           height: 40,
//           width: MediaQuery.of(context).size.width,
//           child: ElevatedButton(
//             onPressed: () async {
//               if (widget.todoTitleController.text.isNotEmpty) {
//                 String uid = DateTime.now().millisecondsSinceEpoch.toString(); // Generate a unique ID
//                 var newTodo = TodoModel(
//                   uid: uid,
//                   title: widget.todoTitleController.text.trim(),
//                   isCompleted: false,
//                   deadline: _selectedDeadline,
//                   priority: _selectedPriority,
//                 );

//                 // Save new todo to database
//                 await ToDoDatabaseService(widget.userId).createNewTodo(
//                   newTodo.title,
//                   newTodo.deadline!,
//                   newTodo.priority!,
//                 );

//                 // Schedule local notification
//                 widget.scheduleNotification(newTodo);

//                 Navigator.pop(context);
//                 widget.todoTitleController.clear();
//               }
//             },
//             child: const Text("Add"),
//           ),
//         )
//       ],
//     );
//   }
// }







// import 'package:flutter/material.dart';
// import 'package:to_do_app/TO%20DO/Model/todo_model.dart';
// import 'package:to_do_app/TO%20DO/Service/todo_database_service.dart';
// import 'package:awesome_notifications/awesome_notifications.dart';

// class ToDoDialog extends StatefulWidget {
//   const ToDoDialog({
//     super.key,
//     required this.todoTitleController,
//     required this.scheduleNotification,
//   });

//   final TextEditingController todoTitleController;
//   final Function(TodoModel) scheduleNotification;

//   @override
//   _ToDoDialogState createState() => _ToDoDialogState();
// }

// class _ToDoDialogState extends State<ToDoDialog> {
//   DateTime? _selectedDeadline;
//   int _selectedPriority = 1; // Default priority

//   @override
//   Widget build(BuildContext context) {
//     return SimpleDialog(
//       contentPadding: const EdgeInsets.symmetric(horizontal: 24, vertical: 19),
//       backgroundColor: Colors.black,
//       shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
//       title: Row(
//         children: [
//           const Text(
//             "Add ToDo",
//             style: TextStyle(fontSize: 21, fontWeight: FontWeight.bold, color: Colors.white),
//           ),
//           const Spacer(),
//           IconButton(
//             onPressed: () {
//               Navigator.pop(context);
//             },
//             icon: const Icon(Icons.cancel, color: Colors.white),
//           )
//         ],
//       ),
//       children: [
//         TextFormField(
//           controller: widget.todoTitleController,
//           style: const TextStyle(fontSize: 20, color: Colors.white),
//           autofocus: true,
//           decoration: const InputDecoration(
//             hintText: "eg: Pay Akash for tea",
//             hintStyle: TextStyle(color: Colors.white),
//           ),
//         ),
//         const SizedBox(height: 20),
//         Row(
//           children: [
//             Expanded(
//               child: Text(
//                 _selectedDeadline == null
//                     ? 'No deadline chosen!'
//                     : 'Deadline: ${_selectedDeadline.toString().split(' ')[0]}',
//                 style: TextStyle(color: Colors.white),
//               ),
//             ),
//             IconButton(
//               icon: Icon(Icons.calendar_today, color: Colors.white),
//               onPressed: () async {
//                 DateTime? pickedDate = await showDatePicker(
//                   context: context,
//                   initialDate: DateTime.now(),
//                   firstDate: DateTime.now(),
//                   lastDate: DateTime(2101),
//                 );
//                 if (pickedDate != null) {
//                   setState(() {
//                     _selectedDeadline = pickedDate;
//                   });
//                 }
//               },
//             ),
//           ],
//         ),
//         const SizedBox(height: 20),
//         Row(
//           children: [
//             Text(
//               'Priority:',
//               style: TextStyle(color: Colors.white),
//             ),
//             Spacer(),
//             DropdownButton<int>(
//               value: _selectedPriority,
//               dropdownColor: Colors.black,
//               items: [1, 2, 3, 4, 5]
//                   .map((int value) {
//                     return DropdownMenuItem<int>(
//                       value: value,
//                       child: Text(
//                         value.toString(),
//                         style: TextStyle(color: Colors.white),
//                       ),
//                     );
//                   })
//                   .toList(),
//               onChanged: (int? newValue) {
//                 if (newValue != null) {
//                   setState(() {
//                     _selectedPriority = newValue;
//                   });
//                 }
//               },
//             ),
//           ],
//         ),
//         const SizedBox(height: 20),
//         SizedBox(
//           height: 40,
//           width: MediaQuery.of(context).size.width,
//           child: ElevatedButton(
//             onPressed: () async {
//               if (widget.todoTitleController.text.isNotEmpty) {
//                 String uid = DateTime.now().millisecondsSinceEpoch.toString(); // Generate a unique ID
//                 var newTodo = TodoModel(
//                   uid: uid,
//                   title: widget.todoTitleController.text.trim(),
//                   isCompleted: false,
//                   deadline: _selectedDeadline,
//                   priority: _selectedPriority, // Ensure priority is passed as int
//                 );

//                 // Create notification content
//                 String notificationTitle = 'Task Reminder';
//                 String notificationBody = newTodo.title;

//                 // Calculate the notification schedule time
//                 DateTime scheduledDateTime = DateTime(
//                   newTodo.deadline!.year,
//                   newTodo.deadline!.month,
//                   newTodo.deadline!.day,
//                   14, // 12 PM
//                   25, // 10 minutes
//                 );

//                 // Schedule notification with Awesome Notifications
//                 AwesomeNotifications().createNotification(
//                   content: NotificationContent(
//                     id: uid.hashCode,
//                     channelKey: 'basic_channel', // Channel key from initialization
//                     title: notificationTitle,
//                     body: notificationBody,
//                     notificationLayout: NotificationLayout.BigText,
//                     payload: {'todoId': newTodo.uid}, // Pass uid instead of id
//                   ),
//                   schedule: NotificationCalendar(
//                     weekday: scheduledDateTime.weekday,
//                     hour: scheduledDateTime.hour,
//                     minute: scheduledDateTime.minute,
//                     second: 0,
//                     millisecond: 0,
//                     repeats: false, // Set to true for recurring notifications
//                   ),
//                 );

//                 // Save new todo to database
//                 await ToDoDatabaseService().createNewTodo(
//                   newTodo.title,
//                   newTodo.deadline!,
//                   newTodo.priority!, // Ensure priority is passed as int
//                 );

//                 // Schedule local notification
//                 widget.scheduleNotification(newTodo);

//                 Navigator.pop(context);
//                 widget.todoTitleController.clear();
//               }
//             },
//             child: const Text("Add"),
//           ),
//         )
//       ],
//     );
//   }
// }






// import 'package:flutter/material.dart';
// import 'package:to_do_app/TO%20DO/Model/todo_model.dart';
// import 'package:to_do_app/TO%20DO/Service/todo_database_service.dart';
// import 'package:awesome_notifications/awesome_notifications.dart';

// class ToDoDialog extends StatefulWidget {
//   const ToDoDialog({
//     Key? key,
//     required this.todoTitleController,
//     required this.scheduleNotification,
//   }) : super(key: key);

//   final TextEditingController todoTitleController;
//   final Function(TodoModel) scheduleNotification;

//   @override
//   _ToDoDialogState createState() => _ToDoDialogState();
// }

// class _ToDoDialogState extends State<ToDoDialog> {
//   DateTime? _selectedDeadline;
//   int _selectedPriority = 1; // Default priority

//   @override
//   Widget build(BuildContext context) {
//     return SimpleDialog(
//       contentPadding: const EdgeInsets.symmetric(horizontal: 24, vertical: 19),
//       backgroundColor: Colors.black,
//       shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
//       title: Row(
//         children: [
//           const Text(
//             "Add ToDo",
//             style: TextStyle(fontSize: 21, fontWeight: FontWeight.bold, color: Colors.white),
//           ),
//           const Spacer(),
//           IconButton(
//             onPressed: () {
//               Navigator.pop(context);
//             },
//             icon: const Icon(Icons.cancel, color: Colors.white),
//           )
//         ],
//       ),
//       children: [
//         TextFormField(
//           controller: widget.todoTitleController,
//           style: const TextStyle(fontSize: 20, color: Colors.white),
//           autofocus: true,
//           decoration: const InputDecoration(
//             hintText: "eg: Pay Akash for tea",
//             hintStyle: TextStyle(color: Colors.white),
//           ),
//         ),
//         const SizedBox(height: 20),
//         Row(
//           children: [
//             Expanded(
//               child: Text(
//                 _selectedDeadline == null
//                     ? 'No deadline chosen!'
//                     : 'Deadline: ${_selectedDeadline!.toString().split(' ')[0]}',
//                 style: TextStyle(color: Colors.white),
//               ),
//             ),
//             IconButton(
//               icon: Icon(Icons.calendar_today, color: Colors.white),
//               onPressed: () async {
//                 DateTime? pickedDate = await showDatePicker(
//                   context: context,
//                   initialDate: DateTime.now(),
//                   firstDate: DateTime.now(),
//                   lastDate: DateTime(2101),
//                 );
//                 if (pickedDate != null) {
//                   setState(() {
//                     _selectedDeadline = pickedDate;
//                   });
//                 }
//               },
//             ),
//           ],
//         ),
//         const SizedBox(height: 20),
//         Row(
//           children: [
//             Text(
//               'Priority:',
//               style: TextStyle(color: Colors.white),
//             ),
//             Spacer(),
//             DropdownButton<int>(
//               value: _selectedPriority,
//               dropdownColor: Colors.black,
//               items: [1, 2, 3, 4, 5].map((int value) {
//                 return DropdownMenuItem<int>(
//                   value: value,
//                   child: Text(
//                     value.toString(),
//                     style: TextStyle(color: Colors.white),
//                   ),
//                 );
//               }).toList(),
//               onChanged: (int? newValue) {
//                 if (newValue != null) {
//                   setState(() {
//                     _selectedPriority = newValue;
//                   });
//                 }
//               },
//             ),
//           ],
//         ),
//         const SizedBox(height: 20),
//         SizedBox(
//           height: 40,
//           width: MediaQuery.of(context).size.width,
//           child: ElevatedButton(
//             onPressed: () async {
//               if (widget.todoTitleController.text.isNotEmpty) {
//                 String uid = DateTime.now().millisecondsSinceEpoch.toString(); // Generate a unique ID
//                 var newTodo = TodoModel(
//                   uid: uid,
//                   title: widget.todoTitleController.text.trim(),
//                   isCompleted: false,
//                   deadline: _selectedDeadline,
//                   priority: _selectedPriority,
//                 );

//                 // Create notification content
//                 String notificationTitle = 'Task Reminder';
//                 String notificationBody = newTodo.title;

//                 // Schedule notification with Awesome Notifications
//                 DateTime scheduledDateTime = DateTime(
//                   newTodo.deadline!.year,
//                   newTodo.deadline!.month,
//                   newTodo.deadline!.day,
//                   14, // 12 PM
//                   25, // 10 minutes
//                 );

//                 AwesomeNotifications().createNotification(
//                   content: NotificationContent(
//                     id: uid.hashCode,
//                     channelKey: 'basic_channel',
//                     title: notificationTitle,
//                     body: notificationBody,
//                     notificationLayout: NotificationLayout.BigText,
//                     payload: {'todoId': newTodo.uid},
//                   ),
//                   schedule: NotificationCalendar(
//                     weekday: scheduledDateTime.weekday,
//                     hour: scheduledDateTime.hour,
//                     minute: scheduledDateTime.minute,
//                     second: 0,
//                     millisecond: 0,
//                     repeats: false,
//                   ),
//                 );

//                 // Save new todo to database
//                 await ToDoDatabaseService().createNewTodo(
//                   newTodo.title,
//                   newTodo.deadline!,
//                   newTodo.priority,
//                 );

//                 // Schedule local notification
//                 widget.scheduleNotification(newTodo);

//                 Navigator.pop(context);
//                 widget.todoTitleController.clear();
//               }
//             },
//             child: const Text("Add"),
//           ),
//         )
//       ],
//     );
//   }
// }








// import 'package:flutter/material.dart';
// import 'package:to_do_app/TO%20DO/Model/todo_model.dart';
// import 'package:to_do_app/TO%20DO/Service/todo_database_service.dart';
// import 'package:awesome_notifications/awesome_notifications.dart';

// class ToDoDialog extends StatefulWidget {
//   const ToDoDialog({
//     Key? key,
//     required this.todoTitleController,
//     required this.scheduleNotification,
//   }) : super(key: key);

//   final TextEditingController todoTitleController;
//   final Function(TodoModel) scheduleNotification;

//   @override
//   _ToDoDialogState createState() => _ToDoDialogState();
// }

// class _ToDoDialogState extends State<ToDoDialog> {
//   DateTime? _selectedDeadline;
//   int _selectedPriority = 1;

//   @override
//   Widget build(BuildContext context) {
//     return SimpleDialog(
//       contentPadding: const EdgeInsets.symmetric(horizontal: 24, vertical: 19),
//       backgroundColor: Colors.black,
//       shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
//       title: Row(
//         children: [
//           const Text(
//             "Add ToDo",
//             style: TextStyle(fontSize: 21, fontWeight: FontWeight.bold, color: Colors.white),
//           ),
//           const Spacer(),
//           IconButton(
//             onPressed: () {
//               Navigator.pop(context);
//             },
//             icon: const Icon(Icons.cancel, color: Colors.white),
//           )
//         ],
//       ),
//       children: [
//         TextFormField(
//           controller: widget.todoTitleController,
//           style: const TextStyle(fontSize: 20, color: Colors.white),
//           autofocus: true,
//           decoration: const InputDecoration(
//             hintText: "eg: Pay Akash for tea",
//             hintStyle: TextStyle(color: Colors.white),
//           ),
//         ),
//         const SizedBox(height: 20),
//         Row(
//           children: [
//             Expanded(
//               child: Text(
//                 _selectedDeadline == null
//                     ? 'No deadline chosen!'
//                     : 'Deadline: ${_selectedDeadline.toString().split(' ')[0]}',
//                 style: TextStyle(color: Colors.white),
//               ),
//             ),
//             IconButton(
//               icon: Icon(Icons.calendar_today, color: Colors.white),
//               onPressed: () async {
//                 DateTime? pickedDate = await showDatePicker(
//                   context: context,
//                   initialDate: DateTime.now(),
//                   firstDate: DateTime.now(),
//                   lastDate: DateTime(2101),
//                 );
//                 if (pickedDate != null) {
//                   setState(() {
//                     _selectedDeadline = pickedDate;
//                   });
//                 }
//               },
//             ),
//           ],
//         ),
//         const SizedBox(height: 20),
//         Row(
//           children: [
//             Text(
//               'Priority:',
//               style: TextStyle(color: Colors.white),
//             ),
//             Spacer(),
//             DropdownButton<int>(
//               value: _selectedPriority,
//               dropdownColor: Colors.black,
//               items: [1, 2, 3, 4, 5]
//                   .map((int value) {
//                     return DropdownMenuItem<int>(
//                       value: value,
//                       child: Text(
//                         value.toString(),
//                         style: TextStyle(color: Colors.white),
//                       ),
//                     );
//                   })
//                   .toList(),
//               onChanged: (int? newValue) {
//                 setState(() {
//                   _selectedPriority = newValue!;
//                 });
//               },
//             ),
//           ],
//         ),
//         const SizedBox(height: 20),
//         SizedBox(
//           height: 40,
//           width: MediaQuery.of(context).size.width,
//           child: ElevatedButton(
//             onPressed: () async {
//               if (widget.todoTitleController.text.isNotEmpty) {
//                 String uid = DateTime.now().millisecondsSinceEpoch.toString(); // Generate a unique ID
//                 var newTodo = TodoModel(
//                   uid: uid,
//                   title: widget.todoTitleController.text.trim(),
//                   isCompleted: false,
//                   deadline: _selectedDeadline,
//                   priority: _selectedPriority,
//                 );

//                 // Create notification content
//                 String notificationTitle = 'Task Reminder';
//                 String notificationBody = newTodo.title;

//                 // Calculate the notification schedule time
//                 DateTime scheduledDateTime = DateTime(
//                   newTodo.deadline!.year,
//                   newTodo.deadline!.month,
//                   newTodo.deadline!.day,
//                   14, // 2 PM
//                   25, // 10 minutes
//                 );

//                 // Schedule notification with Awesome Notifications
//                 AwesomeNotifications().createNotification(
//                   content: NotificationContent(
//                     id: uid.hashCode,
//                     channelKey: 'basic_channel', // Channel key from initialization
//                     title: notificationTitle,
//                     body: notificationBody,
//                     notificationLayout: NotificationLayout.BigText,
//                     payload: {'todoId': newTodo.uid}, // Pass uid instead of id
//                   ),
//                   schedule: NotificationCalendar(
//                     weekday: scheduledDateTime.weekday,
//                     hour: scheduledDateTime.hour,
//                     minute: scheduledDateTime.minute,
//                     second: 0,
//                     millisecond: 0,
//                     repeats: false, // Set to true for recurring notifications
//                   ),
//                 );

//                 // Save new todo to database
//                 await ToDoDatabaseService().createNewTodo(
//                   newTodo.title,
//                   newTodo.deadline!,
//                   newTodo.priority!,
//                 );

//                 // Schedule local notification
//                 widget.scheduleNotification(newTodo);

//                 Navigator.pop(context);
//                 widget.todoTitleController.clear();
//               }
//             },
//             child: const Text("Add"),
//           ),
//         )
//       ],
//     );
//   }
// }







// import 'package:awesome_notifications/awesome_notifications.dart';
// import 'package:flutter/material.dart';
// import 'package:to_do_app/TO%20DO/Model/todo_model.dart';
// import 'package:to_do_app/TO%20DO/Service/todo_database_service.dart';

// class ToDoDialog extends StatefulWidget {
//   const ToDoDialog({
//     super.key,
//     required this.todoTitleController,
//     required this.scheduleNotification,
//   });

//   final TextEditingController todoTitleController;
//   final Function(TodoModel) scheduleNotification;

//   @override
//   _ToDoDialogState createState() => _ToDoDialogState();
// }

// class _ToDoDialogState extends State<ToDoDialog> {
//   DateTime? _selectedDeadline;
//   int _selectedPriority = 1;

//   @override
//   Widget build(BuildContext context) {
//     return SimpleDialog(
//       contentPadding: const EdgeInsets.symmetric(horizontal: 24, vertical: 19),
//       backgroundColor: Colors.black,
//       shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
//       title: Row(
//         children: [
//           const Text(
//             "Add ToDo",
//             style: TextStyle(fontSize: 21, fontWeight: FontWeight.bold, color: Colors.white),
//           ),
//           const Spacer(),
//           IconButton(
//             onPressed: () {
//               Navigator.pop(context);
//             },
//             icon: const Icon(Icons.cancel, color: Colors.white),
//           )
//         ],
//       ),
//       children: [
//         TextFormField(
//           controller: widget.todoTitleController,
//           style: const TextStyle(fontSize: 20, color: Colors.white),
//           autofocus: true,
//           decoration: const InputDecoration(
//             hintText: "eg: Pay Akash for tea",
//             hintStyle: TextStyle(color: Colors.white),
//           ),
//         ),
//         const SizedBox(height: 20),
//         Row(
//           children: [
//             Expanded(
//               child: Text(
//                 _selectedDeadline == null
//                     ? 'No deadline chosen!'
//                     : 'Deadline: ${_selectedDeadline.toString().split(' ')[0]}',
//                 style: TextStyle(color: Colors.white),
//               ),
//             ),
//             IconButton(
//               icon: Icon(Icons.calendar_today, color: Colors.white),
//               onPressed: () async {
//                 DateTime? pickedDate = await showDatePicker(
//                   context: context,
//                   initialDate: DateTime.now(),
//                   firstDate: DateTime.now(),
//                   lastDate: DateTime(2101),
//                 );
//                 if (pickedDate != null) {
//                   setState(() {
//                     _selectedDeadline = pickedDate;
//                   });
//                 }
//               },
//             ),
//           ],
//         ),
//         const SizedBox(height: 20),
//         Row(
//           children: [
//             Text(
//               'Priority:',
//               style: TextStyle(color: Colors.white),
//             ),
//             Spacer(),
//             DropdownButton<int>(
//               value: _selectedPriority,
//               dropdownColor: Colors.black,
//               items: [1, 2, 3, 4, 5]
//                   .map((int value) {
//                     return DropdownMenuItem<int>(
//                       value: value,
//                       child: Text(
//                         value.toString(),
//                         style: TextStyle(color: Colors.white),
//                       ),
//                     );
//                   })
//                   .toList(),
//               onChanged: (int? newValue) {
//                 setState(() {
//                   _selectedPriority = newValue!;
//                 });
//               },
//             ),
//           ],
//         ),
//         const SizedBox(height: 20),
//         SizedBox(
//           height: 40,
//           width: MediaQuery.of(context).size.width,
//           child: ElevatedButton(
//             onPressed: () async {
//               if (widget.todoTitleController.text.isNotEmpty) {
//                 String uid = DateTime.now().millisecondsSinceEpoch.toString(); // Generate a unique ID
//                 var newTodo = TodoModel(
//                   uid: uid,
//                   title: widget.todoTitleController.text.trim(),
//                   isCompleted: false,
//                   deadline: _selectedDeadline,
//                   priority: _selectedPriority,
//                 );

//                 // Create notification content
//                 String notificationTitle = 'Task Reminder';
//                 String notificationBody = newTodo.title;

//                 // Schedule notification with Awesome Notifications
//                 AwesomeNotifications().createNotification(
//                   content: NotificationContent(
//                     id: uid.hashCode,
//                     channelKey: 'basic_channel', // Channel key from initialization
//                     title: notificationTitle,
//                     body: notificationBody,
//                     notificationLayout: NotificationLayout.BigText,
//                     payload: {'todoId': newTodo.uid}, // Pass uid instead of id
//                   ),
//                   schedule: NotificationCalendar(
//                     weekday: newTodo.deadline!.weekday,
//                     hour: newTodo.deadline!.hour,
//                     minute: newTodo.deadline!.minute,
//                     second: 0,
//                     millisecond: 0,
//                     repeats: false, // Set to true for recurring notifications
//                   ),
//                 );

//                 // Save new todo to database
//                 await ToDoDatabaseService().createNewTodo(
//                   newTodo.title,
//                   newTodo.deadline!,
//                   newTodo.priority!,
//                 );

//                 Navigator.pop(context);
//                 widget.todoTitleController.clear();
//               }
//             },
//             child: const Text("Add"),
//           ),
//         )
//       ],
//     );
//   }
// }
