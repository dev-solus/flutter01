import 'dart:convert';
import 'package:fultter01/components/users/user_model.dart';
import 'package:rxdart/rxdart.dart';

import 'package:http/http.dart' as http;

import 'super_service.dart';

class UserService extends SuperService {
  UserService() : super('categories');

  @override
  Stream getAll() {
    return Stream.fromFuture(http.get(Uri.parse('$apiUrl/$controller/get')))
        .where((r) => r.statusCode == 200)
        .map((r) => r.body)
        // .doOnData((r) => {
        //       print(r),
        //       print(json.decode(r)),
        //     })
        .doOnData((r) => {
              print('>>>>>>>>>>>>>>>>>>'),
              print(User.fromJson(jsonDecode(r)).name)
            })
        .map((r) => jsonDecode(r));
  }
}
