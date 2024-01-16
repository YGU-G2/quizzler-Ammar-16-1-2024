import 'package:flutter/material.dart';
import 'package:quizzler/Widgets/my_questions.dart';

class Awnsers extends StatelessWidget {
  const Awnsers({
    super.key,
    required this.list,
  });

  final MyQuestions list;

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      backgroundColor: Colors.black38,
      child: Icon(
        list.theAwnser == null
            ? Icons.ac_unit_rounded
            : list.theAwnser == true
                ? Icons.check
                : Icons.close,
        color: list.theAwnser == null
            ? Colors.grey
            : list.theAwnser == true
                ? Colors.green
                : Colors.red,
      ),
    );
  }
}
