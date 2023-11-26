import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:shafinbd/config/boxName.dart';

class loginController extends GetxController {
  final _obj = ''.obs;
  set obj(value) => this._obj.value = value;
  get obj => this._obj.value;
  final _box = GetStorage();

  @override
  void onInit() {
    String data = _box.read(boxName.local);
    print(data);
    super.onInit();
  }
}
