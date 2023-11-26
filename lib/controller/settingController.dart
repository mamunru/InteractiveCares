import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:shafinbd/config/boxName.dart';

class SettingController extends GetxController {
  final _box = GetStorage();

  Locale mylocal = Locale('bn', 'BD');

  setlocation() async {
    if (await _box.hasData(boxName.local)) {
      var lo = await _box.read(boxName.local);

      var locale =
          Locale(lo.toString().substring(0, 2), lo.toString().substring(3, 5));
      print(locale);
      Get.updateLocale(locale);
      print('==========language change===========');
    } else {
      var locale = Locale('bn', 'BD');
      _box.write(boxName.local, 'bn_BD');

      Get.updateLocale(locale);
    }
  }

  @override
  void onReady() {
    setlocation();

    super.onReady();
  }
}
