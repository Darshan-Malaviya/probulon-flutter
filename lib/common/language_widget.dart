import 'package:flutter/material.dart';

import '../controller/localization_controller.dart';

class LanguageWidget extends StatelessWidget {
  final LanguageModel languageModel;
  final LocalizationController localizationController;
  final int index;

  LanguageWidget(
      {required this.languageModel,
      required this.localizationController,
      required this.index});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        localizationController.setLanguage(Locale(
          AppConstants.languages[index].languageCode,
          AppConstants.languages[index].countryCode,
        ));
        localizationController.setSelectedIndex(index);
      },
      child: Container(
        margin: EdgeInsets.only(top: 10, left: 15, right: 15),
        height: 60,
        decoration: BoxDecoration(
          color: Colors.black,
          borderRadius:
              BorderRadius.circular(30), // You can adjust the radius as needed
        ),
        child: Row(
          children: [
            Spacer(),
            Visibility(
                visible: localizationController.selectedIndex == index,
                child: Container(
                  height: 24,
                  width: 24,
                  decoration: BoxDecoration(
                    color: Colors.green,
                    borderRadius: BorderRadius.circular(12),
                  ),
                )),
            SizedBox(
              width: 8,
            ),
            Text(
              languageModel.languageName,
            ),
            Spacer(),
          ],
        ),
      ),
    );
  }
}
