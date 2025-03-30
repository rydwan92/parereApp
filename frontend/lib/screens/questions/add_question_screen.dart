import 'package:flutter/material.dart';
import 'package:frontend/questions/add_question_screen.dart';
import '../../components/main_scaffold.dart';

class AddQuestionScreen extends StatelessWidget {
  const AddQuestionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MainScaffold(
      currentIndex: 2,
      child: const Center(child: Text("Add Question")),
    );
  }
}