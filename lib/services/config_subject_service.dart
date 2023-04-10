import 'dart:convert';
import 'package:http/http.dart' as http;

import '../components/config_subject/config_subject_model.dart';

class ConfigSubjectService {
  static const String baseUrl = 'https://example.com/api';
  static const Map<String, String> headers = {
    'Content-Type': 'application/json'
  };

  Future<List<ConfigSubject>> fetchAllUsers() async {
    final response =
        await http.get(Uri.parse('$baseUrl/users'), headers: headers);

    if (response.statusCode == 200) {
      final jsonList = jsonDecode(response.body) as List<dynamic>;
      return jsonList.map((json) => ConfigSubject.fromJson(json)).toList();
    } else {
      throw Exception('Failed to fetch all users');
    }
  }
}
