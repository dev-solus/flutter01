import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:rxdart/rxdart.dart';

class MyWidget extends StatelessWidget {
  final _controller = TextEditingController();
  final _results = BehaviorSubject<List<String>>();

  Stream<List<String>> get _stream => _results.stream;

  Future<void> _search(String query) async {
    final response =
        await http.get(Uri.parse('http://10.0.2.2:5000/api/users/GetTest'));

    if (response.statusCode == 200) {
      final results =
          (jsonDecode(response.body) as List<dynamic>).cast<String>();
      _results.add(results);
    } else {
      throw Exception('Failed to search: ${response.statusCode}');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Widget'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _controller,
              decoration: const InputDecoration(
                hintText: 'Search...',
              ),
              onChanged: (query) => _search(query),
            ),
            const SizedBox(height: 16.0),
            StreamBuilder<List<String>>(
              stream: _stream,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  final results = snapshot.data!;

                  if (results.isEmpty) {
                    return const Text('No results found');
                  } else {
                    return Expanded(
                      child: ListView.builder(
                        itemCount: results.length,
                        itemBuilder: (context, index) => ListTile(
                          title: Text(results[index]),
                        ),
                      ),
                    );
                  }
                } else if (snapshot.hasError) {
                  return Text('Error: ${snapshot.error}');
                } else {
                  return const SizedBox.shrink();
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
