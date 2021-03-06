import 'package:dependency_module/dependency_module.dart';
import '../../../../entities/resultado_theme.dart';

class LoadThemeStreamUsecase extends UseCaseImplement<Stream<ResultadoTheme>> {
  final Datasource<Stream<ResultadoTheme>> datasource;

  LoadThemeStreamUsecase({
    required this.datasource,
  });

  @override
  Future<ReturnSuccessOrError<Stream<ResultadoTheme>>> call({
    required ParametersReturnResult parameters,
  }) {
    final result = returnUseCase(
      parameters: parameters,
      datasource: datasource,
    );
    return result;
  }
}
