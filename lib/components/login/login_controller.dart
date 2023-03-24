import 'package:flutter/material.dart';
import 'package:fultter01/components/login/login_model.dart';
import 'package:fultter01/locator.dart';
import 'package:reactive_forms/reactive_forms.dart';

import '../../uow_service.dart';
import 'login_service.dart';

class LoginController {
  FormGroup? myForm;
  var o = LoginModel();

  // di
  UowService uow = UowService();

  LoginController() {
    init();
  }

  init() {
    createForm();
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

  createForm() {
    myForm = FormGroup({
      'email': FormControl<String>(value: o.email, validators: [
        Validators.required,
        Validators.email,
      ]),
      'password': FormControl<String>(value: o.password, validators: [
        Validators.required,
        Validators.minLength(8),
      ]),
    });
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
