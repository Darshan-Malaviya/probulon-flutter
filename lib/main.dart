import 'package:Probulon/screens/dash_board/dashbord_screen.dart';
import 'package:Probulon/utils/pref_services.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import 'controller/localization_controller.dart';
import 'screens/auth/log_in_screen.dart';
import 'utils/dependency_inj.dart' as dep;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
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
    MaterialColor myWhite = const MaterialColor(
      0xFFFFFFFF, // The primary value
      <int, Color>{
        50: const Color(0xFFFFFFFF), // Shades of white
        100: const Color(0xFFFFFFFF),
        200: const Color(0xFFFFFFFF),
        300: const Color(0xFFFFFFFF),
        400: const Color(0xFFFFFFFF),
        500: const Color(0xFFFFFFFF),
        600: const Color(0xFFFFFFFF),
        700: const Color(0xFFFFFFFF),
        800: const Color(0xFFFFFFFF),
        900: const Color(0xFFFFFFFF),
      },
    );
    return GetBuilder<LocalizationController>(
      id: 'Home',
      builder: (localizationController) {
        bool isLogged = PrefService.getBool('isLogged');
        return GetMaterialApp(
          theme: ThemeData(
            // Light mode theme
            primarySwatch: myWhite,
            backgroundColor: Colors.white,
            scaffoldBackgroundColor: myWhite,
            visualDensity: VisualDensity.adaptivePlatformDensity,
          ),
          darkTheme: ThemeData.dark().copyWith(
            // Dark mode theme
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
