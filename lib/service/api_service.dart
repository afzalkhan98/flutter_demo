import 'package:http/http.dart' as http;
import 'dart:convert';

import '../model/user.dart';
class ApiService {
  static const String baseUrl = 'https://jsonplaceholder.typicode.com';

  Future<List<Userdetails>> fetchUsers() async {
    final response = await http.get(Uri.parse('https://jsonplaceholder.typicode.com/users'));

    if (response.statusCode == 200) {
      List<dynamic> data = json.decode(response.body);
      return data.map((json) => Userdetails.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load users');
    }
  }
}