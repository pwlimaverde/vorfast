import 'package:checar_coneccao_plugin/src/features/checar_coneccao/domain/usecase/checar_coneccao_usecase.dart';
import 'package:dependency_module/dependency_module.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class DatasourceMock extends Mock implements Datasource<bool> {}

void main() {
  late Datasource<bool> datasource;
  late UseCaseImplement<bool> usecase;

  setUp(() {
    datasource = DatasourceMock();
    usecase = ChecarConeccaoUsecase(
      datasource: datasource,
    );
  });

  test('Deve retornar um sucesso com true', () async {
    when(datasource).calls(#call).thenAnswer(
          (_) => Future.value(true),
        );
    final result = await usecase(
      parameters: NoParams(
        error: ErrorConeccao(
          message: "Erro de conexão",
        ),
        nameFeature: "Checar Conecção",
        showRuntimeMilliseconds: true,
      ),
    );
    print("teste result - ${result.fold(
      success: (value) => value.result,
      error: (value) => value.error,
    )}");
    expect(result, isA<SuccessReturn<bool>>());
  });

  test('Deve retornar um Erro com ErrorConeccao com teste erro datasource',
      () async {
    when(datasource).calls(#call).thenAnswer(
          (_) => Future.value(null),
        );
    final result = await usecase(
      parameters: NoParams(
        error: ErrorConeccao(
          message: "Erro de conexão",
        ),
        nameFeature: "Checar Conecção",
        showRuntimeMilliseconds: true,
      ),
    );
    print("teste result - ${result.fold(
      success: (value) => value.result,
      error: (value) => value.error,
    )}");
    expect(result, isA<ErrorReturn<bool>>());
  });

  test(
      'Deve retornar um ErrorConeccao com Erro ao recuperar informação de conexão Cod.01-1',
      () async {
    when(datasource).calls(#call).thenThrow(Exception());
    final result = await usecase(
      parameters: NoParams(
        error: ErrorConeccao(
          message: "Erro de conexão",
        ),
        nameFeature: "Checar Conecção",
        showRuntimeMilliseconds: true,
      ),
    );
    print("teste result - ${result.fold(
      success: (value) => value.result,
      error: (value) => value.error,
    )}");
    expect(result, isA<ErrorReturn<bool>>());
  });
}
