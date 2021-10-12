import 'package:dependency_module/dependency_module.dart';
import 'package:flutter/material.dart';
import 'datasources/theme_manage_package/model/firebase_resultado_theme_model.dart';

class ThemeSettings {
  final _box = Get.find<GetStorage>();
  get _model => _box.read("tema") != null
      ? FirebaseResultadoThemeModel.fromJson(
          GetStorage().read("tema"),
        )
      : FirebaseResultadoThemeModel(
          newUser: "inicial",
          newPrimary: {
            "r": 200,
            "g": 200,
            "b": 200,
          },
          newSecondary: {
            "r": 100,
            "g": 100,
            "b": 100,
          },
        );

  get themeData => ThemeData(
        colorScheme: ColorScheme.fromSwatch().copyWith(
          primary: Color.fromRGBO(
            _model.primary["r"],
            _model.primary["g"],
            _model.primary["b"],
            1.0,
          ),
          secondary: Color.fromRGBO(
            _model.secondary["r"],
            _model.secondary["g"],
            _model.secondary["b"],
            1.0,
          ),
        ),
        fontFamily: 'Georgia',
        textTheme: const TextTheme(
          headline1: TextStyle(
            fontSize: 72.0,
            fontWeight: FontWeight.bold,
          ),
        ),
      );
}
