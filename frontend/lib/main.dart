import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'screens/home/home_screen.dart';
import 'services/reminder_provider.dart';
import 'utils/theme.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ReminderProvider()),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key}); // ✅ naprawia błąd
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Aplikacja dla Rodziców',
      theme: AppTheme.lightTheme,
      home: HomeScreen(),
    );
  }
}