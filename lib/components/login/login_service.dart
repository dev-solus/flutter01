import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class LoginService {
  static final String baseUrl = 'https://jsonplaceholder.typicode.com';

  Future<List<dynamic>> getPosts() async {
    final response = await http.get('$baseUrl/posts' as Uri);

    if (response.statusCode == 200) {
      final List<dynamic> data = json.decode(response.body);
      return data;
    } else {
      throw Exception('Failed to load posts');
    }
  }
}
