import 'package:checar_coneccao_plugin/src/features/checar_coneccao/datasources/connectivity_datasource.dart';
import 'package:dependency_module/dependency_module.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class ConnectivityMock extends Mock implements Connectivity {}

void main() {
  late Connectivity data;
  late Datasource<bool> datasource;

  setUp(() {
    data = ConnectivityMock();
    datasource = ConnectivityDatasource(connectivity: data);
  });

  test('Deve retornar um sucesso com true conecção wifi', () async {
    when(data)
        .calls(#checkConnectivity)
        .thenAnswer((_) => Future.value(Future.value(ConnectivityResult.wifi)));
    final result = await datasource(
      parameters: NoParams(
        error: ErrorReturnResult(
          message: "Erro de conexão",
        ),
        nameFeature: "Checar Conecção",
        showRuntimeMilliseconds: true,
      ),
    );
    print("teste result - $result");
    expect(result, isA<bool>());
    expect(result, true);
  });

  test('Deve retornar um sucesso com true conecção moble', () async {
    when(data).calls(#checkConnectivity).thenAnswer(
        (_) => Future.value(Future.value(ConnectivityResult.mobile)));
    final result = await datasource(
      parameters: NoParams(
        error: ErrorReturnResult(
          message: "Erro de conexão",
        ),
        nameFeature: "Checar Conecção",
        showRuntimeMilliseconds: true,
      ),
    );
    print("teste result - $result");
    expect(result, isA<bool>());
    expect(result, true);
  });

  test('Deve retornar um ErrorConeccao com Cod.01-2', () async {
    when(data)
        .calls(#checkConnectivity)
        .thenAnswer((_) => Future.value(Future.value(ConnectivityResult.none)));

    expect(
        () async => await datasource(
              parameters: NoParams(
                error: ErrorReturnResult(
                  message: "Erro de conexão",
                ),
                nameFeature: "Checar Conecção",
                showRuntimeMilliseconds: true,
              ),
            ),
        throwsA(isA<Exception>()));
  });

  test(
      'Deve retornar um ErrorConeccao com Erro ao recuperar informação de conexão Cod.02-1',
      () async {
    when(data).calls(#checkConnectivity).thenThrow(Exception());
    expect(
        () async => await datasource(
              parameters: NoParams(
                error: ErrorReturnResult(
                  message: "Erro de conexão",
                ),
                nameFeature: "Checar Conecção",
                showRuntimeMilliseconds: true,
              ),
            ),
        throwsA(isA<Exception>()));
  });
}
