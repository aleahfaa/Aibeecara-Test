import 'package:cloud_firestore/cloud_firestore.dart';

class Todo {
  String id;
  String title;
  bool isDone;
  DateTime timestamp;
  Todo({
    required this.id,
    required this.title,
    required this.isDone,
    required this.timestamp,
  });
  factory Todo.fromJson(Map<String, dynamic> json, String documentId) {
    return Todo(
      id: documentId,
      title: json['title'] ?? '',
      isDone: json['isDone'] ?? false,
      timestamp:
          (json['timestamp'] != null)
              ? (json['timestamp'] as Timestamp).toDate()
              : DateTime.now(),
    );
  }
  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'isDone': isDone,
      'timestamp': Timestamp.fromDate(timestamp),
    };
  }
}
