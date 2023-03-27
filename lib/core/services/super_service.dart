import 'dart:convert';
import 'package:fultter01/components/users/user_model.dart';
import 'package:fultter01/environments/environment.dart';
import 'package:rxdart/rxdart.dart';

import 'package:http/http.dart' as http;

class SuperService {
  String controller = '';
  final apiUrl = environment.apiUrl;
  SuperService(final String controller) {
    this.controller = controller;
  }

  Stream getAll() {
    return Stream.fromFuture(http.get(Uri.parse('$apiUrl/$controller/get')))
            .where((r) => r.statusCode == 200)
            .map((r) => r.body)
            .doOnData((r) => {
                  print(r),
                  print(json.decode(r)),
                })
            .map((r) => jsonDecode(r))
        // .map((r) => User.fromJson(jsonDecode(r)))
        ;
  }

  Stream post(final model) {
    return Stream.fromFuture(http.get(Uri.parse('$apiUrl/$controller/post')))
            .where((r) => r.statusCode == 200)
            .map((r) => r.body)
            .doOnData((r) => {
                  print(r),
                  print(json.decode(r)),
                })
            .map((r) => jsonDecode(r))
        // .map((r) => User.fromJson(jsonDecode(r)))
        ;
  }
}
