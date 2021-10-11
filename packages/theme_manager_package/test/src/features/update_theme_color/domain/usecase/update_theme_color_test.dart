import 'package:dependency_module/dependency_module.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:rxdart/rxdart.dart';
import 'package:theme_manager_package/src/entities/resultado_theme.dart';
import 'package:theme_manager_package/src/features/update_theme_color/domain/usecase/update_theme_color.dart';
import 'package:theme_manager_package/src/utils/erros_carregar_temas.dart';
import 'package:theme_manager_package/src/utils/parametros.dart';

class FairebaseAtualizarCorTemasDatasourceMock extends Mock
    implements Datasource<bool> {}

void main() {
  late Datasource<bool> datasource;
  late UseCaseImplement<bool> usecase;

  setUp(() {
    datasource = FairebaseAtualizarCorTemasDatasourceMock();
    usecase = UpdateThemeColorsUsecase(datasource: datasource);
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
    when(datasource).calls(#call).thenAnswer(
          (_) => Future.value(true),
        );
    final result = await usecase(
      parameters: ParametrosAtualizarCorTemas(
        cor: {
          "r": 60,
          "g": 60,
          "b": 60,
        },
        key: KeyCorTema.primary,
        user: "uidfirebase",
        error: ErroAtualizarCorTemas(message: "teste erro"),
        nameFeature: "Update color theme",
        showRuntimeMilliseconds: true,
      ),
    );
    expect(result, isA<SuccessReturn<bool>>());
    expect(
      result.fold(
        success: (value) => value.result,
        error: (value) => value.error,
      ),
      equals(true),
    );
    testeFire.close();
  });

  test('Deve ErroCarregarTemas com Erro ao carregar os dados tema Cod.02-1',
      () async {
    when(datasource).calls(#call).thenThrow(Exception());
    final result = await usecase(
      parameters: ParametrosAtualizarCorTemas(
        cor: {
          "r": 60,
          "g": 60,
          "b": 60,
        },
        key: KeyCorTema.primary,
        user: "uidfirebase",
        error: ErroAtualizarCorTemas(message: "teste erro"),
        nameFeature: "Update color theme",
        showRuntimeMilliseconds: true,
      ),
    );
    expect(result, isA<ErrorReturn<bool>>());
    expect(
        result.fold(
          success: (value) => value.result,
          error: (value) => value.error,
        ),
        isA<ErroAtualizarCorTemas>());
  });
}
