import 'package:flutter/material.dart';
import 'package:fultter01/components/login/login_model.dart';
import 'package:fultter01/locator.dart';
import 'package:reactive_forms/reactive_forms.dart';
import 'package:rxdart/rxdart.dart';

import '../../uow_service.dart';
import 'user_model.dart';
import 'user_service.dart';
import 'package:provider/provider.dart';

class UserController {
  FormGroup? myForm;

  // di
  UserService uow = inject<UserService>();

  UserService service = UserService();
  // UowService uow = inject<UowService>();
  // final dataProvider = Provider.of<UserProvider>(context);

  Stream<dynamic> dataSource = Stream.empty();
  // Stream<dynamic> dataSource2 = Stream.empty();
  // final dataSource = BehaviorSubject<List<User>>.seeded([]);

  UserController() {
    init();
  }

  init() {
    dataSource = uow.getAll();
  }

  void updateEmail(String email) {
    // model.email = email;
  }

  isValid(String? value) {
    if (value != "") {
      return 'Email is required';
    }
    if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(value ?? "")) {
      return 'Please enter a valid email address';
    }

    return value;
  }

  void callHttp() {
    // httpService.getPosts().then((data) => setState(() {
    //       posts = data;
    //     }));

    //        @override
    // Widget build(BuildContext context) {
    //   return Scaffold(
    //     appBar: AppBar(
    //       title: Text(widget.title),
    //     ),
    //     body: ListView.builder(
    //       itemCount: posts.length,
    //       itemBuilder: (BuildContext context, int index) {
    //         return ListTile(
    //           title: Text(posts[index]['title']),
    //           subtitle: Text(posts[index]['body']),
    //         );
    //       },
    //     ),
    //   );
    // }
  }

  add() {}

  void updatePassword(String password) {
    // model.password = password;
  }

  void submit() {
    // print(context.);
    var o = myForm!.value;
    print(o);
    // Perform login logic here
    // You can use the model.email and model.password properties to access the user input
  }
}
