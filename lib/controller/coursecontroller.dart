import 'package:get/get.dart';

class CoursesController extends GetxController {
  String pagetile = '';

  @override
  void onInit() {
    pageinfo();
    super.onInit();
  }

  pageinfo() {
    pagetile = Get.parameters['title'].toString();
    update();
  }
}
