import 'package:dependency_module/dependency_module.dart';
import 'vorfas_design_system_controle.dart';
import '../datasources/theme_manage_package/features/load_theme_stream/load_theme_stream_datasource.dart';

class VorfastDesignSystemBinding implements Bindings {
  @override
  void dependencies() {
    Get.put<VorfastDesignSystemController>(
      VorfastDesignSystemController(
        loadThemeStreamUsecase: LoadThemeStreamUsecase(
            datasource: FairebaseCarregarTemaDatasource(
          firestore: Get.find(),
        )),
      ),
      permanent: true,
    );
  }
}
