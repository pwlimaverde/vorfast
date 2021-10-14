import 'package:dependency_module/dependency_module.dart';
import 'package:flutter/material.dart';

class CoreModuleController extends GetxController {
  final Connectivity onconnect;

  CoreModuleController({
    required this.onconnect,
  });

  @override
  void onReady() {
    onconnect.onConnectivityChanged.listen((result) {
      _statusConectado(
        result == ConnectivityResult.wifi ||
            result == ConnectivityResult.mobile,
      );
    });
    _statusConectado.listen((result) {
      if (result == false) {
        _mostrarConeccao();
      }
    });
    super.onReady();
  }

  //Controller de Conexão
  final _statusConectado = false.obs;

  //Conexão Funções Internas
  //Snackbar falha de conexão
  void _mostrarConeccao() {
    Get.snackbar(
      'Desculpe',
      'Não foi possível estabelecer a conexão',
      icon: const Icon(FontAwesomeIcons.meh),
      snackPosition: SnackPosition.BOTTOM,
    );
  }
}
