import 'package:flutter/material.dart';
import '../routes/app_routes.dart';

class MainScaffold extends StatefulWidget {
  final Widget child;
  final int currentIndex;

  const MainScaffold({Key? key, required this.child, required this.currentIndex})
      : super(key: key);

  @override
  State<MainScaffold> createState() => _MainScaffoldState();
}

class _MainScaffoldState extends State<MainScaffold> {
  void _onItemTapped(int index) {
    switch (index) {
      case 0:
        Navigator.pushReplacementNamed(context, AppRoutes.childProfile);
        break;
      case 1:
        Navigator.pushReplacementNamed(context, AppRoutes.statistics);
        break;
      case 2:
        Navigator.pushReplacementNamed(context, AppRoutes.home);
        break;
      case 3:
        Navigator.pushReplacementNamed(context, AppRoutes.editing);
        break;
      case 4:
        Navigator.pushReplacementNamed(context, AppRoutes.settings);
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: widget.child,
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: widget.currentIndex,
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Colors.teal,
        unselectedItemColor: Colors.grey,
        onTap: _onItemTapped,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profil dziecka'),
          BottomNavigationBarItem(icon: Icon(Icons.bar_chart), label: 'Statystyki'),
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.edit), label: 'Redagowanie'),
          BottomNavigationBarItem(icon: Icon(Icons.settings), label: 'Ustawienia'),
        ],
      ),
    );
  }
}
