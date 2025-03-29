import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../services/questions_service.dart';

class ReminderProvider with ChangeNotifier {
  String _dailyQuestion = '';
  String get dailyQuestion => _dailyQuestion;

  final _prefsKey = 'daily_question';
  final QuestionsService _service = QuestionsService();

  Future<void> loadDailyQuestion() async {
    final prefs = await SharedPreferences.getInstance();
    _dailyQuestion = prefs.getString(_prefsKey) ?? '';

    if (_dailyQuestion.isEmpty) {
      final question = await _service.fetchRandomQuestion();
      if (question != null) {
        _dailyQuestion = question;
        await prefs.setString(_prefsKey, _dailyQuestion);
        notifyListeners();
      }
    }
  }

  Future<void> submitCustomQuestion(String question) async {
    final success = await _service.submitQuestion(question);
    if (success) {
      print("Pytanie dodane!");
    }
  }

  void resetQuestion() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.remove(_prefsKey);
    _dailyQuestion = '';
    notifyListeners();
  }
}
