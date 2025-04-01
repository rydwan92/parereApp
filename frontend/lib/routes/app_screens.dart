import 'package:flutter/material.dart';
import '../screens/main/home_screen.dart';
import '../screens/main/child_profile_screen.dart';
import '../screens/main/statistics_screen.dart';
import '../screens/main/editing_screen.dart';
import '../screens/questions/add_question_screen.dart';
import '../screens/tips_screen.dart';
import '../screens/main/settings/settings_screen.dart';
import 'app_routes.dart';

class AppScreens {
  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case AppRoutes.home:
        return MaterialPageRoute(builder: (_) => HomeScreen());
      case AppRoutes.childProfile:
        return MaterialPageRoute(builder: (_) => ChildProfileScreen());
      case AppRoutes.statistics:
        return MaterialPageRoute(builder: (_) => StatisticsScreen());
      case AppRoutes.editing:
        return MaterialPageRoute(builder: (_) => EditingScreen());
      case AppRoutes.questions:
        return MaterialPageRoute(builder: (_) => AddQuestionScreen());
      case AppRoutes.tips:
        return MaterialPageRoute(builder: (_) => TipsScreen());
      case AppRoutes.settings:
        return MaterialPageRoute(builder: (_) => SettingsScreen());
      default:
        return MaterialPageRoute(builder: (_) => Scaffold(body: Center(child: Text('Nie znaleziono ekranu!'))));
    }
  }
}
