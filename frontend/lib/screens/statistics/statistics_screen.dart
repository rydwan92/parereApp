import 'package:flutter/material.dart';
import '../../components/main_scaffold.dart';

class StatisticsScreen extends StatelessWidget {
  const StatisticsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MainScaffold(
      currentIndex: 2,
      child: const Center(child: Text("Statystyki")),
    );
  }
}