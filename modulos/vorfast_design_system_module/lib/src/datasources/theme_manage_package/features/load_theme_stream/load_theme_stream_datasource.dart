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
      final docReference = firestore.collection("settingstheme").doc("theme");
      final doc = await docReference.get();
      FirebaseResultadoThemeModel tema = FirebaseResultadoThemeModel.fromMap(
        map: doc.data()!,
      );
      if (tema.user.isNotEmpty) {
        Stream<FirebaseResultadoThemeModel> themeData =
            docReference.snapshots().map((event) {
          return FirebaseResultadoThemeModel.fromMap(map: event.data()!);
        });
        return themeData;
      } else {
        throw ErroCarregarTemas(
          message: "Falha ao carregar os dados: Tema não carregado - Cod.03-1",
        );
      }
    } catch (e) {
      throw ErroCarregarTemas(
        message: "Falha ao carregar os dados: Tema não carregado - Cod.03-1",
      );
    }
  }
}
