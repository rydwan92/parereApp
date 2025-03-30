import 'package:flutter/material.dart';
import 'screens/auth/welcome_screen.dart';
import 'screens/auth/login_screen.dart';
import 'screens/auth/registration_screen.dart';
import 'screens/home/home_screen.dart';
import 'services/auth_service.dart';
import 'providers/reminder_provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  bool loggedIn = await AuthService.isLoggedIn();
  runApp(MyApp(isLoggedIn: loggedIn));
}

class MyApp extends StatelessWidget {
  final bool isLoggedIn;

  MyApp({required this.isLoggedIn});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Aplikacja dla Rodziców',
      theme: ThemeData(primarySwatch: Colors.teal),
      home: isLoggedIn ? HomeScreen() : WelcomeScreen(),
      routes: {
        '/home': (context) => HomeScreen(),
        '/login': (context) => LoginScreen(),
        '/register': (context) => RegisterScreen(),
      },
    );
  }
}
