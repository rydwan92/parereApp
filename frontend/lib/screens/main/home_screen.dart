import 'package:flutter/material.dart';
import '../../components/main_scaffold.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MainScaffold(
      currentIndex: 2,
      child: Scaffold(
        appBar: AppBar(title: Text('Strona główna')),
        body: Center(child: Text('Witaj w aplikacji!')),
      ),
    );
  }
}
