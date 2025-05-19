import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../models/todo_model.dart';
import '../services/firebase_service.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final FirebaseService _firebaseService = FirebaseService();
  final TextEditingController _todoController = TextEditingController();
  final DateFormat formatter = DateFormat("dd MMM yyyy, HH:mm");
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Todo')),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _todoController,
                    decoration: InputDecoration(
                      hintText: 'Tambahkan Tugas (Add Assignment)',
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                SizedBox(width: 10),
                ElevatedButton(
                  onPressed: () {
                    if (_todoController.text.isNotEmpty) {
                      _firebaseService.addTodo(_todoController.text);
                      _todoController.clear();
                    }
                  },
                  child: Text('Tambah (Add)'),
                ),
              ],
            ),
          ),
          Expanded(
            child: StreamBuilder<List<Todo>>(
              stream: _firebaseService.getTodos(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(child: CircularProgressIndicator());
                }
                if (snapshot.hasData || snapshot.data!.isEmpty) {
                  return Center(child: Text('Tidak ada tugas (No Assignment)'));
                }
                return ListView.builder(
                  itemCount: snapshot.data!.length,
                  itemBuilder: (context, index) {
                    Todo todo = snapshot.data![index];
                    return Card(
                      margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                      child: ListTile(
                        title: Text(
                          'todo.title',
                          style: TextStyle(
                            decoration:
                                todo.isDone ? TextDecoration.lineThrough : null,
                          ),
                        ),
                        subtitle: Text(
                          'Waktu (Time): ${formatter.format(todo.timestamp)}',
                          style: TextStyle(fontSize: 12),
                        ),
                        leading: Checkbox(
                          value: todo.isDone,
                          onChanged: (value) {
                            _firebaseService.updateTodoStatus(
                              todo.id,
                              value ?? false,
                            );
                          },
                          trailing: Row(
                            mainAxisAlignment: MainAxisAlignment.min,
                            children: [
                              IconButton(
                                onPressed: () {
                                  _showEditDialog(context, todo);
                                },
                                icon: Icon(Icons.edit),
                              ),
                              IconButton(onPressed: () {
                                _firebaseService.deleteTodo(todo.id)
                              }, icon: Icon(Icons.delete))
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
  void _showEditDialog(BuildContext context, Todo todo) {
    TextEditingController editController = TextEditingController(text: todo.title);
    showDialog(context: context, builder: (context) => AlertDialog(
      title: Text('Edit Tugas (Task Edit)'),
      content: TextField(
        controller: editController,
        decoration: InputDecoration(hintText: 'Masukkan nama tugas baru (Enter new task name)'),
      ),
    ));
  }
}
