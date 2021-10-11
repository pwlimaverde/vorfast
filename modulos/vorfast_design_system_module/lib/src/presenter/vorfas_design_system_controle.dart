import 'package:dependency_module/dependency_module.dart';
import 'package:flutter/material.dart';
import '../datasources/theme_manage_package/model/firebase_resultado_theme_model.dart';

class VorfastDesignSystemController extends GetxController {
  final LoadThemeStorageUsecase loadThemeStorageUsecase;
  final LoadThemeStreamUsecase loadThemeStreamUsecase;

  VorfastDesignSystemController(
      {required this.loadThemeStorageUsecase,
      required this.loadThemeStreamUsecase});

  @override
  void onInit() {
    super.onInit();
    _loadThemeStorage();
    _carregarSettingsTheme();

    fireTheme.listen((event) {
      _apiThemeApp(model: event);
    });
  }

  final _loadCompletoDoTema = false.obs;
  bool get loadCompletoDoTema => _loadCompletoDoTema.value;
  set loadCompletoDoTema(value) => _loadCompletoDoTema.value = value;

  final _fireTheme = FirebaseResultadoThemeModel(
    newSecondary: {},
    newPrimary: {},
    newUser: '',
  ).obs;
  get fireTheme => _fireTheme;
  FirebaseResultadoThemeModel get fireThemeValue => _fireTheme.value;
  set fireTheme(value) => _fireTheme.bindStream(value);

  void _carregarSettingsTheme() async {
    final result = await loadThemeStreamUsecase(
      parameters: NoParams(
        error: ErroCarregarTemas(
          message: "Não foi possível carregar o tema Stream!",
        ),
        showRuntimeMilliseconds: true,
        nameFeature: "loadThemeStream",
      ),
    );
    if (result is SuccessReturn<Stream<ResultadoTheme>>) {
      final theme = result.result;
      fireTheme = theme;
    }
  }

  void _loadThemeStorage() async {
    final result = await loadThemeStorageUsecase(
      parameters: NoParams(
        error: ErroCarregarTemas(
          message: "Não foi possível carregar o tema!",
        ),
        showRuntimeMilliseconds: true,
        nameFeature: "loadThemeStorage",
      ),
    );
    if (result is SuccessReturn<ResultadoTheme>) {
      final model = result.result;
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

  void _apiThemeApp({required FirebaseResultadoThemeModel model}) {
    final box = GetStorage();
    box.write("tema", model.toJson());
    Get.changeTheme(
      ThemeData(
        colorScheme: ColorScheme.fromSwatch().copyWith(
          primary: Color.fromRGBO(
              model.primary["r"], model.primary["g"], model.primary["b"], 1.0),
          secondary: Color.fromRGBO(model.secondary["r"], model.secondary["g"],
              model.secondary["b"], 1.0),
        ),
      ),
    );
    Future.delayed(const Duration(milliseconds: 500))
        .then((_) => loadCompletoDoTema = true);
  }
}
