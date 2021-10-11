import 'package:dependency_module/dependency_module.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Vorfast Loja Online',
      getPages: [
        ...SplashModule().routers,
      ],
      theme: themeData,
    );
  }
}
