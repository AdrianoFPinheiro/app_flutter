import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../model/user_model.dart';




class LoginApiClient {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  GetStorage box = GetStorage('login_firebase');


  // Retorna usuário logado
  // Stream<UserModel> get authStateChanges => _firebaseAuth.
  // authStateChanges()
  //     .map(UserModel.fromSnapshot() );

  // Criar usuário
  Future<UserModel?> createUserWithEmailAndPassword(
      String email, String password, String name) async {
    try {
      final currentUser = (await _firebaseAuth.createUserWithEmailAndPassword(
              email: email, password: password)).user;

      // Atualizando o nome do usuário
      var userUpdateInfo = await FirebaseAuth.instance.currentUser?.updateProfile(displayName: name);
      await FirebaseAuth.instance.currentUser?.updateProfile();
      await currentUser?.reload();

      return UserModel.fromSnapshot(currentUser!);
    } catch (e) {
      print(e.toString());
      Get.back();
      switch (e.toString()) {
        case "ERROR_OPERATION_NOT_ALLOWED":
          Get.defaultDialog(title: "ERROR", content: const Text("Contas anônimas não estão habilitadas"));
          break;
        case "ERROR_WEAK_PASSWORD":
          Get.defaultDialog(title: "ERROR", content: const Text("Sua senha é muito fraca"));
          break;
        case "ERROR_INVALID_EMAIL":
          Get.defaultDialog(title: "ERROR", content: const Text("Seu email é inválido"));
          break;
        case "ERROR_EMAIL_ALREADY_IN_USE":
          Get.defaultDialog(title: "ERROR", content: const Text("O e-mail já está em uso em outra conta"));
          break;
        case "ERROR_INVALID_CREDENTIAL":
          Get.defaultDialog(title: "ERROR", content: const Text("Seu email é inválido"));
          break;
        default:
          Get.defaultDialog(title: "ERROR", content: const Text("Ocorreu um erro indefinido."));
      }
      return null;
    }
  }


  // Fazer Login
  Future<UserModel?> signInWithEmailAndPassword(String email, String password) async {
    try {
      final currentUser = (await _firebaseAuth.signInWithEmailAndPassword(
              email: email, password: password)).user;
      return UserModel.fromSnapshot(currentUser!);
    } catch (e) {
      print(e);
      Get.back();
      switch (e) {
        case "ERROR_USER_NOT_FOUND" :
          Get.defaultDialog(title: "ERROR", content: const Text("Usuário não encontrado."));
          break;
        case "ERROR_WRONG_PASSWORD" :
          Get.defaultDialog(title: "ERROR", content: const Text("Senha não confere com o cadastrado."));
          break;
        case "ERROR_USER_DISABLED":
          Get.defaultDialog(title: "ERROR", content: const Text("Este usuário foi desativado."));
          break;
        case "ERROR_TOO_MANY_REQUESTS":
          Get.defaultDialog(title: "ERROR", content: const Text("Muitos solicitações. Tente novamente mais tarde."));
          break;
        case "ERROR_OPERATION_NOT_ALLOWED":
          Get.defaultDialog(title: "ERROR", content: const Text("Este login com e-mail e senha não foi permitida."));
          break;
        default:
          Get.defaultDialog(title: "ERROR", content: Text("$e"));
          break;
      }
      return null;
    }
  }


  // Fazer Logoff
  signOut(){
    box.write("auth", null);
    // box.erase();
    return _firebaseAuth.signOut();
  }


}
