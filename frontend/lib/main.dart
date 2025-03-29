import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'providers/reminder_provider.dart';
import 'routes/app_routes.dart';
import 'routes/app_screens.dart';
import 'theme/theme.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) {
            final provider = ReminderProvider();
            provider.loadDailyQuestion();
            return provider;
          },
        ),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Aplikacja dla Rodziców',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      initialRoute: AppRoutes.home,
      onGenerateRoute: AppScreens.onGenerateRoute,
    );
  }
}
