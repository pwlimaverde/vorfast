import 'package:dependency_module/dependency_module.dart';

import '../core_modulo_controller.dart';

class CoreModuleBindings implements Bindings {
  @override
  void dependencies() {
    Get.put<CoreModuleController>(
      CoreModuleController(),
      permanent: true,
    );
  }
}
