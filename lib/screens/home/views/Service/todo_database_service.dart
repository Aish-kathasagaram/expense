// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:to_do_app/TO%20DO/Model/todo_model.dart';

// class ToDoDatabaseService{
//   CollectionReference toDoCollection = 
//     FirebaseFirestore.instance.collection("TodoList");
//   Stream<List<TodoModel>> ListTodo() {
//     return toDoCollection.orderBy("Timestamp", descending: true).snapshots().map(todoFromFirestore);
//   }
//   Future createNewTodo(String titie) async {
//     return await toDoCollection.add({
//       "title": titie,
//       "isCompleted": false,
//       "Timestamp": FieldValue.serverTimestamp(),
//     });
//   }
//   Future updateTask(uid, bool newCompleteTask) async {
//     await toDoCollection.doc(uid).update({"isComplete": newCompleteTask});
//   }
//   Future deleteTodo(uid) async {
//     await toDoCollection.doc(uid).delete();
//   }
//   List<TodoModel> todoFromFirestore(QuerySnapshot snapshot) {
//     return snapshot.docs.map((e) {
//       Map<String, dynamic>? data = e.data()
//       as  Map<String, dynamic>?;

//       return TodoModel(isCompleted: data?['isCompleted']??true,  title: data?['title']??"", uid: e.id);
//     }).toList();
//   }
// }

// todo_database_service.dart
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:to_do_app/TO%20DO/Model/todo_model.dart';

// class ToDoDatabaseService {
//   CollectionReference toDoCollection = 
//     FirebaseFirestore.instance.collection("TodoList");

//   Stream<List<TodoModel>> ListTodo() {
//     return toDoCollection.orderBy("Timestamp", descending: true).snapshots().map(todoFromFirestore);
//   }

//   Future createNewTodo(String title, DateTime deadline, int priority) async {
//     return await toDoCollection.add({
//       "title": title,
//       "isCompleted": false,
//       "deadline": deadline,
//       "priority": priority,
//       "Timestamp": FieldValue.serverTimestamp(),
//     });
//   }

//   Future updateTask(uid, bool newCompleteTask) async {
//     await toDoCollection.doc(uid).update({"isCompleted": newCompleteTask});
//   }

//   Future deleteTodo(uid) async {
//     await toDoCollection.doc(uid).delete();
//   }

//   List<TodoModel> todoFromFirestore(QuerySnapshot snapshot) {
//     return snapshot.docs.map((e) {
//       Map<String, dynamic>? data = e.data() as Map<String, dynamic>?;

//       return TodoModel(
//         uid: e.id,
//         title: data?['title'] ?? "",
//         isCompleted: data?['isCompleted'] ?? false,
//         deadline: data?['deadline']?.toDate(),
//         priority: data?['priority'],
//       );
//     }).toList();
//   }
// }


// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:mad_my_app/screens/home/views/Model/todo_model.dart';

// class ToDoDatabaseService {
//   final String userId;

//   ToDoDatabaseService(this.userId);

//   CollectionReference get toDoCollection =>
//       FirebaseFirestore.instance.collection("users").doc(userId).collection("tasks");
      

//   Stream<List<TodoModel>> listTodo({
//     required String orderBy,
//     required bool descending,
//   }) {
//     return toDoCollection
//         .orderBy(orderBy, descending: descending)
//         .snapshots()
//         .map(todoFromFirestore);
//   }

//   Future<void> createNewTodo(String title, DateTime deadline, int priority) async {
//     await toDoCollection.add({
//       "title": title,
//       "isCompleted": false,
//       "deadline": deadline,
//       "priority": priority,
//       "timestamp": FieldValue.serverTimestamp(),
//     });
//   }

//   Future<void> updateTask(String uid, bool newCompleteTask) async {
//     await toDoCollection.doc(uid).update({"isCompleted": newCompleteTask});
//   }

//   Future<void> deleteTodo(String uid) async {
//     await toDoCollection.doc(uid).delete();
//   }

//   List<TodoModel> todoFromFirestore(QuerySnapshot snapshot) {
//     return snapshot.docs.map((e) {
//       Map<String, dynamic>? data = e.data() as Map<String, dynamic>?;

//       return TodoModel(
//         uid: e.id,
//         title: data?['title'] ?? "",
//         isCompleted: data?['isCompleted'] ?? false,
//         deadline: data?['deadline']?.toDate(),
//         priority: data?['priority'],
//       );
//     }).toList();
//   }
// }
import 'dart:developer';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:mad_my_app/screens/home/views/Model/todo_model.dart';

class ToDoDatabaseService {
  final String userId;

  ToDoDatabaseService(this.userId) : assert(userId.isNotEmpty, 'userId must not be empty');

  CollectionReference get toDoCollection => FirebaseFirestore.instance
      .collection('users')
      .doc(userId)
      .collection('tasks');

  Future<void> createNewTodo(String title, DateTime deadline, int priority) async {
    try {
      await toDoCollection.add({
        "title": title,
        "isCompleted": false,
        "deadline": deadline,
        "priority": priority,
        "timestamp": FieldValue.serverTimestamp(),
      });
    } catch (e) {
      log(e.toString());
      rethrow;
    }
  }

  Future<void> updateTask(String uid, bool newCompleteTask) async {
    try {
      await toDoCollection.doc(uid).update({"isCompleted": newCompleteTask});
    } catch (e) {
      log(e.toString());
      rethrow;
    }
  }

  Future<void> deleteTodo(String uid) async {
    try {
      await toDoCollection.doc(uid).delete();
    } catch (e) {
      log(e.toString());
      rethrow;
    }
  }

  Stream<List<TodoModel>> listTodo({
    required String orderBy,
    required bool descending,
  }) {
    return toDoCollection
        .orderBy(orderBy, descending: descending)
        .snapshots()
        .map((snapshot) => snapshot.docs.map((doc) {
          Map<String, dynamic>? data = doc.data() as Map<String, dynamic>?;
          return TodoModel(
            uid: doc.id,
            title: data?['title'] ?? "",
            isCompleted: data?['isCompleted'] ?? false,
            deadline: data?['deadline']?.toDate(),
            priority: data?['priority'],
          );
        }).toList());
  }
}



// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:to_do_app/TO%20DO/Model/todo_model.dart';

// class ToDoDatabaseService {
//   final CollectionReference toDoCollection =
//       FirebaseFirestore.instance.collection("TodoList");

//   Stream<List<TodoModel>> listTodo() {
//     return toDoCollection
//         .orderBy("Timestamp", descending: true)
//         .snapshots()
//         .map((snapshot) => todoFromFirestore(snapshot));
//   }

//   Future<void> createNewTodo(
//       String title, DateTime deadline, int priority) async {
//     await toDoCollection.add({
//       "title": title,
//       "isCompleted": false,
//       "deadline": deadline,
//       "priority": priority,
//       "Timestamp": FieldValue.serverTimestamp(),
//     });
//   }

//   Future<void> updateTask(String uid, bool newCompleteTask) async {
//     await toDoCollection.doc(uid).update({"isCompleted": newCompleteTask});
//   }

//   Future<void> deleteTodo(String uid) async {
//     await toDoCollection.doc(uid).delete();
//   }

//   List<TodoModel> todoFromFirestore(QuerySnapshot snapshot) {
//     return snapshot.docs.map((doc) {
//       Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
//       return TodoModel(
//         uid: doc.id,
//         title: data['title'] ?? '',
//         isCompleted: data['isCompleted'] ?? false,
//         deadline: data['deadline']?.toDate(),
//         priority: data['priority'] ?? 1, // Default priority if not provided
//       );
//     }).toList();
//   }
// }
