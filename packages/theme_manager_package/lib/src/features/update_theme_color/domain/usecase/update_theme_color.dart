import 'package:dependency_module/dependency_module.dart';

class UpdateThemeColorsUsecase extends UseCaseImplement<bool> {
  final Datasource<bool> datasource;

  UpdateThemeColorsUsecase({
    required this.datasource,
  });

  @override
  Future<ReturnSuccessOrError<bool>> call({
    required ParametersReturnResult parameters,
  }) {
    final result = returnUseCase(
      parameters: parameters,
      datasource: datasource,
    );
    return result;
  }
}
