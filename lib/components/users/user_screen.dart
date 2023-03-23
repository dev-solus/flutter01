import 'package:flutter/material.dart';
import 'package:reactive_forms/reactive_forms.dart';

import 'user_controller.dart';
import 'user_provider.dart';

class UsersScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final _this = UserController(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Todo List'),
      ),
      body: ListView.builder(
        itemCount: todoProvider.todos.length,
        itemBuilder: (context, index) {
          final todo = todoProvider.todos[index];
          return ListTile(
            title: Text(todo.title),
            trailing: Checkbox(
              value: todo.completed,
              onChanged: (value) {
                final updatedTodo = todo.copyWith(completed: value!);
                todoProvider.update(updatedTodo);
              },
            ),
            onLongPress: () {
              todoProvider.delete(todo);
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          final newTodo = Todo(
            id: DateTime.now().millisecondsSinceEpoch,
            title: 'New Task',
          );
          todoProvider.add(newTodo);
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
