import 'package:dependency_module/dependency_module.dart';
import '../../model/firebase_resultado_theme_model.dart';

class FairebaseCarregarTemaDatasource
    implements Datasource<Stream<FirebaseResultadoThemeModel>> {
  final FirebaseFirestore firestore;
  FairebaseCarregarTemaDatasource({required this.firestore});

  @override
  Future<Stream<FirebaseResultadoThemeModel>> call(
      {required ParametersReturnResult parameters}) async {
    try {
      final themeData =
          firestore.collection("settingstheme").doc("theme").snapshots().map(
        (event) {
          return FirebaseResultadoThemeModel.fromMap(
            event.data()!,
          );
        },
      );
      return themeData;
    } catch (e) {
      throw ErroCarregarTemas(
        message: "Falha ao carregar os dados: Tema não carregado - Cod.03-1",
      );
    }
  }
}
