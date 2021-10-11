import 'package:dependency_module/dependency_module.dart';

class SignOutUsecase extends UseCaseImplement<bool> {
  final Datasource<bool> datasource;

  SignOutUsecase({
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

    if (result is SuccessReturn<bool>) {
      if (!result.result) {
        return ErrorReturn<bool>(
          error: parameters.error,
        );
      }
      return result;
    }

    return result;
  }
}
