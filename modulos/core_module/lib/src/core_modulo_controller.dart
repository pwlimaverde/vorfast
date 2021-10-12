import 'package:dependency_module/dependency_module.dart';
import 'package:flutter/material.dart';

class CoreModuleController extends GetxController {
  final ChecarConeccaoUsecase checarConeccaoUsecase;
  final Connectivity onconnect;

  CoreModuleController({
    required this.checarConeccaoUsecase,
    required this.onconnect,
  });

  @override
  void onInit() {
    onconnect.onConnectivityChanged.listen((event) {
      _getCon();
    });
    super.onInit();
  }

  //Controller de Conexão
  final _estaConectado = false.obs;
  bool get estaConectado => _estaConectado.value;
  set estaConectado(value) => _estaConectado.value = value;

  void _getCon() async {
    ReturnSuccessOrError<bool> testeConexao = await checarConeccaoUsecase(
        parameters: NoParams(
            error: ErrorConeccao(
              message: "Não foi possível verificar a conecção da rede!",
            ),
            showRuntimeMilliseconds: true,
            nameFeature: "Checar Conecção"));
    if (testeConexao is SuccessReturn<bool>) {
      estaConectado = testeConexao.result;
    } else {
      estaConectado = false;
    }
    _mostrarConeccao();
  }

  //Conexão Funções Internas
  //Snackbar falha de conexão
  void _mostrarConeccao() {
    if (estaConectado == false) {
      Get.snackbar(
        'Desculpe',
        'Não foi possível estabelecer a conexão',
        icon: const Icon(FontAwesomeIcons.meh),
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }
}
