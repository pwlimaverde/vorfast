import 'package:auth_google_package/src/features/recuperar_senha_email/domain/usecase/recuperar_senha_email_usecase.dart';
import 'package:auth_google_package/src/utils/Parametros.dart';
import 'package:auth_google_package/src/utils/erros_auth_google.dart';
import 'package:dependency_module/dependency_module.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class FairebaseRecuperarSenhaDatasource extends Mock
    implements Datasource<bool> {}

void main() {
  late Datasource<bool> datasource;
  late UseCaseImplement<bool> usecase;

  setUp(() {
    datasource = FairebaseRecuperarSenhaDatasource();
    usecase = RecuperarSenhaEmailUsecase(
      datasource: datasource,
    );
  });

  test('Deve retornar um sucesso com bool', () async {
    when(datasource).calls(#call).thenAnswer((_) => Future.value(true));
    final result = await usecase(
      parameters: ParametrosRecuperarSenhaEmail(
        error: ErroRecuperarSenhaEmail(
          message: "Erro ao carregar recuperar a senha",
        ),
        nameFeature: "Recuperar a Senha pelo email",
        showRuntimeMilliseconds: true,
        email: 'any',
      ),
    );
    print("teste result - ${await result.fold(
      success: (value) => value.result,
      error: (value) => value.error,
    )}");
    expect(result, isA<SuccessReturn<bool>>());
    expect(
        result.fold(
          success: (value) => value.result,
          error: (value) => value.error,
        ),
        equals(true));
  });

  test('Deve retornar um ErroRecuperarSenhaEmail - Erro ao recuperar a senha',
      () async {
    when(datasource).calls(#call).thenAnswer((_) => Future.value(false));
    final result = await usecase(
      parameters: ParametrosRecuperarSenhaEmail(
        error: ErroRecuperarSenhaEmail(
          message: "Erro ao recuperar a senha",
        ),
        nameFeature: "Recuperar a Senha pelo email",
        showRuntimeMilliseconds: true,
        email: 'any',
      ),
    );
    print("teste result - ${await result.fold(
      success: (value) => value.result,
      error: (value) => value.error,
    )}");
    expect(result, isA<ErrorReturn<bool>>());
  });

  test('Deve ErroRecuperarSenhaEmail - Exeption', () async {
    when(datasource).calls(#call).thenThrow(Exception());
    final result = await usecase(
      parameters: ParametrosRecuperarSenhaEmail(
        error: ErroRecuperarSenhaEmail(
          message: "Erro ao carregar recuperar a senha",
        ),
        nameFeature: "Recuperar a Senha pelo email",
        showRuntimeMilliseconds: true,
        email: 'any',
      ),
    );
    print("teste result - ${await result.fold(
      success: (value) => value.result,
      error: (value) => value.error,
    )}");
    expect(result, isA<ErrorReturn<bool>>());
  });
}
