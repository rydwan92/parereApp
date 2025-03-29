import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../providers/reminder_provider.dart';
import '../../routes/app_routes.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final reminderProvider = Provider.of<ReminderProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text("Strona główna"),
        actions: [
          IconButton(
            icon: const Icon(Icons.add_comment),
            tooltip: "Dodaj pytanie",
            onPressed: () {
              Navigator.pushNamed(context, AppRoutes.addQuestion);
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Pytanie dnia:",
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const SizedBox(height: 16),
            Text(
              reminderProvider.dailyQuestion.isNotEmpty
                  ? reminderProvider.dailyQuestion
                  : "Ładuję pytanie...",
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            const SizedBox(height: 32),
            ElevatedButton.icon(
              onPressed: () {
                reminderProvider.resetQuestion();
                reminderProvider.loadDailyQuestion();
              },
              icon: const Icon(Icons.refresh),
              label: const Text("Wylosuj inne pytanie"),
            ),
            const SizedBox(height: 16),
            ElevatedButton.icon(
              onPressed: () {
                Navigator.pushNamed(context, AppRoutes.addQuestion);
              },
              icon: const Icon(Icons.add),
              label: const Text("Dodaj własne pytanie"),
            ),
          ],
        ),
      ),
    );
  }
}
