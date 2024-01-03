// question_and_answer_page.dart

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:quiz_app/controller/questions_controller.dart';
import 'inner_widgets/question_card.dart';
import 'inner_widgets/custom_button.dart';

class QuestionAndAnswerPage extends StatefulWidget {
  const QuestionAndAnswerPage({Key? key}) : super(key: key);

  @override
  State<QuestionAndAnswerPage> createState() => _QuestionAndAnswerPageState();
}

class _QuestionAndAnswerPageState extends State<QuestionAndAnswerPage> {
  QuestionController _questionController = Get.put(QuestionController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: PageView.builder(
              physics: NeverScrollableScrollPhysics(),
              controller: _questionController.pageController,
              onPageChanged: _questionController.updateTheQnNum,
              itemCount: _questionController.questions.length,
              itemBuilder: (context, index) => QuestionCard(question: _questionController.questions[index]),
            ),
          ),
          _NextButton(),
          SizedBox(height: 20),
        ],
      ),
    );
  }

  Widget _NextButton() {
    return CustomButton(
      height: 56.h,
      width: 90.w,
      color: Color(0xFF5424FD),
      onTap: () => _questionController.nextQuestion(),
      title: "Skip",
    );
  }
}
