import 'package:dependency_module/dependency_module.dart';

import '../core_modulo_controller.dart';

class CoreModuleBindings implements Bindings {
  @override
  void dependencies() {
    Get.put<Connectivity>(Connectivity(), permanent: true);
    Get.put<CoreModuleController>(
      CoreModuleController(
        onconnect: Get.find(),
        checarConeccaoUsecase: ChecarConeccaoUsecase(
          datasource: ConnectivityDatasource(
            connectivity: Get.find(),
          ),
        ),
      ),
      permanent: true,
    );
  }
}
