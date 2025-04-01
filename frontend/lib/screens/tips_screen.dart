import 'package:flutter/material.dart';

class TipsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Porady')),
      body: Center(child: Text('Tu dodasz i ocenisz porady użytkowników.')),
    );
  }
}
