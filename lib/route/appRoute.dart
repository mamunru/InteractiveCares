import 'package:get/get.dart';
import 'package:shafinbd/controller/indexController.dart';
import 'package:shafinbd/route/routeName.dart';
import 'package:shafinbd/screen/auth/login.dart';
import 'package:shafinbd/screen/auth/registration.dart';

import '../controller/loginController.dart';
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
            Get.put(loginController());
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

      //no interner
      GetPage(name: routeName.nointernet, page: () => NoInternet())
    ];
