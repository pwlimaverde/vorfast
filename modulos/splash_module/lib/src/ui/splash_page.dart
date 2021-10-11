import 'package:flutter/material.dart';
import 'package:dependency_module/dependency_module.dart';
import '../controller.dart';

class SplashPage extends GetView<SplashController> {
  const SplashPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.primary,
      body: const Center(
        child: Text("Bem Vindo a Loja...",
            style: TextStyle(
              fontSize: 30.0,
              color: Colors.white,
            )),
      ),
    );
  }
}
