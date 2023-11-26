import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:shafinbd/config/demo.dart';
import 'package:shafinbd/config/myStyle.dart';
import 'package:shafinbd/screen/widget/cardcourse.dart';
import 'package:shafinbd/screen/widget/myappbar.dart';
import 'package:shafinbd/screen/widget/mybutton.dart';
import 'package:shafinbd/screen/widget/slider.dart';

import '../../widget/imgae/network_catch.dart';
import '../../widget/mytile.dart';

class IndexPage extends StatelessWidget {
  const IndexPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // SizedBox(
        //   height: 25,
        // ),
        Container(
          height: 50,
          width: MediaQuery.of(context).size.width,
          child: MyAppbar(),
        ),
        SizedBox(
          height: 2,
        ),
        Expanded(
          // height: MediaQuery.of(context).size.height * .83,
          // width: MediaQuery.of(context).size.width,
          // color: Colors.amber,
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(4.0),
              child: Column(
                children: [
                  Card(
                    child: Container(
                      height: 150,
                      // width: MediaQuery.of(context).size.width,
                      // decoration: BoxDecoration(y 44444444
                      //     borderRadius: BorderRadius.circular(20)),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: NetworkCatchImage(
                            imagekey:
                                'https://e0.pxfuel.com/wallpapers/406/36/desktop-wallpaper-educational-computer-education.jpg'
                                    .toString(),
                            image:
                                'https://e0.pxfuel.com/wallpapers/406/36/desktop-wallpaper-educational-computer-education.jpg'
                                    .toString(),
                            height: 150),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    decoration: BoxDecoration(
                        color: Color.fromARGB(255, 231, 234, 234),
                        borderRadius: BorderRadius.circular(10)),
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: 'Search...',
                        prefixIcon: Icon(Icons.search),
                        filled: true,
                        fillColor: const Color.fromARGB(255, 245, 238, 238)
                            .withOpacity(0.12),
                        border: OutlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Container(
                    height: 200,
                    width: MediaQuery.of(context).size.width,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                            height: 40,
                            width: MediaQuery.of(context).size.width,
                            child: MyTile(
                              title: 'on_courses'.tr,
                              trailingtext: 'view'.tr,
                              ontap: () {},
                            )),
                        const SizedBox(
                          height: 8,
                        ),
                        Container(
                          height: 150,
                          child: ListView.builder(
                              itemCount: 5,
                              scrollDirection: Axis.horizontal,
                              itemBuilder: (index, _) {
                                return Card(
                                  color: Color.fromARGB(143, 237, 239, 246),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10.0),
                                  ),
                                  //elevation: 5,
                                  child: Container(
                                    height: 150,
                                    width:
                                        MediaQuery.of(context).size.width / 2,
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        SizedBox(
                                          height: 10,
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Text(
                                            'Basics of C Programming with Monir',
                                            style: myStyle.detailText15,
                                            textAlign: TextAlign.center,
                                          ),
                                        ),
                                        const SizedBox(
                                          height: 15,
                                        ),
                                        LinearPercentIndicator(
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width /
                                              2.1,
                                          lineHeight: 5.0,
                                          percent: 0.5,
                                          backgroundColor: const Color.fromRGBO(
                                              158, 158, 158, 1),
                                          progressColor: myStyle.textcolor,
                                        ),
                                        Padding(
                                          padding: EdgeInsets.only(
                                              left: 8, top: 4, bottom: 5),
                                          child: Text('40% is complete'),
                                        ),
                                        Center(
                                          child: MyButton(
                                            ontap: () {},
                                            title: 'continue'.tr,
                                            height: 30,
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width /
                                                3,
                                            color: myStyle.special,
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                );
                              }),
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    // height: 400,
                    width: MediaQuery.of(context).size.width,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                            height: 40,
                            width: MediaQuery.of(context).size.width,
                            child: MyTile(
                              title: 'categories'.tr,
                              trailingtext: 'view'.tr,
                              ontap: () {},
                            )),
                        const SizedBox(
                          height: 8,
                        ),
                        Container(
                          height: 350,
                          width: MediaQuery.of(context).size.width,
                          child: GridView.builder(
                              scrollDirection: Axis.horizontal,
                              gridDelegate:
                                  const SliverGridDelegateWithFixedCrossAxisCount(
                                      crossAxisCount: 2,
                                      crossAxisSpacing: 2,
                                      mainAxisSpacing: 2,
                                      childAspectRatio: 1 //mainAxisExtent: 256,
                                      ),
                              itemCount: menu.length,
                              itemBuilder: (_, index) {
                                var item = menu[index];
                                return Card(
                                  child: Column(
                                    children: [
                                      Container(
                                        child: Opacity(
                                          opacity: .85,
                                          child: NetworkCatchImage(
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width /
                                                  2.2,
                                              imagekey: item['name'],
                                              image: item!['image'],
                                              height: 110),
                                        ),
                                      ),
                                      SizedBox(
                                        height: 5,
                                      ),
                                      Center(
                                          child: Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 10),
                                        child: Text(
                                          item['name'].toString(),
                                          style: myStyle.detailText16,
                                          textAlign: TextAlign.center,
                                          maxLines: 2,
                                        ),
                                      )),
                                    ],
                                  ),
                                );
                              }),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Container(
                      height: 40,
                      width: MediaQuery.of(context).size.width,
                      child: MyTile(
                        title: 'courses'.tr,
                        trailingtext: 'view'.tr,
                        ontap: () {},
                      )),
                  const SizedBox(
                    height: 8,
                  ),
                  Container(
                      child: Column(
                    children: courses.map((e) => CardCourse(e: e)).toList(),
                  ))
                ],
              ),
            ),
          ),
        )
      ],
    ));
  }
}
