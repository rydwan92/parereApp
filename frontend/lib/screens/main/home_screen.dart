import 'package:flutter/material.dart';
import '../../components/main_scaffold.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MainScaffold(
      currentIndex: 2,
      child: Scaffold(
        appBar: AppBar(title: const Text('Strona główna')),
        body: const Center(child: Text('Witaj w aplikacji!')),
      ),
    );
  }
}
