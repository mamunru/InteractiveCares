import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:shafinbd/config/myStyle.dart';
import 'package:shafinbd/route/routeName.dart';
import 'package:shafinbd/screen/widget/mybutton.dart';

import 'imgae/network_catch.dart';

class MyCourseCard extends StatelessWidget {
  var e;
  MyCourseCard({required this.e, super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: InkWell(
      onTap: () {
        Get.toNamed(routeName.mycourses, arguments: e);
      },
      child: Card(
        child: Container(
          height: 160,
          child: Row(
            children: [
              Container(
                height: 150,
                width: MediaQuery.of(context).size.width / 2.5,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: NetworkCatchImage(
                      imagekey: e['image'],
                      image: e['image'],
                      height: 140,
                      boxfit: BoxFit.fill,
                      width: MediaQuery.of(context).size.width / 2.5,
                    ),
                  ),
                ),
              ),
              Expanded(
                  child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      e['name'],
                      style: myStyle.headerText3,
                      maxLines: 2,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    child: Text(
                      e['details'],
                      style: myStyle.detailText16,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8),
                    child: Text(
                      'Class : 10/20',
                      style: myStyle.detailText16,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8),
                    child: LinearPercentIndicator(
                      width: MediaQuery.of(context).size.width / 2,
                      lineHeight: 5.0,
                      percent: 0.5,
                      backgroundColor: const Color.fromRGBO(158, 158, 158, 1),
                      progressColor: myStyle.textcolor,
                    ),
                  ),
                ],
              ))
            ],
          ),
        ),
      ),
    ));
  }
}
