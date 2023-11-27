import 'package:get/get.dart';

import '../controller/pageController.dart';
import '../controller/settingController.dart';
import '../controller/usercontroller.dart';

class InitBindings implements Bindings {
  @override
  void dependencies() {
    Get.put(SettingController(), permanent: true);
    Get.put(PageViewController(), permanent: true);
    Get.put(UserController());
  }
}
