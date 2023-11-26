import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:shafinbd/config/boxName.dart';
import 'package:shafinbd/screen/homepage/components/index.dart';
import 'package:shafinbd/screen/homepage/components/mycpurse.dart';
import 'package:shafinbd/screen/homepage/components/profile.dart';

class indexController extends GetxController {
  RxInt index = 0.obs;
  String character = 'bn';
  bool bannerprogrss = false;

  List banner = [
    'https://e0.pxfuel.com/wallpapers/406/36/desktop-wallpaper-educational-computer-education.jpg',
    'https://cdn.pixabay.com/photo/2015/04/23/22/00/tree-736885_1280.jpg',
    'https://webneel.com/wallpaper/sites/default/files/images/08-2018/3-nature-wallpaper-mountain.jpg',
    'https://cdn.pixabay.com/photo/2014/02/27/16/10/flowers-276014_640.jpg',
    'https://expertphotography.b-cdn.net/wp-content/uploads/2018/07/nature-photography.jpg'
  ];

  final _box = GetStorage();

  onchange(i) {
    index.value = i;
    update();
  }

  changeLanguage(String ln) {
    print(ln);
    if (ln == 'en'.toString()) {
      var locale = Locale('en', 'US');
      _box.write(boxName.local, 'en_US');

      Get.updateLocale(locale);
      character = 'en';
    } else {
      var locale = Locale('bn', 'BD');
      _box.write(boxName.local, 'bn_BD');
      Get.updateLocale(locale);
      character = 'bn';
    }
    update();
  }
}
