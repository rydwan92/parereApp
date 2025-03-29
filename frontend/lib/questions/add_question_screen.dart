import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../providers/reminder_provider.dart';

class AddQuestionScreen extends StatefulWidget {
  @override
  _AddQuestionScreenState createState() => _AddQuestionScreenState();
}

class _AddQuestionScreenState extends State<AddQuestionScreen> {
  final TextEditingController _controller = TextEditingController();
  bool _isLoading = false;
  String? _message;

  Future<void> _submitQuestion() async {
    final text = _controller.text.trim();
    if (text.isEmpty) return;

    setState(() {
      _isLoading = true;
      _message = null;
    });

    final provider = Provider.of<ReminderProvider>(context, listen: false);
    final success = await provider.submitCustomQuestion(text);

    setState(() {
      _isLoading = false;
      _message = success ? 'Pytanie zostało dodane! 💬' : 'Coś poszło nie tak 😕';
      if (success) _controller.clear();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Dodaj pytanie")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Text("Wpisz pytanie, które Twoim zdaniem powinno się pojawić innym rodzicom 👇"),
            const SizedBox(height: 16),
            TextField(
              controller: _controller,
              maxLines: 3,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: "Np. „Czy dziś mnie przytuliłeś bez powodu?”",
              ),
            ),
            const SizedBox(height: 16),
            _isLoading
                ? CircularProgressIndicator()
                : ElevatedButton(
              onPressed: _submitQuestion,
              child: Text("Dodaj pytanie"),
            ),
            if (_message != null) ...[
              const SizedBox(height: 16),
              Text(
                _message!,
                style: TextStyle(
                  color: _message!.startsWith("Pytanie") ? Colors.green : Colors.red,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }
}
