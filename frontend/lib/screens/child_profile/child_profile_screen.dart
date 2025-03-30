import 'package:flutter/material.dart';
import '../../components/main_scaffold.dart';

class ChildProfileScreen extends StatelessWidget {
  const ChildProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MainScaffold(
      currentIndex: 3,
      child: const Center(child: Text("Ekran profilu dziecka")),
    );
  }
}