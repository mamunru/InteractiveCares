import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shafinbd/route/routeName.dart';
import 'package:shafinbd/screen/widget/mybutton.dart';

class registration extends StatelessWidget {
  const registration({Key? key}) : super(key: key);
  //Custome Text Field:
  Widget textfield01({required String hint, required String lable}) {
    return TextField(
      decoration: InputDecoration(
        hintText: hint,
        labelText: lable,
        border: OutlineInputBorder(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.white10,
        title: Text(
          "Registation",
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                children: [
                  textfield01(hint: "Enter Your Full Name", lable: "Name"),
                  SizedBox(
                    height: 15,
                  ),
                  textfield01(hint: "Enter Your Emain", lable: "Email"),
                  SizedBox(
                    height: 15,
                  ),
                  textfield01(hint: "Phone Number", lable: "Phone"),
                  SizedBox(
                    height: 15,
                  ),
                  MyButton(
                      color: Color.fromARGB(255, 8, 49, 215),
                      ontap: () {
                        Get.toNamed(routeName.login);
                      },
                      title: 'registration'.tr)
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
