// options.dart

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:quiz_app/controller/questions_controller.dart';
import 'package:quiz_app/utils/app_colors.dart';

class Option extends StatelessWidget {
  Option({
    this.text,
    required this.index,
    required this.press,
  });

  String? text;
  int index;
  VoidCallback press;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GetBuilder<QuestionController>(
          init: QuestionController(),
          builder: (qnController) {
            Color getTheRightColor() {
              if (qnController.isAnswered) {
                if (index == qnController.correctAns) {
                  return kGreenColor;
                } else if (index == qnController.selectedAns && qnController.selectedAns != qnController.correctAns) {
                  return kRedColor;
                }
              }
              return kGrayColor;
            }

            IconData getTheRightIcon() {
              return getTheRightColor() == kRedColor ? Icons.close : Icons.done;
            }

            return Column(
              children: [
                InkWell(
                  onTap: press,
                  child: Container(
                    margin: EdgeInsets.only(top: kDefaultPadding),
                    padding: EdgeInsets.all(kDefaultPadding),
                    decoration: BoxDecoration(
                      border: Border.all(color: getTheRightColor()),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "${index + 1}. $text",
                          style: TextStyle(color: getTheRightColor(), fontSize: 16),
                        ),
                        Container(
                          height: 26,
                          width: 26,
                          decoration: BoxDecoration(
                            color: getTheRightColor() == kGrayColor ? Colors.transparent : getTheRightColor(),
                            borderRadius: BorderRadius.circular(50),
                            border: Border.all(color: getTheRightColor()),
                          ),
                          child: getTheRightColor() == kGrayColor ? null : Icon(getTheRightIcon(), size: 16),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            );
          },
        ),
      ],
    );
  }
}
