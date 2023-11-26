import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:shafinbd/config/myStyle.dart';
import 'package:shafinbd/controller/indexController.dart';

enum SingingCharacter { en, bn }

class Profile extends StatelessWidget {
  const Profile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        //  mainAxisAlignment: MainAxisAlignment.center,
        slivers: <Widget>[
          SliverAppBar(
            expandedHeight: 200.0,
            floating: false,
            pinned: true,
            flexibleSpace: FlexibleSpaceBar(
              title: Text(
                'Profile App',
                style: myStyle.headerText3.copyWith(color: Colors.black),
              ),
              background: Padding(
                padding: const EdgeInsets.only(top: 25),
                child: Image.network(
                  'https://thumbs.dreamstime.com/b/%D0%BF%D0%B5%D1%87%D0%B0%D1%82%D1%8C-woman-avatar-profile-female-face-icon-vector-illustration-226594813.jpg',
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          SliverList(
            delegate: SliverChildListDelegate([
              const Card(
                child: Column(
                  children: [
                    // Row(
                    //   children: [
                    //     Text(
                    //       "Account",
                    //       style: TextStyle(
                    //         fontSize: 20,
                    //         fontStyle: FontStyle.normal,
                    //       ),
                    //     ),
                    //     SizedBox(
                    //       width: 270,
                    //     ),
                    //     InkWell(
                    //       child: Text(
                    //         "Logout",
                    //         style: TextStyle(
                    //           fontSize: 15,
                    //           fontStyle: FontStyle.normal,
                    //           color: Color.fromARGB(255, 245, 88, 77),
                    //           fontWeight: FontWeight.bold,
                    //         ),
                    //       ),
                    //     ),
                    //   ],
                    // )
                  ],
                ),
              ),
              mycard(
                text: "personal_info".tr,
                url1: () {},
                icon1: Icons.person,
              ),
              mycard(
                text: "change_pass".tr,
                url1: () {},
                icon1: Icons.lock,
              ),
              // mycard(
              //     text: "Device Manager",
              //     url1: () {},
              //     icon1: Icons.device_hub_sharp),
              SizedBox(
                height: 70,
                width: 600,
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
                                value: 'bn',
                                groupValue: controller.character,
                                onChanged: (value) {
                                  controller.changeLanguage(value!);
                                  print('++++++++++++bn++++++++++');
                                  Get.back();
                                },
                              ),
                              RadioListTile(
                                title: Text("English"),
                                value: 'en',
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
                  child: Card(
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Icon(Icons.language),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Text(
                          "language".tr,
                          style: const TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              mycard(
                text: "certificates".tr,
                url1: () {},
                icon1: Icons.money,
              ),
              mycard(text: "book".tr, url1: () {}, icon1: Icons.book),
              mycard(text: "payment".tr, url1: () {}, icon1: Icons.payment),
              mycard(text: "blog".tr, url1: () {}, icon1: Icons.block),
              mycard(
                text: "store".tr,
                url1: () {},
                icon1: Icons.book_outlined,
              ),
              InkWell(
                onTap: () {
                  print("Bangladesh");
                },
                child: mycard(
                    text: "hotline".trParams({'number': '169010'}),
                    url1: () {
                      // Get.to(hotline());
                    },
                    icon1: Icons.phone),
              ),
              mycard(
                  text: "report".tr, url1: () {}, icon1: Icons.report_problem),
              mycard(
                text: "terms".tr,
                url1: () {},
                icon1: Icons.pages,
              ),
              mycard(
                text: "logout".tr,
                url1: () {
                  // Get.to(login());
                },
                icon1: Icons.logout,
              )
            ]),
          )
        ],
      ),
    );
  }

  Widget mycard(
      {required String text, required VoidCallback url1, required icon1}) {
    return SizedBox(
      height: 70,
      width: 600,
      child: InkWell(
        onTap: url1,
        child: Card(
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Icon(icon1),
              ),
              const SizedBox(
                width: 10,
              ),
              Text(
                text,
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
