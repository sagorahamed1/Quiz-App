

import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  CustomButton(
      {Key? key,
        this.color,
        this.height,
        this.width,
        required this.title,
        required this.onTap,
        this.loading = false})
      : super(key: key);

  Color? color;
  double? height;
  double? width;
  String title;
  VoidCallback? onTap;
  bool loading;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: InkWell(
        onTap: onTap,
        child: Container(
          height: height,
          width: width,
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(30),
          ),
          child: loading
              ? Center(
              child: CircularProgressIndicator(
                color: Colors.white,
              ))
              : Center(
            child: Text(
              title,
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
