import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controller/login_controller.dart';
import '../../routes/app_routes.dart';


class LoginPage extends StatelessWidget {

  final LoginController _loginController = Get.find<LoginController>();
  final _formKey = GlobalKey<FormState>();

  LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green,
      body: Center(
        child: Form(
          key: _formKey,
          child: ListView(
            shrinkWrap: true,
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            children: [
              Hero(
                tag: 'hero', 
                child: CircleAvatar(
                  backgroundColor: Colors.transparent,
                  radius: 48.0,
                  child: Image.asset("assets/logo.png"),
                ),
              ),
              const SizedBox(height: 48.0),
              TextFormField(
                controller: _loginController.emailTextController,
                validator: (value){
                  if(value!.isEmpty){
                    return "Campo obrigatório.";
                  }else if( !GetUtils.isEmail(value) ){
                    return "Campo requer um E-mail válido.";
                  }
                  return null;
                },
                keyboardType: TextInputType.emailAddress,
                autofocus: false,
                decoration: InputDecoration(
                  hintText: "E-mail",
                  contentPadding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(32.0),
                  ),
                ),
              ),
              const SizedBox(height: 8.0),
              TextFormField(
                controller: _loginController.passwordTextController,
                validator: (value){
                  if(value!.isEmpty){
                    return "Campo obrigatório.";
                  }else if(value.length < 6){
                    return "Campo requer mínimo 6 caracteres.";
                  }
                  return null;
                },
                autofocus: false,
                obscureText: true,
                decoration: InputDecoration(
                  hintText: "Senha",
                  contentPadding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(32.0),
                  ),
                ),
              ),
              const SizedBox(height: 24.0),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 16.0),
                child: ElevatedButton.icon(
                  label: const Text('Entrar',
                    style: TextStyle(
                      fontSize: 24,
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                    minimumSize: const Size.fromHeight(50),
                  ),
                    onPressed: (){
                      if(_formKey.currentState!.validate()){
                        _loginController.login();
                      }
                    }, icon: const Icon(Icons.lock_open, size: 32), ),
              ),
              FlatButton(
                onPressed: (){ }, 
                child: Text("Esqueceu a senha?", style: TextStyle(color: Get.theme.primaryColor)),
              ),
              FlatButton(
                onPressed: (){ 
                  Get.toNamed(Routes.REGISTER);
                }, 
                child: Text("Cadastrar-se", style: TextStyle(color: Get.theme.primaryColor)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
