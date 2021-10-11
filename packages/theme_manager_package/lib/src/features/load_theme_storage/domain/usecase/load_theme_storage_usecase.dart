import 'package:dependency_module/dependency_module.dart';
import '../../../../entities/resultado_theme.dart';

class LoadThemeStorageUsecase extends UseCaseImplement<ResultadoTheme> {
  final Datasource<ResultadoTheme> datasource;

  LoadThemeStorageUsecase({
    required this.datasource,
  });

  @override
  Future<ReturnSuccessOrError<ResultadoTheme>> call({
    required ParametersReturnResult parameters,
  }) {
    final result = returnUseCase(
      parameters: parameters,
      datasource: datasource,
    );
    return result;
  }
}
