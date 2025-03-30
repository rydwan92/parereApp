import 'package:flutter/material.dart';
import '../../components/main_scaffold.dart';

class MemoriesScreen extends StatelessWidget {
  const MemoriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MainScaffold(
      currentIndex: 1,
      child: const Center(
        child: Padding(
          padding: EdgeInsets.all(24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.photo_album_outlined, size: 64, color: Colors.teal),
              SizedBox(height: 16),
              Text(
                "Tu pojawią się wspomnienia Twojego dziecka 📸",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 18),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
