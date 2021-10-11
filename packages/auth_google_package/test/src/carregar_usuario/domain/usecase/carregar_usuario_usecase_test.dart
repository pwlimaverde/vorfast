import 'package:auth_google_package/src/entities/resultado_usuario.dart';
import 'package:auth_google_package/src/features/carregar_usuario/domain/usecase/carregar_usuario_usecase.dart';
import 'package:auth_google_package/src/utils/erros_auth_google.dart';
import 'package:dependency_module/dependency_module.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:rxdart/rxdart.dart';

class FairebaseUsuarioDatasource extends Mock
    implements Datasource<Stream<ResultadoUsuario>> {}

void main() {
  late Datasource<Stream<ResultadoUsuario>> datasource;
  late UseCaseImplement<Stream<ResultadoUsuario>> usecase;

  setUp(() {
    datasource = FairebaseUsuarioDatasource();
    usecase = CarregarUsuarioUsecase(
      datasource: datasource,
    );
  });

  test('Deve retornar um sucesso com Stream<ResultadoUsuario>', () async {
    final testeFire = BehaviorSubject<ResultadoUsuario>();
    testeFire.add(
      ResultadoUsuario(
        id: "1",
        nome: "Paulo Weslley",
        email: "Paulo Weslley",
        administrador: true,
      ),
    );
    when(datasource).calls(#call).thenAnswer((_) => Future.value(testeFire));
    final result = await usecase(
      parameters: NoParams(
        error: ErroCarregarUsuario(
          message: "Erro ao carregar os dados do Usuário",
        ),
        nameFeature: "Carregar Usuario",
        showRuntimeMilliseconds: true,
      ),
    );
    print("teste result - ${await result.fold(
          success: (value) => value.result,
          error: (value) => value.error,
        ).first}");
    expect(result, isA<SuccessReturn<Stream<ResultadoUsuario>>>());
    expect(
        result.fold(
          success: (value) => value.result,
          error: (value) => value.error,
        ),
        isA<Stream<ResultadoUsuario>>());
    testeFire.close();
  });

  test(
      'Deve ErroCarregarUsuario com Erro ao carregar os dados do Usuario Cod.02-1',
      () async {
    when(datasource).calls(#call).thenThrow(Exception());
    final result = await usecase(
      parameters: NoParams(
        error: ErroCarregarUsuario(
          message: "Erro ao carregar os dados do Usuário",
        ),
        nameFeature: "Carregar Usuario",
        showRuntimeMilliseconds: true,
      ),
    );
    print("teste result - ${await result.fold(
      success: (value) => value.result,
      error: (value) => value.error,
    )}");
    expect(result, isA<ErrorReturn<Stream<ResultadoUsuario>>>());
  });
}
