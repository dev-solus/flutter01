import 'package:flutter/material.dart';
import 'package:rxdart/rxdart.dart';

class HelloWorld extends StatelessWidget {
  HelloWorld({super.key});

  final _this = HelloWorldController();

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
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _this.add();
        },
        child: Icon(Icons.add),
      ),
    );
  }
}

class HelloWorldController {
  // UowService uow = inject<UowService>();
  // final dataProvider = Provider.of<UserProvider>(context);

  // Stream<dynamic> dataSource2 = Stream.empty();
  final action = BehaviorSubject<List<dynamic>>.seeded([]);
  Stream<dynamic> dataSource = Stream.empty();

  HelloWorldController() {
    init();
  }

  init() {
    for (var i = 0; i < 4; i++) {
      print('hello $i');
    }

    // dataSource.
  }

  add() {}
}
