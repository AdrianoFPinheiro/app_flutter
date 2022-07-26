import 'package:app_flutter/app/modules/login/controllers/login_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';



class RegisterPage extends StatelessWidget {

  final LoginController _loginController = LoginController();
  final _formKey = GlobalKey<FormState>();

  RegisterPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
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
              const SizedBox(height: 18.0),
              const Center(child: Text("CADASTRAR", style: TextStyle(fontSize: 22.0))),
              const SizedBox(height: 48.0),
              TextFormField(
                controller: _loginController.nameTextController,
                validator: (value){
                  if(value!.isEmpty){
                    return "Campo obrigatório.";
                  }
                  return null;
                },
                keyboardType: TextInputType.emailAddress,
                autofocus: false,
                decoration: InputDecoration(
                  hintText: "Nome",
                  contentPadding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(32.0),
                  ),
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
                child: RaisedButton(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(24.0),
                  ),
                  onPressed: (){ 
                    if(_formKey.currentState!.validate()){
                      _loginController.register();
                    }
                  },
                  padding: const EdgeInsets.all(12.0),
                  color: Get.theme.primaryColor,
                  child: const Text("Cadastrar", style: TextStyle(color: Colors.white)),
                ),
              ),
              FlatButton(
                onPressed: (){ 
                  Get.back();
                }, 
                child: Text("Voltar para Login", style: TextStyle(color: Get.theme.primaryColor)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
