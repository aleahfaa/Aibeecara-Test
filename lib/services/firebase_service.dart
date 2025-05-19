import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/todo_model.dart';

class FirebaseService {
  final CollectionReference todosCollection = FirebaseFirestore.instance
      .collection('aibeecara-todo');
  Stream<List<Todo>> getTodos() {
    return todosCollection
        .orderBy('timestamp', descending: true)
        .snapshots()
        .map((snapshot) {
          return snapshot.docs.map((doc) {
            return Todo.fromJson(doc.data() as Map<String, dynamic>, doc.id);
          }).toList();
        });
  }

  Future<void> addTodo(String title) {
    return todosCollection.add({
      'title': title,
      'isDone': false,
      'timestamp': Timestamp.now(),
    });
  }

  Future<void> updateTodoStatus(String id, bool isDone) {
    return todosCollection.doc(id).update({'isDone': isDone});
  }
}
