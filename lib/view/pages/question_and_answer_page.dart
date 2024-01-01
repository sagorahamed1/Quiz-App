import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../controller/question_controller.dart';
import 'inner_widgets/custom_button.dart';
import 'inner_widgets/question_options.dart';
import 'result/result_page.dart';

class QuestionAndAnswerPage extends StatefulWidget {
  const QuestionAndAnswerPage({Key? key}) : super(key: key);

  @override
  State<QuestionAndAnswerPage> createState() => _QuestionAndAnswerPageState();
}

class _QuestionAndAnswerPageState extends State<QuestionAndAnswerPage> {


  late QuestionController questionController;
  late List<Map<String, dynamic>> questionsAndAnswers;
  late Map<String, dynamic> questionAndAnswerData;
  int currentIndex = 0;
  int userScore = 0;
  int wrongScore = 0;
  late Timer timer;
  int timerSeconds = 20;



  @override
  void initState() {
    super.initState();
    questionController = Get.put(QuestionController());
    questionsAndAnswers = questionController.questionsAndAnswers['results'];
    questionAndAnswerData = questionsAndAnswers[currentIndex];
    startTimer();
  }




  void startTimer() {
    timer = Timer.periodic(Duration(seconds: 1), (Timer t) {
      if (timerSeconds == 0) {
        goToNextQuestion(false);
      } else {
        setState(() {
          timerSeconds--;
        });
      }
    });
  }



  void resetTimer() {
    timer.cancel();
    timerSeconds = 20;
    startTimer();
  }

  void goToNextQuestion(bool isCorrect) {
    resetTimer();

    if (isCorrect) {
      userScore++;
    } else {
      wrongScore++;
    }

    if (currentIndex < questionsAndAnswers.length - 1) {
      currentIndex++;
      questionAndAnswerData = questionsAndAnswers[currentIndex];
    } else {
      timer.cancel();
      Get.to(ResultPage(userScore: userScore));
    }
    setState(() {});
  }




  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          _HeaderSection(),
          _QuestionContainer(),
          _buildOptions(),
          _Timer(),
          _NextButton(),
        ],
      ),
    );
  }



  /// ----------------------------header section-------------------------------
  Widget _HeaderSection() {
    return Stack(
      clipBehavior: Clip.none,
      alignment: Alignment.center,
      children: [
        Container(
          height: 200.h,
          width: Get.width,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
              bottomRight: Radius.circular(40),
              bottomLeft: Radius.circular(40),
            ),
            color: Colors.greenAccent,
          ),
        ),
        Positioned(
          top: 50.h,
          child: Container(
            height: 60.h,
            width: 60.w,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(60),
              boxShadow: [
                BoxShadow(
                  offset: Offset(0, 10),
                  blurRadius: 33,
                  color: Color(0XFFD3D3B3).withOpacity(.88),
                ),
              ],
            ),
            child: Center(child: Text("$timerSeconds")),
          ),
        ),
        Positioned(
          bottom: -100.h,
          child: Container(
            height: 200.h,
            width: 300.w,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(30),
              boxShadow: [
                BoxShadow(
                  offset: Offset(0, 10),
                  blurRadius: 10,
                  color: Color(0XFFD3D3B3).withOpacity(.88),
                ),
              ],
            ),
            child: Padding(
              padding: const EdgeInsets.all(14),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "$userScore",
                        style: TextStyle(
                          color: Colors.green,
                          fontSize: 18.sp,
                        ),
                      ),
                      Text(
                        "$wrongScore",
                        style: TextStyle(
                          color: Colors.red,
                          fontSize: 18.sp,
                        ),
                      ),
                    ],
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: Text(
                      "Question ${currentIndex + 1}/${questionsAndAnswers.length}",
                      style: TextStyle(
                        color: Colors.greenAccent,
                        fontSize: 20.sp,
                      ),
                    ),
                  ),
                  SizedBox(height: 20.h),
                  FittedBox(
                    child: Text(
                      questionAndAnswerData['question'],
                      style: TextStyle(fontSize: 18.sp),
                      maxLines: 3,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }




  //// -----------------------------------Question Container ----------------------------->
  Widget _QuestionContainer() {
    return SizedBox(height: 150.h);
  }

  Widget _buildOptions() {
    return Column(
      children: [
        for (int i = 0; i < questionAndAnswerData['incorrect_answers'].length; i++)
          QuestionOptions(
            isCorrect: questionAndAnswerData['correct_answer'] ==
                questionAndAnswerData['incorrect_answers'][i],
            onSelected: goToNextQuestion,
            questionOptions: questionAndAnswerData['incorrect_answers'][i],
          ),
        QuestionOptions(
          isCorrect: true,
          onSelected: goToNextQuestion,
          questionOptions: questionAndAnswerData['correct_answer'],
        ),
      ],
    );
  }




  //// -----------------------------------Timer ----------------------------->
  Widget _Timer() {
    return Text('Time Left: $timerSeconds seconds');
  }


  //// ----------------------------------- Next Button ----------------------------->
  Widget _NextButton() {
    return CustomButton(
      height: 56,
      width: 336.w,
      color: Color(0xFF5424FD),
      onTap: () => goToNextQuestion(false),
      title: "Next",
    );
  }
}
