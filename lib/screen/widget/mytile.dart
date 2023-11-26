import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:shafinbd/config/myStyle.dart';

class MyTile extends StatelessWidget {
  String title;
  String trailingtext;
  VoidCallback ontap;
  MyTile(
      {required this.title,
      required this.trailingtext,
      required this.ontap,
      super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        child: Row(
          children: [
            Expanded(
                child: Text(
              title,
              style: myStyle.headerText3,
            )),
            GestureDetector(
              onTap: ontap,
              child: Container(
                  width: 80,
                  height: 30,
                  // color: Colors.amber,
                  decoration: BoxDecoration(
                      color: Color.fromARGB(255, 205, 209, 209),
                      borderRadius: BorderRadius.circular(5)
                      // border: Border.all()
                      ),
                  child: Center(
                      child: Text(
                    trailingtext,
                    style:
                        myStyle.detailText14.copyWith(color: myStyle.textcolor),
                  ))),
            )
          ],
        ),
      ),
    );
  }
}
