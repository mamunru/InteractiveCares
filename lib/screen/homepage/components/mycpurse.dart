import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:shafinbd/config/demo.dart';
import 'package:shafinbd/config/myStyle.dart';
import 'package:shafinbd/controller/usercontroller.dart';
import 'package:shafinbd/route/routeName.dart';
import 'package:shafinbd/screen/auth/login.dart';
import 'package:shafinbd/screen/widget/cardcourse.dart';
import 'package:shafinbd/screen/widget/mybutton.dart';

import '../../widget/mycoursecard.dart';

class MyCourse extends StatelessWidget {
  const MyCourse({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<UserController>(builder: (usercontroller) {
      return usercontroller.user != 0
          ? SafeArea(
              child: SingleChildScrollView(
              child: Column(
                children: courses.map((e) => MyCourseCard(e: e)).toList(),
              ),
            ))
          : SafeArea(
              child: Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Please Login Or Regestration for full Access',
                    style: myStyle.headerText2,
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  MyButton(
                      width: MediaQuery.of(context).size.width - 20,
                      ontap: () {
                        usercontroller.reset();
                        Get.toNamed(routeName.login);
                      },
                      title: 'login'.tr),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    'OR',
                    style: myStyle.headerText2,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  MyButton(
                      width: MediaQuery.of(context).size.width - 20,
                      color: myStyle.extra,
                      ontap: () {
                        Get.toNamed(routeName.registration);
                      },
                      title: 'registration'.tr)
                ],
              ),
            ));
    });
  }
}
