import 'dart:ffi';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:shafinbd/config/boxName.dart';
import 'package:shafinbd/controller/indexController.dart';
import 'package:shafinbd/route/routeName.dart';

import '../server/apiaddress.dart';
import '../server/method.dart';

class UserController extends GetxController {
  RxInt user = 0.obs;
  final _box = GetStorage();
  bool loginerror = false;
  bool showpassword = true;
  bool loginloading = false;

  bool regerrorshow = false;
  bool regloading = false;
  bool regsuccessstatus = false;

  String name = 'Guest';
  String email = '';
  String token = '';
  String regerror = 'Server Busy. Please try Later ';
  String regsuccess = '';

  reset() {
    loginerror = false;
    showpassword = true;
    loginloading = false;

    regerrorshow = false;
    regloading = false;
    regsuccessstatus = false;
    update();
  }

  @override
  void onReady() {
    checkuser();
    reset();
    super.onReady();
  }

  checkuser() async {
    if (_box.hasData(boxName.userid)) {
      user.value = _box.read(boxName.userid);
    } else {
      _box.write(boxName.userid, 0);
      name = 'Guest';
      _box.write(boxName.username, name);
    }

    if (_box.hasData(boxName.username)) {
      name = _box.read(boxName.username);
    }

    update();
  }

  passwordsee() {
    showpassword = showpassword ? false : true;
    update();
  }

  trylogin({required String email, required String password}) async {
    loginloading = true;
    loginerror = false;

    regsuccessstatus = false;
    update();

    Map<String, dynamic> setdata = {
      'email': email,
      'password': password,
    };

    var logindata = await apiMenthod()
        .postMethod(url: ApiAddress.login, token: '0', data: setdata);

    if (logindata.statusCode == 200) {
      user.value = int.parse(logindata.data['id'].toString());
      name = logindata.data['username'];
      email = logindata.data['email'];
      token = logindata.data['access_token'];

      _box.write(boxName.email, email);
      _box.write(boxName.userid, user.value);
      _box.write(boxName.token, token);
      _box.write(boxName.username, name);

      Get.offAllNamed(routeName.homepage);
    } else {
      loginerror = true;
    }

    loginloading = false;

    update();

    print(logindata.data);
  }

  logout() {
    _box.remove(boxName.email);
    _box.write(boxName.userid, 0);
    _box.write(boxName.username, 'Guest');
    _box.remove(boxName.token);

    user.value = 0;
    name = 'Guest';
    email = '';
    token = '';

    update();
  }

  tryregistration(
      {required String name,
      required String email,
      required String password}) async {
    regloading = true;
    regerrorshow = false;
    regsuccessstatus = false;
    update();

    Map<String, dynamic> setdata = {
      'name': name,
      'email': email,
      'password': password,
    };

    var reg = await apiMenthod()
        .postMethod(url: ApiAddress.registration, token: '0', data: setdata);

    if (reg.statusCode == 200) {
      regsuccessstatus = true;
      regsuccess = reg.data;
      Get.offAndToNamed(routeName.login);
    } else {
      regerror = reg.data;
      regerrorshow = true;
    }

    regloading = false;

    update();
  }
}
