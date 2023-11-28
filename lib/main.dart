import 'package:Probulon/screens/sign_in_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'controller/localization_controller.dart';
import 'utils/dependency_inj.dart' as dep;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Map<String, Map<String, String>> _languages = await dep.init();

  runApp(MyApp(languages: _languages));
}

class MyApp extends StatelessWidget {
  MyApp({required this.languages});
  final Map<String, Map<String, String>> languages;
  Widget build(BuildContext context) {
    final brightness = MediaQuery.of(context).platformBrightness;
    final isDarkMode = brightness == Brightness.dark;
    return GetBuilder<LocalizationController>(
      builder: (localizationController) {
        return GetMaterialApp(
          theme: isDarkMode ? ThemeData.dark() : ThemeData.light(),
          locale: localizationController.locale,
          translations: Messages(languages: languages),
          fallbackLocale: Locale(AppConstants.languages[1].languageCode,
              AppConstants.languages[1].countryCode),
          debugShowCheckedModeBanner: false,
          home: LoginScreen(),
        );
      },
    );
  }
}
