import 'package:dependency_module/dependency_module.dart';
import 'package:flutter/material.dart';

class ThemeSetting {
  final ThemeData themeData = ThemeData(
    colorScheme: ColorScheme.fromSwatch().copyWith(
      primary: const Color.fromARGB(255, 200, 100, 100),
      secondary: const Color.fromARGB(255, 20, 20, 20),
    ),
    fontFamily: 'Georgia',
    textTheme: const TextTheme(
      headline1: TextStyle(
        fontSize: 72.0,
        fontWeight: FontWeight.bold,
      ),
    ),
  );

  void carregarTemaStorage() {
    final box = GetStorage();
    if (box.read("tema") != null) {
      final model = FirebaseResultadoThemeModel.fromJson(
        box.read("tema"),
      );

      if (model.user.isNotEmpty) {
        Get.changeTheme(
          ThemeData(
            colorScheme: ColorScheme.fromSwatch().copyWith(
              primary: Color.fromRGBO(model.primary["r"], model.primary["g"],
                  model.primary["b"], 1.0),
              secondary: Color.fromRGBO(model.secondary["r"],
                  model.secondary["g"], model.secondary["b"], 1.0),
            ),
          ),
        );
      }
    }
  }
}
