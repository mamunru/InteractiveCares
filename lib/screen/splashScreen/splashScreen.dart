import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rive/rive.dart';
import 'package:shafinbd/config/myStyle.dart';

class splashScreen extends StatelessWidget {
  const splashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            height: MediaQuery.of(context).size.height * .70,
            width: MediaQuery.of(context).size.width,
            child: const Center(
              child: RiveAnimation.asset(
                fit: BoxFit.contain,
                'assets/images/splash.riv',
              ),
            ),
          ),
          Text(
            'Shafin-BD',
            style: myStyle.headerText2,
          )
        ],
      ),
    );
  }
}
