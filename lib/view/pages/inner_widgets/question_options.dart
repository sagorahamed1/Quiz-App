import 'package:flutter/material.dart';

class QuestionOptions extends StatelessWidget {
  final String questionOptions;
  final bool? isCorrect;
  final Function(bool)? onSelected;

  const QuestionOptions({
    Key? key,
    required this.questionOptions,
    this.isCorrect,
    this.onSelected,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 16),
      child: ListTile(
        title: Text(questionOptions),
        tileColor: isCorrect != null ? (isCorrect! ? Colors.green : Colors.red) : Colors.black26,
        onTap: () {
          onSelected?.call(isCorrect ?? false);
        },
      ),
    );
  }
}
