import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controller/home_controller.dart';
import '../../controller/login_controller.dart';
import '../../routes/app_routes.dart';


class HomePage extends StatelessWidget {
  final HomeController _homeController = Get.find<HomeController>();

  HomePage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("TITLE_HOME_PAGE".tr),
        centerTitle: true,
      ),
      body: Stack(
        children: <Widget>[
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                width: 150.0,
                height: 150.0,
                decoration: BoxDecoration(
                  color: Get.theme.primaryColor,
                  image: DecorationImage(
                    image: NetworkImage(_homeController.user.urlimage ?? 'https://cdn.business2community.com/wp-content/uploads/2017/08/blank-profile-picture-973460_640.png'),
                    fit: BoxFit.cover,
                  ),
                  borderRadius: const BorderRadius.all(Radius.circular(75.0)),
                  boxShadow: const [BoxShadow(blurRadius: 7.0, color: Colors.black)],
                ),
              ),
              const SizedBox(height: 40.0),
              Text(
                '${_homeController.user.email}',
                style: const TextStyle(
                  fontSize: 17.0,
                  fontStyle: FontStyle.italic,
                  fontFamily: 'Montserrat',
                ),
              ),
              const SizedBox(height: 25.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 30.0,
                    width: 95.0,
                    child: RaisedButton(
                      onPressed: () {
                        print("Idioma: Português");
                        Get.updateLocale(const Locale('pt', 'BR'));
                      },
                      child: const Center(
                        child: Text(
                          'pt_BR',
                          style: TextStyle(
                            color: Colors.white,
                            fontFamily: 'Montserrat',
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 10.0),
                  SizedBox(
                    height: 30.0,
                    width: 95.0,
                    child: RaisedButton(
                      onPressed: () {
                        print("Idioma: Inglês");
                        Get.updateLocale(const Locale('en', 'US'));
                      },
                      child: const Center(
                        child: Text(
                          'en_US',
                          style: TextStyle(
                            color: Colors.white,
                            fontFamily: 'Montserrat',
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 25.0),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 30.0,
                    width: 130.0,
                    child: RaisedButton(
                      onPressed: () {
                        _homeController.changeTheme();
                      },
                      child: Center(
                        child: Obx(
                          () => Text(
                            _homeController.txtThemeButtom.value.tr,
                            style: const TextStyle(
                              color: Colors.white,
                              fontFamily: 'Montserrat',
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 18.0,),
                  SizedBox(
                    height: 30.0,
                    width: 130.0,
                    child: RaisedButton(
                      onPressed: () {
                        Get.toNamed(Routes.API);
                      },
                      child: const Center(
                        child:Text(
                            "API",
                            style: TextStyle(
                              color: Colors.white,
                              fontFamily: 'Montserrat',
                            ),
                          ),

                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 25.0),
              SizedBox(
                height: 30.0,
                width: 95.0,
                child: RaisedButton(
                  color: Colors.red,
                  onPressed: () {
                    print("Sair");
                    LoginController().logout();
                  },
                  child: Center(
                    child: Text(
                      'TEXT_BT_LOGOUT'.tr,
                      style: const TextStyle(
                        color: Colors.white,
                        fontFamily: 'Montserrat',
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
