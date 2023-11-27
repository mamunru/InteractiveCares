import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:shafinbd/config/myStyle.dart';
import 'package:shafinbd/controller/indexController.dart';

import 'components/index.dart';
import 'components/mycpurse.dart';
import 'components/profile.dart';

class Homepage extends StatelessWidget {
  Homepage({super.key});
  List pages = [IndexPage(), MyCourse(), Profile()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder<indexController>(
        builder: (controller) {
          return pages[controller.index.value];
        },
      ),
      bottomNavigationBar: GetBuilder<indexController>(
        builder: (_) {
          return Container(
            height: 60,
            padding: EdgeInsets.only(top: 8),
            width: MediaQuery.of(context).size.width,
            color: Colors.white,
            child: Row(
              // backgroundColor: Colors.white,

              // showSelectedLabels: false,
              // showUnselectedLabels: false,
              // unselectedItemColor: Colors.black,
              // //backgroundColor: Colors.red,
              // //backgroundColor: Colors.white,
              // //elevation: 1.0,
              children: [
                Expanded(
                  child: InkWell(
                      onTap: () {
                        _.onchange(0);
                      },
                      child: Container(
                        width: MediaQuery.of(context).size.width / 3,
                        height: 50,
                        child: Column(
                          children: [
                            Center(
                              child: FaIcon(
                                FontAwesomeIcons.house,
                                size: _.index == 0 ? 25 : 20,
                                color: _.index == 0
                                    ? myStyle.special
                                    : Colors.black,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 2),
                              child: Text(
                                'home'.tr,
                                style: myStyle.detailText12.copyWith(
                                  color: _.index == 0
                                      ? myStyle.special
                                      : Colors.black,
                                ),
                              ),
                            )
                          ],
                        ),
                      )),
                ),
                Expanded(
                  child: InkWell(
                      onTap: () {
                        _.onchange(1);
                      },
                      child: Container(
                        width: MediaQuery.of(context).size.width / 3,
                        height: 50,
                        child: Column(
                          children: [
                            Center(
                              child: FaIcon(
                                FontAwesomeIcons.book,
                                size: _.index == 1 ? 25 : 20,
                                color: _.index == 1
                                    ? myStyle.special
                                    : Colors.black,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 2),
                              child: Text(
                                'my_courses'.tr,
                                style: myStyle.detailText12.copyWith(
                                  color: _.index == 1
                                      ? myStyle.special
                                      : Colors.black,
                                ),
                              ),
                            )
                          ],
                        ),
                      )),
                ),
                Expanded(
                  child: InkWell(
                      onTap: () {
                        _.onchange(2);
                      },
                      child: Container(
                        width: MediaQuery.of(context).size.width / 3,
                        height: 50,
                        child: Column(
                          children: [
                            Center(
                              child: FaIcon(
                                FontAwesomeIcons.solidUser,
                                size: _.index == 2 ? 25 : 20,
                                color: _.index == 2
                                    ? myStyle.special
                                    : Colors.black,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 2),
                              child: Text(
                                'profile'.tr,
                                style: myStyle.detailText12.copyWith(
                                  color: _.index == 2
                                      ? myStyle.special
                                      : Colors.black,
                                ),
                              ),
                            )
                          ],
                        ),
                      )),
                )
              ],
              // currentIndex: _selectedIndex,
              // selectedItemColor: Theme.of(context).focusColor,
              // onTap: _onItemTapped,
            ),
          );
        },
      ),
    );
  }
}
