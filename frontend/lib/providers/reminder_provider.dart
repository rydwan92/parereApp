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
