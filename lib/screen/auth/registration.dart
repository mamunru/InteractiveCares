import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shafinbd/config/myStyle.dart';
import 'package:shafinbd/controller/usercontroller.dart';
import 'package:shafinbd/route/routeName.dart';
import 'package:shafinbd/screen/widget/mybutton.dart';

class registration extends StatelessWidget {
  registration({Key? key}) : super(key: key);
  TextEditingController name = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        elevation: 1,
        //backgroundColor: Colors.white10,
        title: Text(
          "Registation",
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: GetBuilder<UserController>(builder: (usercontroller) {
        return Container(
          child: Form(
            key: _formKey,
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Visibility(
                      visible: usercontroller.regerrorshow,
                      child: Text(
                        usercontroller.regerror,
                        style: myStyle.headerText2.copyWith(color: Colors.red),
                      )),
                  const SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    controller: name,
                    keyboardType: TextInputType.emailAddress,
                    style: const TextStyle(fontSize: 18),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Name is Empty';
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        label: Text('Name'),
                        hintText: "Enter Your Full Name",
                        hintStyle: TextStyle(color: Colors.grey[400])),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  TextFormField(
                    controller: email,
                    keyboardType: TextInputType.emailAddress,
                    style: const TextStyle(fontSize: 18),
                    validator: (value) {
                      bool emailv = EmailValidator.validate(value.toString());
                      if (value == null || value.isEmpty || emailv == false) {
                        return 'Email is Empty or Invalide';
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        label: Text('Email'),
                        hintText: "Enter Your Email",
                        hintStyle: TextStyle(color: Colors.grey[400])),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  TextFormField(
                    controller: password,
                    obscureText: usercontroller.showpassword,
                    keyboardType: TextInputType.emailAddress,
                    style: const TextStyle(fontSize: 18),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Password is Empty';
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                        suffixIcon: IconButton(
                          icon: Icon(usercontroller.showpassword
                              ? Icons.visibility_off
                              : Icons.visibility),
                          onPressed: () {
                            usercontroller.passwordsee();
                          },
                        ),
                        border: OutlineInputBorder(),
                        label: Text('Password'),
                        hintText: "Enter Your Password",
                        hintStyle: TextStyle(color: Colors.grey[400])),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  usercontroller.regloading
                      ? Container(
                          height: 50,
                          child: Center(
                            child: CircularProgressIndicator(),
                          ),
                        )
                      : MyButton(
                          color: Color.fromARGB(255, 8, 49, 215),
                          ontap: () {
                            if (_formKey.currentState!.validate() ?? false) {
                              usercontroller.tryregistration(
                                  name: name.text,
                                  email: email.text,
                                  password: password.text);
                            }
                          },
                          title: 'registration'.tr)
                ],
              ),
            ),
          ),
        );
      }),
    );
  }
}
