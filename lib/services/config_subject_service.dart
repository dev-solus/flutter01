import 'dart:convert';
import 'package:http/http.dart' as http;

import '../components/config_subject/config_subject_model.dart';

class ConfigSubjectService {
  // static const String baseUrl = 'http://10.0.2.2:5001/api/ConfigSubjects/get';
  static const String baseUrl = 'http://localhost:5001/api';
  static const Map<String, String> headers = {
    'Content-Type': 'application/json'
  };

  Future<List<ConfigSubject>> fetchAllUsers() async {
    final response = await http.get(Uri.parse('$baseUrl/ConfigSubjects/get'),
        headers: headers);

    if (response.statusCode == 200) {
      final jsonList = jsonDecode(response.body) as List<dynamic>;
      final r = jsonList.map((json) {
        final rr = ConfigSubject.fromJson(json);

        return rr;
      }).toList();

      return r;
    } else {
      throw Exception('Failed to fetch all users');
    }
  }
}
