import 'package:get/get.dart';
import 'package:shafinbd/controller/coursecontroller.dart';
import 'package:shafinbd/controller/indexController.dart';
import 'package:shafinbd/controller/usercontroller.dart';
import 'package:shafinbd/route/routeName.dart';
import 'package:shafinbd/screen/auth/login.dart';
import 'package:shafinbd/screen/auth/registration.dart';
import 'package:shafinbd/screen/courses/ongoingcourses.dart';
import 'package:video_player/video_player.dart';


import '../controller/videocontroller.dart';
import '../screen/homepage/homepage.dart';
import '../screen/noInternet.dart';
import '../screen/splashScreen/splashScreen.dart';

List<GetPage> appRoutes() => [
      GetPage(name: routeName.splash, page: () => splashScreen()),

      //auth
      GetPage(
          name: routeName.login,
          page: () => LoginPage(),
          binding: BindingsBuilder(() {
            Get.put(UserController());
          })),

      GetPage(
        name: routeName.registration,
        page: () => registration(),
      ),

      GetPage(name: routeName.homepage, page: () => Homepage(), bindings: [
        BindingsBuilder(() {
          Get.put(indexController());
        }),
      ]),

      GetPage(
          name: routeName.mycourses,
          page: () => VideoDetailsPage(),
          bindings: [
            BindingsBuilder(() {
              Get.put(CoursesController());
            }),
            BindingsBuilder(() {
              Get.put(VideoDetailsController());
            }),
          ]),

      //no interner
      GetPage(name: routeName.nointernet, page: () => NoInternet())
    ];
