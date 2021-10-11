import 'package:flutter/material.dart';
import 'package:dependency_module/dependency_module.dart';
import '../splash_controller.dart';

class SplashPage extends GetView<SplashController> {
  const SplashPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.primary,
      body: Center(
        child: Column(
          children: [
            const Text(
              "Bem Vindo a Loja..",
              style: TextStyle(
                fontSize: 30.0,
                color: Colors.white,
              ),
            ),
            Text(RemoteConfig.instance.getString('api_token')),
          ],
        ),
      ),
    );
  }
}
