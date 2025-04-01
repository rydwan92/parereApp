import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'providers/reminder_provider.dart';
import 'routes/app_routes.dart';
import 'routes/app_screens.dart';
import 'theme/app_theme.dart';
import 'services/auth_service.dart';
import 'screens/auth/welcome_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final bool isLoggedIn = await AuthService.isLoggedIn();

  runApp(MyApp(isLoggedIn: isLoggedIn));
}

class MyApp extends StatelessWidget {
  final bool isLoggedIn;

  const MyApp({super.key, required this.isLoggedIn});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ReminderProvider()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Aplikacja dla rodziców',
        theme: AppTheme.lightTheme,
        darkTheme: AppTheme.darkTheme,
        themeMode: ThemeMode.system,
        initialRoute: isLoggedIn ? AppRoutes.home : AppRoutes.welcome,
        onGenerateRoute: AppScreens.onGenerateRoute,
      ),
    );
  }
}
