import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class MyButton extends StatelessWidget {
  VoidCallback ontap;
  String title;
  double? height;
  double? width;
  Color? color;
  Color? textcolor;
  MyButton(
      {required this.ontap,
      required this.title,
      this.height = 50,
      this.width = 1,
      this.color = Colors.red,
      this.textcolor = Colors.white,
      super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: InkWell(
      onTap: ontap,
      child: Container(
        height: height,
        width: width == 1 ? MediaQuery.of(context).size.width : width,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10), color: color),
        child: Center(
          child: Text(
            title.toString(),
            style: TextStyle(
                fontSize: 16, color: textcolor, fontWeight: FontWeight.bold),
          ),
        ),
      ),
    ));
  }
}
