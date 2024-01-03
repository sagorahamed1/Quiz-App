// question_card.dart

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:quiz_app/controller/questions_controller.dart';
import '../../../utils/app_colors.dart';
import 'options.dart';

class QuestionCard extends StatelessWidget {
  const QuestionCard({
    required this.question,
  });

  final question;

  @override
  Widget build(BuildContext context) {
    QuestionController _controller = Get.put(QuestionController());
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(25),
      ),
      child: Column(
        children: [
          Stack(
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
                  child: Center(child: Text("${_controller.timerCountdown}")),
                ),
              ),
              Positioned(
                bottom: -50.h,
                child: Container(
                  height: 150.h,
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
                              "${_controller.numOfCorrectAns}",
                              style: TextStyle(
                                color: Colors.green,
                                fontSize: 18.sp,
                              ),
                            ),
                            Text(
                              "${_controller.innumOfCorrectAns}",
                              style: TextStyle(
                                color: Colors.red,
                                fontSize: 18.sp,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 30),
                        Align(
                          alignment: Alignment.center,
                          child: Column(
                            children: [
                              Text(
                                question.question,
                                style: Theme.of(context)
                                    .textTheme
                                    .headline6!
                                    .copyWith(color: kBlackColor),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 150),
          ...List.generate(
            question.options.length,
                (index) => Option(
              index: index,
              text: question.options[index],
              press: () => _controller.checkAns(question, index),
            ),
          ),
        ],
      ),
    );
  }
}
