import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class AuthApi {
  static const String baseUrl = 'http://localhost:5000/api/auth';
  static final storage = FlutterSecureStorage();

  // Rejestracja użytkownika
  static Future<bool> register(String email, String password) async {
    final response = await http.post(
      Uri.parse('$baseUrl/register'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({'email': email, 'password': password}),
    );

    if (response.statusCode == 201) {
      final data = jsonDecode(response.body);
      await storage.write(key: 'jwt_token', value: data['token']);
      return true;
    }
    return false;
  }

  // Logowanie użytkownika
  static Future<bool> login(String email, String password) async {
    final response = await http.post(
      Uri.parse('$baseUrl/login'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({'email': email, 'password': password}),
    );

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      await storage.write(key: 'jwt_token', value: data['token']);
      return true;
    }
    return false;
  }

  // Pobranie profilu użytkownika (autoryzowane zapytanie)
  static Future<Map<String, dynamic>?> getProfile() async {
    final token = await storage.read(key: 'jwt_token');

    final response = await http.get(
      Uri.parse('$baseUrl/profile'),
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token'
      },
    );

    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    }
    return null;
  }

  // Wylogowanie użytkownika
  static Future<void> logout() async {
    await storage.delete(key: 'jwt_token');
  }
}
