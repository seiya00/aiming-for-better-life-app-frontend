import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

Future<String> getToken() async {
  var uri = Uri.parse('http://127.0.0.1:8000/api/user/token/');
  var response = await http.post(uri,
      body: {'email': 'test@example.com', 'password': 'Testpass123'});
  if (response.statusCode == 200) {
    print('successed to get token');
  } else {
    throw Exception('Failed to get token');
  }
  var data = jsonDecode(response.body);
  return data['token'];
}

Future<List<dynamic>> getQuestions() async {
  final token = await getToken();
  var uri = Uri.parse('http://127.0.0.1:8000/api/questions/');
  var response =
      await http.get(uri, headers: {'Authorization': 'Token $token'});
  if (response.statusCode == 200) {
    final data = jsonDecode(const Utf8Decoder().convert(response.bodyBytes));
    // print(data);
    return data;
  } else {
    throw Exception('Failed to load questions');
  }
}

Future<List<dynamic>> getYesterdayAnswers() async {
  final token = await getToken();
  var uri = Uri.parse('http://127.0.0.1:8000/api/answer/yesterday/');
  var response =
      await http.get(uri, headers: {'Authorization': 'Token $token'});
  if (response.statusCode == 200) {
    final data = jsonDecode(const Utf8Decoder().convert(response.bodyBytes));
    // print(data);
    return data;
  } else {
    throw Exception('Failed to load questions');
  }
}

Future<List<dynamic>> getWeekAnswers() async {
  final token = await getToken();
  var uri = Uri.parse('http://127.0.0.1:8000/api/answer/week/');
  var response =
      await http.get(uri, headers: {'Authorization': 'Token $token'});
  if (response.statusCode == 200) {
    final data = jsonDecode(const Utf8Decoder().convert(response.bodyBytes));
    // print(data);
    return data;
  } else {
    throw Exception('Failed to load questions');
  }
}

