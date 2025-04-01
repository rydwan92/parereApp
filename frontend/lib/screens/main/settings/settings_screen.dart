import 'package:flutter/material.dart';
import '../../../components/main_scaffold.dart';
import '../../../services/auth_api.dart';

class SettingsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MainScaffold(
      currentIndex: 4,
      child: Scaffold(
        appBar: AppBar(title: Text('Ustawienia')),
        body: ListView(
          children: [
            ListTile(
              leading: Icon(Icons.person),
              title: Text('Edytuj profil'),
              onTap: () {},
            ),
            SwitchListTile(
              title: Text('Zmień motyw'),
              secondary: Icon(Icons.dark_mode),
              value: false,
              onChanged: (val) {},
            ),
            ListTile(
              leading: Icon(Icons.logout),
              title: Text('Wyloguj się'),
              onTap: () async {
                await AuthApi.logout();
                Navigator.pushReplacementNamed(context, '/login');
              },
            ),
          ],
        ),
      ),
    );
  }
}
