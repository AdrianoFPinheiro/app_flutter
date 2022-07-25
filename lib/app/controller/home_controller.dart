import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../data/model/user_model.dart';
import '../ui/theme/app_theme.dart';


class HomeController extends GetxController {

  final UserModel user = Get.arguments;
  GetStorage box = GetStorage('login_firebase');
  RxString txtThemeButtom = "TEXT_BT_THEME_DARK".obs;


  @override
  void onInit() {
    super.onInit();
    txtThemeButtom.value = Get.isDarkMode ? "TEXT_BT_THEME_LIGHT" : "TEXT_BT_THEME_DARK";
  }


  void changeTheme(){
    if(Get.isDarkMode){
      box.write("theme", "light");
      txtThemeButtom.value = "TEXT_BT_THEME_DARK";
      Get.changeTheme(appThemeData);
    }else{
      box.write("theme", "dark");
      txtThemeButtom.value = "TEXT_BT_THEME_LIGHT";
      Get.changeTheme(appThemeDataDark);
    }
  }

}