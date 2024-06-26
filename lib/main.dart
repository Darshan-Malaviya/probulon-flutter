import 'package:Probulon/utils/firebase_service.dart';
import 'package:Probulon/utils/pref_services.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import 'common/color.dart';
import 'controller/localization_controller.dart';
import 'screens/auth/log_in_screen.dart';
import 'screens/dash_board/dashbord_screen.dart';
import 'utils/dependency_inj.dart' as dep;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await FirebaseService.initializeFirebaseApp();
  Map<String, Map<String, String>> languages = await dep.init();
  PrefService.init();
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  runApp(MyApp(languages: languages));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key, required this.languages});
  final Map<String, Map<String, String>> languages;
  @override
  Widget build(BuildContext context) {
    return GetBuilder<LocalizationController>(
      id: 'Home',
      builder: (localizationController) {
        bool isLogged = PrefService.getBool('isLogged');
        return GetMaterialApp(
          theme: ThemeData(
            primarySwatch: ColorUtils.scaffoldColor,
            backgroundColor: Colors.white,
            scaffoldBackgroundColor: ColorUtils.scaffoldColor,
          ),
          darkTheme: ThemeData.dark().copyWith(
            primaryColor: Colors.black,
            backgroundColor: Colors.black,
            scaffoldBackgroundColor: Colors.black,
            drawerTheme: DrawerThemeData(
              backgroundColor: Colors.black,
            ),
            appBarTheme: const AppBarTheme(
              color: Colors.black,
            ),
            visualDensity: VisualDensity.adaptivePlatformDensity,
          ),
          themeMode: ThemeMode.system,
          locale: localizationController.locale,
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
