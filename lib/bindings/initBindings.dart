import 'package:get/get.dart';
import 'package:shafinbd/controller/pageController.dart';

import '../controller/settingController.dart';

class InitBindings implements Bindings {
  @override
  void dependencies() {
    Get.put(SettingController(), permanent: true);
    Get.put(PageController(), permanent: true);
  }
}
