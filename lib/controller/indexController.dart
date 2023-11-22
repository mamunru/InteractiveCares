import 'package:get/get.dart';
import 'package:shafinbd/screen/homepage/components/index.dart';
import 'package:shafinbd/screen/homepage/components/mycpurse.dart';
import 'package:shafinbd/screen/homepage/components/profile.dart';

class indexController extends GetxController {
  int index = 0;
  SingingCharacter? character = SingingCharacter.bn;

  List pages = [IndexPage(), MyCourse(), Profile()];

  onchange(i) {
    index = i;
    update();
  }

  changeLanguage() {
    character =
        Get.locale! == 'en_US' ? SingingCharacter.en : SingingCharacter.bn;
    update();
  }
}
