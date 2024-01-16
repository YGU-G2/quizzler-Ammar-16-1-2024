import 'package:flutter/material.dart';
import 'package:quizzler/Widgets/my_questions.dart';

class Questions extends StatelessWidget {
  const Questions({
    super.key,
    required this.questionsList,
  });

  final MyQuestions questionsList;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Text(
          questionsList.questionsText,
          style: TextStyle(
            color: Colors.white,
            fontSize: 30,
          ),
        ),
      ),
    );
  }
}
