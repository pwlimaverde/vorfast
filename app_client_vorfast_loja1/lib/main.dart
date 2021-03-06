import 'package:dependency_module/dependency_module.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await GetStorage.init();
  RemoteConfig.instance.fetchAndActivate();
  CoreModulePreBindings().dependencies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Vorfast Loja Online',
      initialBinding: CoreModuleBindings(),
      getPages: [
        ...SplashModule().routers,
      ],
      theme: ThemeSettings().themeData,
    );
  }
}
