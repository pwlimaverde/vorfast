import 'package:dependency_module/dependency_module.dart';
import 'controller.dart';

class SplashBiding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SplashController>(() {
      return SplashController();
    });
  }
}
