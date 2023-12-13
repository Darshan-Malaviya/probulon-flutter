import 'package:Probulon/screens/dash_board/dashbord_screen.dart';
import 'package:Probulon/utils/pref_services.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'controller/localization_controller.dart';
import 'screens/auth/log_in_screen.dart';
import 'utils/dependency_inj.dart' as dep;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  Map<String, Map<String, String>> languages = await dep.init();
  PrefService.init();
  runApp(MyApp(languages: languages));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key, required this.languages});
  final Map<String, Map<String, String>> languages;
  @override
  Widget build(BuildContext context) {
    return GetBuilder<LocalizationController>(
      builder: (localizationController) {
        bool isLogged = PrefService.getBool('isLogged');
        return GetMaterialApp(
          theme: ThemeData.light(),
          darkTheme: ThemeData.dark(),
          locale: localizationController.locale,
          themeMode: Get.isPlatformDarkMode ? ThemeMode.dark : ThemeMode.light,
          translations: Messages(languages: languages),
          fallbackLocale: Locale(AppConstants.languages[1].languageCode,
              AppConstants.languages[1].countryCode),
          debugShowCheckedModeBanner: false,
          home: isLogged ? DashBoardScreen() : LoginScreen(),
        );
      },
    );
  }
}
