import 'package:flutter/material.dart';

import '../screens/home/home_screen.dart';
import '../screens/questions/add_question_screen.dart';
import '../screens/profile/child_profile_screen.dart';
import '../screens/statistics/statistics_screen.dart';
import '../screens/health_calendar/health_calendar_screen.dart';
import '../screens/memories/memories_screen.dart';
import '../screens/product_ratings/product_ratings_screen.dart';
import '../screens/sports/sports_screen.dart';

import 'app_routes.dart';

class AppScreens {
  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case AppRoutes.home:
        return MaterialPageRoute(builder: (_) => const HomeScreen());
      case AppRoutes.addQuestion:
        return MaterialPageRoute(builder: (_) => AddQuestionScreen());
      case AppRoutes.childProfile:
        return MaterialPageRoute(builder: (_) => ChildProfileScreen());
      case AppRoutes.statistics:
        return MaterialPageRoute(builder: (_) => StatisticsScreen());
      case AppRoutes.memories:
        return MaterialPageRoute(builder: (_) => MemoriesScreen());
      case AppRoutes.healthCalendar:
        return MaterialPageRoute(builder: (_) => HealthCalendarScreen());
      case AppRoutes.productRatings:
        return MaterialPageRoute(builder: (_) => ProductRatingsScreen());
      case AppRoutes.sports:
        return MaterialPageRoute(builder: (_) => SportsScreen());
      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(
              child: Text('404 – Nie znaleziono strony: ${settings.name}'),
            ),
          ),
        );
    }
  }
}
