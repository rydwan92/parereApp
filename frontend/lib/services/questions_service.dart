import 'dart:convert';
import 'package:http/http.dart' as http;

class QuestionsService {
  static const String baseUrl = 'http://localhost:5000/questions';

  Future<String?> fetchRandomQuestion() async {
    try {
      final response = await http.get(Uri.parse('$baseUrl/random'));
      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        return data['text'];
      } else {
        print('Błąd serwera: ${response.statusCode}');
        return null;
      }
    } catch (e) {
      print('Błąd połączenia z API: $e');
      return null;
    }
  }

  Future<bool> submitQuestion(String text) async {
    try {
      final response = await http.post(
        Uri.parse(baseUrl),
        headers: {'Content-Type': 'application/json'},
        body: json.encode({'text': text}),
      );
      return response.statusCode == 201;
    } catch (e) {
      print('Błąd podczas dodawania pytania: $e');
      return false;
    }
  }
}
