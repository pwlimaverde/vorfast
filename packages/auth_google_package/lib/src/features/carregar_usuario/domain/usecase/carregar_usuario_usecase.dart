import 'package:dependency_module/dependency_module.dart';

import '../../../../../auth_google_package.dart';

class CarregarUsuarioUsecase
    extends UseCaseImplement<Stream<ResultadoUsuario>> {
  final Datasource<Stream<ResultadoUsuario>> datasource;

  CarregarUsuarioUsecase({
    required this.datasource,
  });

  @override
  Future<ReturnSuccessOrError<Stream<ResultadoUsuario>>> call({
    required ParametersReturnResult parameters,
  }) async {
    final result = await returnUseCase(
      parameters: parameters,
      datasource: datasource,
    );

    return result;
  }
}
