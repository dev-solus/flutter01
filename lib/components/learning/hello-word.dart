import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:rxdart/rxdart.dart';
import 'package:json_object_mapper/json_object_mapper.dart';

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
          // _this.add();
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

  final userServ = UserServ();

  HelloWorldController() {
    init();
  }

  init() {
    var list = userServ.getAll();

    var f = list.first;
    var s = list.last;
  }
}

class UserTest {
  int id = 0;
  String name = '';

  UserTest({required this.id, required this.name});

  factory UserTest.fromJson(Map<String, dynamic> json) {
    return UserTest(name: json['name'], id: json['id']);
  }

  // UserTest.fromJson(String json) {
  //   initializeFromJson(json);
  // }
}

class UserServ extends SuperServ<UserTest> {
  @override
  getAll() {
    String responseBody = """ [
      { "id": 1, "name": "me" },
      { "id": 2, "name": "you" }
    ]""";

    var list = (jsonDecode(responseBody) as List<dynamic>)
        .map((e) => UserTest.fromJson(Map<String, dynamic>.from(e)))
        .toList();

    var ss = list.first.id;
    var sss = list.first.id;
  }
}

class SuperServ<T> {
  getAll() {
    String responseBody = """ [
      { "id": 1, "name": "me" },
      { "id": 2, "name": "you" }
    ]""";

    var map = (jsonDecode(responseBody) as List<dynamic>).map((e) {
      return Map<String, dynamic>.from(e);
    }).toList();

    var r = map.map((e) {
      var s = fromJsonDynamic<T>(e);

      return s;
    }).toList();

    return r;
  }

  T fromJsonDynamic<T>(Map<String, dynamic> json) {
    final constructor = T as dynamic Function(Map<String, dynamic>)?;
    return constructor != null ? constructor(json) : null;
  }
}

abstract class MyInterface {
  void doSomething();
}
