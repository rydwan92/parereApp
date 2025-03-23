import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../services/reminder_provider.dart';
import '../../utils/constants.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Strona główna'),
      ),
      body: Padding(
        padding: EdgeInsets.all(AppSpacing.md),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Witaj w aplikacji!',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            SizedBox(height: AppSpacing.lg),
            Card(
              elevation: 4,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(AppSpacing.sm),
              ),
              child: Padding(
                padding: EdgeInsets.all(AppSpacing.md),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Przypomnienie dnia:',
                        style: Theme.of(context).textTheme.titleMedium),
                    SizedBox(height: AppSpacing.sm),
                    Consumer<ReminderProvider>(
                      builder: (context, reminder, child) {
                        return Text(
                          reminder.dailyQuestion,
                          style: Theme.of(context).textTheme.bodyLarge,
                        );
                      },
                    ),
                    SizedBox(height: AppSpacing.md),
                    ElevatedButton(
                      onPressed: () {
                        // Przykład zmiany pytania
                        context.read<ReminderProvider>().setNewQuestion(
                          "„Czym Cię dzisiaj zaskoczyłem, Mamo?”",
                        );
                      },
                      child: Text('Nowe pytanie'),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}