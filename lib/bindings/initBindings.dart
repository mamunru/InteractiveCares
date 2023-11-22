import 'package:get/get.dart';
import 'package:shafinbd/controller/pageController.dart';

class InitBindings implements Bindings {
  @override
  void dependencies() {
    Get.put(PageController());
  }
}
