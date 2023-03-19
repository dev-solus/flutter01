import 'package:flutter/material.dart';
import 'package:reactive_forms/reactive_forms.dart';

import 'login_controller.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final _formKey = GlobalKey<FormState>();

  final _this = LoginController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
      ),
      body: Container(
          margin: const EdgeInsets.all(24),
          child: ReactiveForm(
            formGroup: _this.myForm!,
            child: Column(
              children: <Widget>[
                // ReactiveTextField(
                //   formControlName: 'name',
                //   validationMessages: {
                //     'required': (error) => 'The name must not be empty'
                //   },
                // ),
                ReactiveTextField(
                  decoration: const InputDecoration(labelText: 'Email'),
                  keyboardType: TextInputType.emailAddress,
                  formControlName: 'email',
                  validationMessages: {
                    'required': (error) => 'The email must not be empty',
                    'email': (error) => 'The email value must be a valid email'
                  },
                ),
                ReactiveTextField(
                  decoration: const InputDecoration(labelText: 'Password'),
                  formControlName: 'password',
                  obscureText: true,
                  validationMessages: {
                    'required': (error) => 'The password must not be empty',
                    // 'minLength': (error) =>
                    //     'The password must have at least 8 characters',
                    'minLength': (error) =>
                        'The password must be at least ${(error as Map)['requiredLength']} characters long'
                  },
                ),
                ElevatedButton(
                  onPressed: _this.myForm!.valid ? _this.submit : null,
                  child: const Text('Submit'),
                ),
                Text(_this.myForm!.valid.toString()),
              ],
            ),
          )
          // child: Form(
          //   key: _formKey,
          //   child: Column(
          //     mainAxisAlignment: MainAxisAlignment.center,
          //     children: [
          //       TextFormField(
          //         decoration: const InputDecoration(labelText: 'Email'),
          //         keyboardType: TextInputType.emailAddress,
          //         validator: (value) => _controller.isValid(value),
          //         onSaved: (value) => _controller.o.email = value ?? "",
          //       ),
          //       // TextFormField(
          //       //   decoration: InputDecoration(labelText: 'Password'),
          //       //   obscureText: true,
          //       //   validator: (value) => _controller.isValid(value),
          //       //   onSaved: (value) {
          //       //     _controller.updatePassword(value);
          //       //   },
          //       // ),
          //       const SizedBox(height: 24),
          //       ElevatedButton(
          //         onPressed: () {
          //           // Validate returns true if the form is valid, or false otherwise.
          //           if (_formKey.currentState!.validate()) {
          //             // If the form is valid, display a snackbar. In the real world,
          //             // you'd often call a server or save the information in a database.
          //             ScaffoldMessenger.of(context).showSnackBar(
          //               const SnackBar(content: Text('Processing Data')),
          //             );
          //           }

          //           _controller.submit(_formKey.currentState);
          //         },
          //         child: const Text('Submit'),
          //       ),
          //       // RaisedButton(
          //       //   child: const Text('Login'),
          //       //   onPressed: () {
          //       //     if (_formKey.currentState!.validate()) {
          //       //       _formKey.currentState!.save();
          //       //       _controller.submitForm(context);
          //       //     }
          //       //   },
          //       // ),
          //     ],
          //   ),
          // ),
          ),
    );
  }
}
