import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../data/model/user_model.dart';
import '../data/repository/login_repository.dart';
import '../routes/app_routes.dart';


class LoginController extends GetxController {
  final LoginRepository repository = LoginRepository();
  final TextEditingController emailTextController = TextEditingController();
  final TextEditingController passwordTextController = TextEditingController();
  final TextEditingController nameTextController = TextEditingController();
  GetStorage box = GetStorage('login_firebase');

  @override
  void onReady() {
    isLogged();
    super.onReady();
  }

  void isLogged(){
    if(box.hasData("auth")){
      UserModel user = UserModel(
        id: box.read("auth")["id"],
        email: box.read("auth")["email"],
        name: box.read("auth")["name"],
        urlimage: box.read("auth")["urlimage"]
      );
      Get.offAllNamed(Routes.HOME, arguments: user);
    }
  }

  void register() async {
    Get.dialog(const Center(child: CircularProgressIndicator()), barrierDismissible: false);
    UserModel user = (await repository.createUserWithEmailAndPassword(
        emailTextController.text,
        passwordTextController.text,
        nameTextController.text)) as UserModel;

    box.write("auth", user);
    Get.offAllNamed(Routes.HOME, arguments: user);
  }

  void login() async {
    Get.dialog(const Center(child: CircularProgressIndicator()), barrierDismissible: false);
    UserModel user = (await repository.signInWithEmailAndPassword(
        emailTextController.text, passwordTextController.text)) as UserModel;

    box.write("auth", user);
    Get.offAllNamed(Routes.HOME, arguments: user);
  }

  void logout(){
    repository.signOut();
    Get.offAllNamed(Routes.LOGIN);
  }
  
}
