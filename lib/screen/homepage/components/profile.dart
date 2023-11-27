import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:shafinbd/config/myStyle.dart';
import 'package:shafinbd/controller/indexController.dart';
import 'package:shafinbd/controller/usercontroller.dart';
import 'package:shafinbd/route/routeName.dart';
import 'package:shafinbd/screen/widget/imgae/network_catch.dart';

enum SingingCharacter { en, bn }

class Profile extends StatelessWidget {
  const Profile({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<UserController>(builder: (usercontroller) {
      return Scaffold(
        body: CustomScrollView(
          //  mainAxisAlignment: MainAxisAlignment.center,
          slivers: <Widget>[
            SliverAppBar(
              expandedHeight: 200.0,
              floating: false,
              pinned: true,
              // leading: Container(
              //   height: 60,
              //   width: 60,
              //   child: NetworkCatchImage(
              //       width: 60,
              //       boxfit: BoxFit.contain,
              //       imagekey:
              //           'https://thumbs.dreamstime.com/b/%D0%BF%D0%B5%D1%87%D0%B0%D1%82%D1%8C-woman-avatar-profile-female-face-icon-vector-illustration-226594813.jpg',
              //       image:
              //           'https://thumbs.dreamstime.com/b/%D0%BF%D0%B5%D1%87%D0%B0%D1%82%D1%8C-woman-avatar-profile-female-face-icon-vector-illustration-226594813.jpg',
              //       height: 60),
              // ),
              flexibleSpace: FlexibleSpaceBar(
                centerTitle: true,
                title: Text(
                  usercontroller.name,
                  style: myStyle.headerText3.copyWith(color: Colors.black),
                ),
                background: Padding(
                  padding: const EdgeInsets.only(top: 25),
                  child: Container(
                    height: 160,
                    child: NetworkCatchImage(
                        boxfit: BoxFit.cover,
                        imagekey:
                            'https://thumbs.dreamstime.com/b/%D0%BF%D0%B5%D1%87%D0%B0%D1%82%D1%8C-woman-avatar-profile-female-face-icon-vector-illustration-226594813.jpg',
                        image:
                            'https://thumbs.dreamstime.com/b/%D0%BF%D0%B5%D1%87%D0%B0%D1%82%D1%8C-woman-avatar-profile-female-face-icon-vector-illustration-226594813.jpg',
                        height: 160),
                  ),
                ),
              ),
            ),
            SliverList(
              delegate: SliverChildListDelegate([
                Visibility(
                  visible: usercontroller.user != 0 ? true : false,
                  child: mycard(
                    text: "personal_info".tr,
                    url1: () {},
                    icon1: Icons.person,
                  ),
                ),
                Visibility(
                  visible: usercontroller.user != 0 ? true : false,
                  child: mycard(
                    text: "change_pass".tr,
                    url1: () {},
                    icon1: Icons.lock,
                  ),
                ),
                Visibility(
                  visible: usercontroller.user == 0 ? true : false,
                  child: mycard(
                    text: "login".tr,
                    url1: () {
                      usercontroller.reset();
                      Get.toNamed(routeName.login);
                    },
                    icon1: Icons.lock,
                  ),
                ),
                SizedBox(
                  height: 70,
                  width: 600,
                  child: InkWell(
                    onTap: () {
                      Get.bottomSheet(Container(
                        color: Colors.white,
                        height: 250,
                        width: MediaQuery.of(context).size.width,
                        child:
                            GetBuilder<indexController>(builder: (controller) {
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
                Visibility(
                  visible: usercontroller.user.value == 0 ? false : true,
                  child: mycard(
                    text: "certificates".tr,
                    url1: () {},
                    icon1: Icons.money,
                  ),
                ),
                mycard(text: "book".tr, url1: () {}, icon1: Icons.book),
                Visibility(
                    visible: usercontroller.user.value == 0 ? false : true,
                    child: mycard(
                        text: "payment".tr, url1: () {}, icon1: Icons.payment)),
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
                    text: "report".tr,
                    url1: () {},
                    icon1: Icons.report_problem),
                mycard(
                  text: "terms".tr,
                  url1: () {},
                  icon1: Icons.pages,
                ),
                Visibility(
                  visible: usercontroller.user.value == 0 ? false : true,
                  child: mycard(
                    text: "logout".tr,
                    url1: () {
                      // Get.to(login());
                      usercontroller.logout();
                    },
                    icon1: Icons.logout,
                  ),
                )
              ]),
            )
          ],
        ),
      );
    });
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
