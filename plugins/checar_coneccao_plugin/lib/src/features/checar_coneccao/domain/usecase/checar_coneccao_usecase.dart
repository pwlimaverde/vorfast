import 'package:dependency_module/dependency_module.dart';

class ChecarConeccaoUsecase<bool> extends UseCaseImplement<bool> {
  final Datasource<bool> datasource;

  ChecarConeccaoUsecase({
    required this.datasource,
  });
  @override
  Future<ReturnSuccessOrError<bool>> call({
    required ParametersReturnResult parameters,
  }) async {
    final result = await returnUseCase(
      parameters: parameters,
      datasource: datasource,
    );
    return result;
  }
}
