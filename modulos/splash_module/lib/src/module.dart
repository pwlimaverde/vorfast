import 'package:dependency_module/dependency_module.dart';
import 'bindings.dart';
import 'ui/splash_page.dart';

class SplashModule extends Module {
  @override
  List<GetPage> routers = [
    GetPage(
      name: "/",
      page: () => const SplashPage(),
      binding: SplashBiding(),
    ),
  ];
}
