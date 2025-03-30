import 'package:flutter/material.dart';
import '../../components/main_scaffold.dart';

class SportsScreen extends StatelessWidget {
  const SportsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MainScaffold(
      currentIndex: 2,
      child: const Center(child: Text("Sport Screen")),
    );
  }
}