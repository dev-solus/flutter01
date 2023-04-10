import 'package:flutter/material.dart';

import 'config_subject_controller.dart';

class ConfigSubjectScreen extends StatelessWidget {
  ConfigSubjectScreen({super.key});

  final _this = ConfigSubjectController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Todo List'),
      ),
      body: StreamBuilder(
        stream: _this.dataSource,
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.hasData) {
            var s = snapshot.data;
            return Text(s!.name);
            // return ListView.separated(
            //   separatorBuilder: (context, index) =>
            //       Divider(color: Colors.black),
            //   itemCount: snapshot.data.length,
            //   itemBuilder: (BuildContext ctx, int index) {
            //     final element = snapshot.data[index];
            //     return ListTile(
            //       title: Text("${element["email"]}"),
            //       subtitle: Text("${element["phone"]}"),
            //     );
            //   },
            // );
          } else {
            return CircularProgressIndicator();
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // _this.add();
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
