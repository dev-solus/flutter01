import 'dart:convert';
import 'package:fultter01/components/users/user_model.dart';
import 'package:rxdart/rxdart.dart';

import 'package:http/http.dart' as http;

class UserService {
  Stream getAll() {
    final origin = 'http://10.0.2.2';
    final origin2 = 'http://localhost';
    final future = http.get(Uri.parse('${origin}:5000/api/users/getTest'));

    final observable = Stream.fromFuture(future);

    var test = observable
            .where((r) => r.statusCode == 200)
            .map((r) => r.body)
            .doOnData((r) => {
                  print(r),
                  print(json.decode(r)),
                })
            .map((r) => jsonDecode(r))
        // .map((r) => User.fromJson(jsonDecode(r)))
        ;

    return test;
  }
}
