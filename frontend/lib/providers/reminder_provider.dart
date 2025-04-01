import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../services/api_service.dart';


class ReminderProvider with ChangeNotifier {
  final ApiService _service = ApiService();
  final String _prefsKey = 'daily_question';
  String _dailyQuestion = '';

  String get dailyQuestion => _dailyQuestion;

  Future<void> loadDailyQuestion() async {
    final prefs = await SharedPreferences.getInstance();
    final savedDate = prefs.getString('daily_question_date');
    final today = DateTime.now().toIso8601String().substring(0, 10);

    if (prefs.containsKey(_prefsKey) && savedDate == today) {
      _dailyQuestion = prefs.getString(_prefsKey)!;
      notifyListeners();
      return;
    }

    final question = await _service.fetchRandomQuestion();
    if (question != null) {
      _dailyQuestion = question;
      await prefs.setString(_prefsKey, _dailyQuestion);
      await prefs.setString('daily_question_date', today);
      notifyListeners();
    }
  }

  Future<bool> submitCustomQuestion(String text) async {
    final success = await _service.submitQuestion(text);
    if (success) {
      print("Pytanie dodane!");
    }
    return success;
  }

  void resetQuestion() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.remove(_prefsKey);
    _dailyQuestion = '';
    notifyListeners();
  }
}
