import 'package:flutter/material.dart';
import '../../components/main_scaffold.dart';
import '../../routes/app_routes.dart';

class EditingScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MainScaffold(
      currentIndex: 3, // Redagowanie
      child: Scaffold(
        appBar: AppBar(title: Text("Redagowanie")),
        body: ListView(
          padding: EdgeInsets.all(20),
          children: [
            ListTile(
              leading: Icon(Icons.question_answer),
              title: Text('Pytania'),
              subtitle: Text('Dodawaj lub oceniaj pytania dnia'),
              trailing: Icon(Icons.keyboard_arrow_right),
              onTap: () => Navigator.pushNamed(context, AppRoutes.questions),
            ),
            Divider(),
            ListTile(
              leading: Icon(Icons.lightbulb),
              title: Text('Porady'),
              subtitle: Text('Edytuj lub twórz nowe porady'),
              trailing: Icon(Icons.keyboard_arrow_right),
              onTap: () => Navigator.pushNamed(context, AppRoutes.tips),
            ),
          ],
        ),
      ),
    );
  }
}
