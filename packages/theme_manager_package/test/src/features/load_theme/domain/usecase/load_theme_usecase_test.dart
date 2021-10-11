import 'package:dependency_module/dependency_module.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:rxdart/rxdart.dart';
import 'package:theme_manager_package/src/entities/resultado_theme.dart';
import 'package:theme_manager_package/src/features/load_theme/domain/usecase/load_theme_usecase.dart';
import 'package:theme_manager_package/src/utils/erros_carregar_temas.dart';

class FairebaseThemeDatasourceMock extends Mock
    implements Datasource<Stream<ResultadoTheme>> {}

void main() {
  late Datasource<Stream<ResultadoTheme>> datasource;
  late UseCaseImplement<Stream<ResultadoTheme>> usecase;

  setUp(() {
    datasource = FairebaseThemeDatasourceMock();
    usecase = LoadThemeUsecase(datasource: datasource);
  });

  test('Deve retornar um sucesso com true', () async {
    final testeFire = BehaviorSubject<ResultadoTheme>();
    testeFire.add(
      ResultadoTheme(
        secondary: {"r": 58},
        primary: {"r": 150},
        user: "paulo",
      ),
    );
    when(datasource).calls(#call).thenAnswer((_) => Future.value(testeFire));
    final result = await usecase(
      parameters: NoParams(
        error: ErroCarregarConfiguracaoTemas(
          message: "Erro ao carregar as configurações do tema",
        ),
        nameFeature: "Checar Conecção",
        showRuntimeMilliseconds: true,
      ),
    );
    expect(result, isA<SuccessReturn<Stream<ResultadoTheme>>>());
    expect(
        result.fold(
          success: (value) => value.result,
          error: (value) => value.error,
        ),
        isA<Stream<ResultadoTheme>>());
    testeFire.close();
  });

  test('Deve ErroCarregarTemas com Erro ao carregar os dados tema Cod.02-1',
      () async {
    when(datasource).calls(#call).thenThrow(Exception());
    final result = await usecase(
      parameters: NoParams(
        error: ErroCarregarConfiguracaoTemas(
          message: "Erro ao carregar as configurações do tema",
        ),
        nameFeature: "Checar Conecção",
        showRuntimeMilliseconds: true,
      ),
    );
    expect(result, isA<ErrorReturn<Stream<ResultadoTheme>>>());
  });
}
