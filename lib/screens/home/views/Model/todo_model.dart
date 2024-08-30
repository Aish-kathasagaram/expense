// class TodoModel{
//   String uid;
//   String title;
//   bool isCompleted;
//   TodoModel(
//     {
//       required this.uid,
//       required this.isCompleted,
//       required this.title,
//     }
//   );
// }

//todo_model.dart
// class TodoModel {
//   String uid;
//   String title;
//   bool isCompleted;
//   DateTime? deadline;
//   int? priority;

//   TodoModel({
//     required this.uid,
//     required this.title,
//     required this.isCompleted,
//     this.deadline,
//     this.priority,
//   });
// }





// class TodoModel {
//   String uid;
//   String title;
//   bool isCompleted;
//   DateTime? deadline;
//   String? priority;

//   TodoModel({
//     required this.uid,
//     required this.title,
//     this.isCompleted = false,
//     this.deadline,
//     this.priority,
//   });
  

class TodoModel {
  String uid;
  String title;
  bool isCompleted;
  DateTime? deadline;
  int priority;

  TodoModel({
    required this.uid,
    required this.title,
    required this.isCompleted,
    this.deadline,
    required this.priority,
  });


  factory TodoModel.fromJson(Map<String, dynamic> json, String documentId) {
    return TodoModel(
      uid: documentId,
      title: json['title'],
      isCompleted: json['isCompleted'],
      deadline: json['deadline'] != null ? DateTime.parse(json['deadline']) : null,
      priority: json['priority'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'isCompleted': isCompleted,
      'deadline': deadline?.toIso8601String(),
      'priority': priority,
    };
  }
}

