import 'dart:convert';
import 'package:fultter01/components/users/user_model.dart';
import 'package:rxdart/rxdart.dart';

import 'package:http/http.dart' as http;

class UserService {
  Stream<User> getAll() {
    final future =
        http.get(Uri.parse('http://10.0.2.2:5000/api/users/GetTest'));

    final observable = Stream.fromFuture(future);

    var test = observable
        .where((r) => r.statusCode == 200)
        .map((r) => r.body)
        .map((r) => User.fromJson(jsonDecode(r)['data']))
        .doOnData((r) => print(r));

    return test;
  }
}
