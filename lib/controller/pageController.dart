import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:shafinbd/config/boxName.dart';
import 'package:shafinbd/route/routeName.dart';

class PageViewController extends GetxController {
  bool onloading = false;
  final box = GetStorage();

  bool checknet = false;

  @override
  void onInit() {
    pageChange();
    super.onInit();
  }

  pageChange() async {
    await Future.delayed(const Duration(seconds: 3));

    navigatedToIntroduction();
  }

  void navigatedToIntroduction() async {
    checknet = true;
    update();

    final connectivityResult = await (Connectivity().checkConnectivity());
    switch (connectivityResult) {
      case ConnectivityResult.mobile:
        // if (box.hasData(boxName.token)) {
        //   Get.offAllNamed(routeName.homepage);
        // } else {
        //   Get.offAllNamed(routeName.login);
        // }
        Get.offAllNamed(routeName.homepage);
        onloading = false;
        break;
      case ConnectivityResult.wifi:
        Get.offAllNamed(routeName.homepage);
        // if (box.hasData(boxName.token)) {
        //   Get.offAllNamed(routeName.homepage);
        // } else {
        //   Get.offAllNamed(routeName.login);
        // }
        //Get.offAllNamed('/nointernet');

        onloading = false;
        break;
      case ConnectivityResult.none:
        Get.offAllNamed('/nointernet');
        onloading = false;
        break;
      case ConnectivityResult.bluetooth:
        Get.offAllNamed('/nointernet');
        onloading = false;
        break;
      case ConnectivityResult.ethernet:
        Get.offAllNamed("/homepage");
        onloading = false;
        break;
      case ConnectivityResult.vpn:
        Get.offAllNamed("/homepage");
        onloading = false;
        break;
      case ConnectivityResult.other:
        Get.offAllNamed('/nointernet');
        onloading = false;
        break;
    }

    checknet = false;

    update();
  }
}
