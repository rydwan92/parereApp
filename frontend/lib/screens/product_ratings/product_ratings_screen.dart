import 'package:flutter/material.dart';
import '../../components/main_scaffold.dart';

class ProductRatingsScreen extends StatelessWidget {
  const ProductRatingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MainScaffold(
      currentIndex: 3,
      child: const Center(child: Text("Ekran ProductRatingsScreen")),
    );
  }
}