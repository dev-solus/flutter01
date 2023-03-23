import 'package:json_annotation/json_annotation.dart';

class User {
  String id = 'dj-m2x@hotmail.com';
  String email = 'dj-m2x@hotmail.com';
  String password = '12345678';

  final Map<String, User> data;

  // LoginModel({this.email, this.password});

  User({required this.data});

  factory User.fromJson(Map<String, dynamic> json) {
    final data = <String, User>{};
    for (final entry in json.entries) {
      data[entry.key] = User.fromJson(entry.value as Map<String, dynamic>);
    }
    return User(data: data);
  }
}
