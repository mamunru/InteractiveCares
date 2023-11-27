import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:chewie/chewie.dart';
import 'package:shafinbd/config/myStyle.dart';
import 'package:shafinbd/screen/courses/components/details.dart';
import 'package:shafinbd/screen/courses/components/lession.dart';
import 'package:shafinbd/screen/widget/mybutton.dart';

import '../../controller/videocontroller.dart';

class VideoDetailsPage extends StatelessWidget {
  // final VideoDetailsController controller = Get.put(VideoDetailsController());

  List itemList = [CourseDetails(), LessionList()];

  @override
  Widget build(BuildContext context) {
    return GetBuilder<VideoDetailsController>(builder: (controller) {
      return Scaffold(
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const SizedBox(
              height: 25,
            ),
            controller.isVideoLoading
                ? Container(
                    height: 250,
                    child: Center(
                      child: CircularProgressIndicator(),
                    ))
                : Container(
                    height: 250,
                    width: MediaQuery.of(context).size.width,
                    child: Chewie(
                        controller: ChewieController(
                            aspectRatio: 1.6,
                            autoInitialize: true,
                            looping: false,
                            autoPlay: true,
                            videoPlayerController:
                                controller.videoPlayerController)),
                  ),

            // Divider between video and buttons
            Divider(height: 1, color: Colors.grey),
            // Buttons for switching between details and lesson list

            Container(
              height: 30,
              width: MediaQuery.of(context).size.width,
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: InkWell(
                      onTap: () {
                        Get.back();
                      },
                      child: FaIcon(
                        FontAwesomeIcons.angleLeft,
                        size: 20,
                      ),
                    ),
                  ),
                  Flexible(
                    child: Text(
                      'Class 5 of 10',
                      overflow: TextOverflow.clip,
                      style: myStyle.detailText14,
                      textAlign: TextAlign.start,
                      maxLines: 1,
                    ),
                  ),
                ],
              ),
            ),

            Padding(
              padding: const EdgeInsets.all(5.0),
              child: Flexible(
                child: Text(
                  controller.coursesdetails['name'].toString(),
                  overflow: TextOverflow.clip,
                  style: myStyle.headerText3,
                  textAlign: TextAlign.start,
                  maxLines: 2,
                ),
              ),
            ),

            const SizedBox(
              height: 5,
            ),

            Divider(height: 2, color: Colors.grey),

            Row(
              //crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                InkWell(
                  onTap: () {
                    controller.changeintem(0);
                  },
                  child: Container(
                    width: MediaQuery.of(context).size.width / 2,
                    height: 40,
                    decoration: BoxDecoration(
                        color: controller.item == 0
                            ? myStyle.special
                            : Colors.white),
                    child: Center(
                      child: Text(
                        'Details',
                        style: myStyle.detailText16,
                      ),
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {
                    controller.changeintem(1);
                  },
                  child: Container(
                    width: MediaQuery.of(context).size.width / 2,
                    height: 40,
                    decoration: BoxDecoration(
                        color: controller.item == 1
                            ? myStyle.special
                            : Colors.white),
                    child: Center(
                      child: Text(
                        'Lesson List',
                        style: myStyle.detailText16,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            // Divider between buttons and content
            Divider(height: 2, color: Colors.grey),
            // Content (either course details or lesson list based on the button clicked)
            const SizedBox(
              height: 5,
            ),
            Container(
              height: MediaQuery.of(context).size.height * .50,
              child: controller.item == 0 ? itemList[0] : itemList[1],
            )
          ],
        ),
      );
    });
  }
}
