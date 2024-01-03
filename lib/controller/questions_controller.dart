// questions_controller.dart

import 'dart:async';

import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import '../view/pages/result/score_scren.dart';
import 'questions.dart';

class QuestionController extends GetxController with SingleGetTickerProviderMixin {
  late AnimationController animationController;
  PageController? _pageController;

  PageController? get pageController => this._pageController;

  List<Question> _questions = sample_data.map(
        (question) => Question(
      id: question['id'],
      question: question['question'],
      options: question['options'],
      answer: question['answer_index'],
    ),
  ).toList();

  List<Question> get questions => this._questions;

  bool _isAnswered = false;
  bool get isAnswered => this._isAnswered;

  late int _correctAns;
  int get correctAns => this._correctAns;

  late int _selectedAns;
  int get selectedAns => this._selectedAns;

  RxInt _questionNumber = 0.obs;
  RxInt get questionNumber => this._questionNumber;

  int _numOfCorrectAns = 0;
  int get numOfCorrectAns => this._numOfCorrectAns;


  int _inCorrectAns = 0;
  int get innumOfCorrectAns => this._inCorrectAns;



  RxInt _timerCountdown = 60.obs;
  late Timer _timer;
  RxInt get timerCountdown => _timerCountdown;



  void startTimer() {
    _timer = Timer.periodic(Duration(seconds: 20), (timer) {
      if (_timerCountdown.value > 0) {
        _timerCountdown.value--;
        update();
      } else {
        _timer.cancel();
        nextQuestion();
      }
    });
  }



  @override
  void onInit() {
    startTimer();
    animationController =
        AnimationController(duration: Duration(seconds: 60), vsync: this)

      ..addListener(() {
        // update like setState
        update();
      });


    animationController.forward().whenComplete(nextQuestion);
    _pageController = PageController();
    super.onInit();
  }




  @override
  void onClose() {
    super.onClose();
    animationController.dispose();
  }

  void checkAns(Question question, int selectedIndex) {
    _isAnswered = true;
    _correctAns = question.answer!;
    _selectedAns = selectedIndex;

    if (_correctAns == _selectedAns) {
      _numOfCorrectAns++;
    }
    else{
      _inCorrectAns++;
    };

    animationController.stop();
    update();

    Future.delayed(Duration(seconds: 1), () {
      nextQuestion();
    });
  }

  void nextQuestion() {
    if (_questionNumber.value != _questions.length) {
      _isAnswered = false;
      _pageController!.nextPage(duration: Duration(milliseconds: 250), curve: Curves.ease);

      animationController.reset();
      startTimer();

      animationController.forward().whenComplete(nextQuestion);
    } else {
      Get.to(ScoreScreen());
    }
  }

  void updateTheQnNum(int index) {
    _questionNumber.value = index + 1;
  }
}
