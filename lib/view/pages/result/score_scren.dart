import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controller/questions_controller.dart';


class ScoreScreen extends StatelessWidget {

  const ScoreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    QuestionController _controller = Get.put(QuestionController());

    return Scaffold(
      body: Center(
        child: Column(
          children: [
            SizedBox(
              height: 150,
            ),
            Text('Your Score',style: TextStyle(
                fontSize: 34,
                fontWeight: FontWeight.bold,
                color: Colors.green
            ),),
            SizedBox(
              height: 150,
            ),
            Stack(
              alignment: Alignment.center,
              children: [
                SizedBox(
                  height: 250,
                  width: 250,
                  child: CircularProgressIndicator(
                    strokeWidth: 12,
                    value: _controller.numOfCorrectAns/9,
                    color: Colors.green,
                    backgroundColor: Colors.red,
                  ),
                ),
                Column(
                  children: [
                    Text(_controller.numOfCorrectAns.toString() + '/9',style: TextStyle(fontSize: 80,color:Colors.green),),
                    SizedBox(
                      height: 10,
                    ),
                    Text('${(_controller.numOfCorrectAns / _controller.questionNumber.value*100).round()}%',style: TextStyle(fontSize: 30,color: Colors.green),)
                  ],
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}