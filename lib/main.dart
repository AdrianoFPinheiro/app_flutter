import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:get_storage/get_storage.dart';
import 'app/routes/app_pages.dart';
import 'app/routes/app_routes.dart';
import 'app/translations/app_translations.dart';
import 'app/ui/theme/app_theme.dart';


void main() async{
  await GetStorage.init('login_firebase');
  GetStorage box = GetStorage('login_firebase');
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(
    GetMaterialApp(
      title: 'Login Firebase',
      debugShowCheckedModeBanner: false,
      getPages: AppPages.routes,
      initialRoute: Routes.INITIAL,
      theme: box.read("theme") == "dark" ? appThemeDataDark : appThemeData,
      darkTheme: appThemeDataDark,
      themeMode: ThemeMode.system,
      locale: const Locale('pt', 'BR'),
      translationsKeys: AppTranslation.translations,
    )
  );
}

