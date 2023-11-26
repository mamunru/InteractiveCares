import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:shafinbd/config/myStyle.dart';
import 'package:shafinbd/config/translator.dart';
import 'package:shafinbd/route/appRoute.dart';

import 'bindings/initBindings.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  InitBindings().dependencies();
  await GetStorage.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      translations: Messages(),
      locale: Locale('bn', 'BD'),
      fallbackLocale: Locale('en', 'US'),
      initialRoute: '/',
      theme: ThemeData(
        appBarTheme: AppBarTheme(backgroundColor: myStyle.primaryColor),
        scaffoldBackgroundColor: myStyle.backgroudColor,
      ),
      getPages: appRoutes(),
    );
  }
}
