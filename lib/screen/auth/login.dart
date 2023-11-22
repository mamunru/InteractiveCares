import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:email_validator/email_validator.dart';
import 'package:shafinbd/config/myStyle.dart';
import 'package:shafinbd/route/routeName.dart';
import 'package:shafinbd/screen/widget/mybutton.dart';

import '../../controller/loginController.dart';

class LoginPage extends StatelessWidget {
  TextEditingController username = TextEditingController();

  TextEditingController password = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return GetBuilder<loginController>(builder: (logincontroller) {
      return Scaffold(
          backgroundColor: Colors.white,
          body: SingleChildScrollView(
            child: Container(
              child: Column(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(30.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        SizedBox(
                          height: 150,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            'login_text'.tr,
                            style: myStyle.headerText,
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.all(5),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10),
                              boxShadow: const [
                                BoxShadow(
                                    color: Color.fromRGBO(143, 148, 251, .2),
                                    blurRadius: 20.0,
                                    offset: Offset(0, 10))
                              ]),
                          child: Form(
                            key: _formKey,
                            child: Column(
                              children: <Widget>[
                                SizedBox(
                                  height: 10,
                                ),
                                Visibility(
                                    visible: false,
                                    child: Text(
                                      'UserName Or Password Wrong !!',
                                      style: myStyle.detailText16
                                          .copyWith(color: Colors.red),
                                    )),
                                Container(
                                  padding: const EdgeInsets.all(8.0),
                                  decoration: BoxDecoration(
                                      border: Border(
                                          bottom: BorderSide(
                                              color: Colors.grey.shade100))),
                                  child: TextFormField(
                                    controller: username,
                                    keyboardType: TextInputType.emailAddress,
                                    style: const TextStyle(fontSize: 18),
                                    validator: (value) {
                                      bool emailv = EmailValidator.validate(
                                          value.toString());
                                      if (value == null ||
                                          value.isEmpty ||
                                          emailv == false) {
                                        return 'Email or User Name is Empty or Invalide';
                                      }
                                      return null;
                                    },
                                    decoration: InputDecoration(
                                        border: InputBorder.none,
                                        hintText: "Email or User Name",
                                        hintStyle:
                                            TextStyle(color: Colors.grey[400])),
                                  ),
                                ),
                                Container(
                                  padding: const EdgeInsets.all(8.0),
                                  child: TextFormField(
                                    controller: password,
                                    obscureText: true,
                                    style: const TextStyle(fontSize: 18),
                                    validator: (value) {
                                      if (value == null || value.isEmpty) {
                                        return 'Password';
                                      }
                                      return null;
                                    },
                                    decoration: InputDecoration(
                                        border: InputBorder.none,
                                        hintText: "Password",
                                        hintStyle:
                                            TextStyle(color: Colors.grey[400])),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        MyButton(
                            ontap: () {
                              Get.offAllNamed(routeName.homepage);
                            },
                            title: 'login'.tr),
                        MyButton(
                          ontap: () {
                            Get.toNamed(routeName.registration);
                          },
                          title: 'registration'.tr,
                          color: Color.fromARGB(255, 240, 240, 240),
                          textcolor: Colors.red,
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Container(
                            child: InkWell(
                          onTap: () {
                            Get.bottomSheet(Container(
                              color: Colors.white,
                              height: MediaQuery.of(context).size.height * .45,
                              width: MediaQuery.of(context).size.width,
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                              ),
                            ));
                          },
                          child: const Text(
                            "Forgot Password?",
                            style: TextStyle(
                                color: Color.fromRGBO(143, 148, 251, 1)),
                          ),
                        )),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ));
    });
  }
}
