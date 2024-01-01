// result_page.dart
import 'package:flutter/material.dart';

class ResultPage extends StatelessWidget {
  final int userScore;

  ResultPage({required this.userScore});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Result Page'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Congratulations! You completed the quiz.'),
            SizedBox(height: 20),
            Text('Your Score: $userScore'),
          ],
        ),
      ),
    );
  }
}
