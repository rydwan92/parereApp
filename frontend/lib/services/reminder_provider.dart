import 'package:flutter/material.dart';

class ReminderProvider with ChangeNotifier {
  String _dailyQuestion = "„Tata, co dzisiaj robiliśmy fajnego razem?”";

  String get dailyQuestion => _dailyQuestion;

  void setNewQuestion(String question) {
    _dailyQuestion = question;
    notifyListeners();
  }
}