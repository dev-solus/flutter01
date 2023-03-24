import 'package:flutter/material.dart';
import 'package:reactive_forms/reactive_forms.dart';

import 'user_controller.dart';

class UsersScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final _this = UserController();

    return Scaffold(
      appBar: AppBar(
        title: Text('Todo List'),
      ),
      body: StreamBuilder(
        stream: _this.dataSource,
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.hasData) {
            return ListView.separated(
              separatorBuilder: (context, index) =>
                  Divider(color: Colors.black),
              itemCount: snapshot.data.length,
              itemBuilder: (BuildContext ctx, int index) {
                final element = snapshot.data[index];
                return ListTile(
                  title: Text("${element["email"]}"),
                  subtitle: Text("${element["phone"]}"),
                );
              },
            );
          } else {
            return CircularProgressIndicator();
          }
        },
      ),
      //  ListView.builder(
      //   itemCount: todoProvider.todos.length,
      //   itemBuilder: (context, index) {
      //     final todo = todoProvider.todos[index];
      //     return ListTile(
      //       title: Text(todo.title),
      //       trailing: Checkbox(
      //         value: todo.completed,
      //         onChanged: (value) {
      //           final updatedTodo = todo.copyWith(completed: value!);
      //           todoProvider.update(updatedTodo);
      //         },
      //       ),
      //       onLongPress: () {
      //         todoProvider.delete(todo);
      //       },
      //     );
      //   },
      // ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _this.add();
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
