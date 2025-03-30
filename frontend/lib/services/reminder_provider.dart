import 'package:flutter/material.dart';

class ReminderProvider with ChangeNotifier {
  // 🧠 Prywatne pole na aktualne pytanie
  String _dailyQuestion = 'Tato, co dzisiaj robiliśmy razem fajnego?';

  // 🧩 Getter publiczny do odczytu pytania
  String get dailyQuestion => _dailyQuestion;

  // ✍️ Setter publiczny z powiadomieniem o zmianie
  void setDailyQuestion(String question) {
    if (question != _dailyQuestion) {
      _dailyQuestion = question;
      notifyListeners(); // 🔁 informuje wszystkie widżety nasłuchujące
    }
  }

  // 📅 (Opcjonalnie) Możesz dodać przyszłościowo metodę do losowania pytania
  void loadRandomDailyQuestion(List<String> questions) {
    questions.shuffle();
    setDailyQuestion(questions.first);
  }
}
