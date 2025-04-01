import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../providers/user_provider.dart';
import '../../components/main_scaffold.dart';

class StatisticsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final userProvider = Provider.of<UserProvider>(context);

    return MainScaffold(
      currentIndex: 1, // Statystyki
      child: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('🏆 Twoje odznaki', style: Theme.of(context).textTheme.headlineSmall),
            SizedBox(height: 20),
            GridView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
              ),
              itemCount: userProvider.badges.length,
              itemBuilder: (context, index) {
                final badge = userProvider.badges[index];
                return Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(badge.icon, size: 50, color: badge.earned ? Colors.amber : Colors.grey),
                    SizedBox(height: 8),
                    Text(badge.title, textAlign: TextAlign.center),
                  ],
                );
              },
            ),
            SizedBox(height: 30),
            Text('📈 Twoje postępy', style: Theme.of(context).textTheme.headlineSmall),
            SizedBox(height: 20),
            LinearProgressIndicator(value: userProvider.progress),
            SizedBox(height: 10),
            Text('${(userProvider.progress * 100).round()}% ukończonych celów'),
          ],
        ),
      ),
    );
  }
}
