import 'package:flutter/material.dart';

class Badge {
  final String title;
  final IconData icon;
  bool earned;

  Badge({required this.title, required this.icon, this.earned = false});
}

class UserProvider with ChangeNotifier {
  List<Badge> badges = [
    Badge(title: 'Pierwsze wspomnienie', icon: Icons.photo_album, earned: true),
    Badge(title: 'Pięć pytań', icon: Icons.question_answer),
    Badge(title: 'Mistrz statystyk', icon: Icons.bar_chart),
    Badge(title: 'Aktywny rodzic', icon: Icons.child_care, earned: true),
    Badge(title: 'Ekspert porad', icon: Icons.lightbulb),
  ];

  double progress = 0.4; // 40% na potrzeby przykładu

  void earnBadge(String title) {
    final badge = badges.firstWhere((badge) => badge.title == title);
    badge.earned = true;
    updateProgress();
    notifyListeners();
  }

  void updateProgress() {
    int earnedCount = badges.where((badge) => badge.earned).length;
    progress = earnedCount / badges.length;
  }
}
