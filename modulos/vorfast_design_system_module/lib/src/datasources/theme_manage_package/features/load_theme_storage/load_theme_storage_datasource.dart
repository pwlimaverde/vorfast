import 'package:dependency_module/dependency_module.dart';
import '../../model/firebase_resultado_theme_model.dart';

class LoadThemeStorageDatasource
    implements Datasource<FirebaseResultadoThemeModel> {
  final GetStorage box;

  LoadThemeStorageDatasource({required this.box});

  @override
  Future<FirebaseResultadoThemeModel> call(
      {required ParametersReturnResult parameters}) async {
    try {
      if (box.read("theme") != null) {
        final model = FirebaseResultadoThemeModel.fromMap(
          map: box.read("tema"),
        );
        return model;
      } else {
        throw ErroCarregarTemas(
          message: "Falha ao carregar os dados: Tema não carregado - Cod.03-1",
        );
      }
    } catch (e) {
      throw ErroCarregarTemas(
          message: "Falha ao carregar os dados: $e - Cod.03-2");
    }
  }
}
