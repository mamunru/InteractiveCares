import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:shafinbd/config/myStyle.dart';
import 'package:shafinbd/controller/usercontroller.dart';

import '../../controller/indexController.dart';

class MyAppbar extends StatelessWidget {
  MyAppbar({super.key});
  UserController usercontroller = Get.find();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Row(
        children: [
          Expanded(
            child: ListTile(
              title: Padding(
                padding: const EdgeInsets.all(3.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Hey ,',
                      style: myStyle.detailText14.copyWith(
                          color: Colors.black54, fontWeight: FontWeight.normal),
                    ),
                    SizedBox(
                      height: 2,
                    ),
                    Text(
                      usercontroller.name,
                      style: myStyle.headerText4
                          .copyWith(fontWeight: FontWeight.w500),
                    )
                  ],
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: InkWell(
              onTap: () {
                Get.bottomSheet(Container(
                  color: Colors.white,
                  height: 250,
                  width: MediaQuery.of(context).size.width,
                  child: GetBuilder<indexController>(builder: (controller) {
                    return Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Title(
                            color: Colors.black,
                            child: Text(
                              "language".tr,
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 25,
                              ),
                            ),
                          ),
                          RadioListTile(
                            title: Text('বাংলা'),
                            value: 'bn_BD',
                            groupValue: controller.character,
                            onChanged: (value) {
                              controller.changeLanguage(value!);
                              print('++++++++++++bn++++++++++');
                              Get.back();
                            },
                          ),
                          RadioListTile(
                            title: Text("English"),
                            value: 'en_US',
                            groupValue: controller.character,
                            onChanged: (value) {
                              print(Get.locale);
                              controller.changeLanguage(value!);
                              Get.back();
                              print(controller.character);
                            },
                          ),
                        ],
                      ),
                    );
                  }),
                ));
              },
              child: Text(
                'lg'.tr,
                style: myStyle.detailText16,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 15),
            child: FaIcon(
              FontAwesomeIcons.bell,
              color: Colors.black,
            ),
          ),
        ],
      ),
    );
  }
}
