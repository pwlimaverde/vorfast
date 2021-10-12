import 'package:dependency_module/dependency_module.dart';

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
      // _getCon();
    });
    super.onInit();
  }

  // //Controller de Conexão
  // final _estaConectado = false.obs;
  // bool get estaConectado => this._estaConectado.value;
  // set estaConectado(value) => this._estaConectado.value = value;

  // void _getCon() async {
  //   ReturnSuccessOrError<bool> testeConexao =
  //       await checarConeccaoPresenter.consultaConectividade();
  //   if (testeConexao is SuccessReturn<bool>) {
  //     this.estaConectado = testeConexao.result;
  //   } else {
  //     this.estaConectado = false;
  //   }

  //   _mostrarConeccao();
  // }

  // //Conexão Funções Internas
  // //Snackbar falha de conexão
  // void _mostrarConeccao() {
  //   if (estaConectado == false) {
  //     Get.snackbar(
  //       'Desculpe',
  //       'Não foi possível estabelecer a conexão',
  //       icon: Icon(FontAwesomeIcons.meh),
  //       snackPosition: SnackPosition.BOTTOM,
  //     );
  //   }
  // }
}
