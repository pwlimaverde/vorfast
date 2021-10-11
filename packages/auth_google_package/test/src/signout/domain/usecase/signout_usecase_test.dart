import 'package:auth_google_package/src/features/signout/domain/usecase/signout_usecase.dart';
import 'package:auth_google_package/src/utils/erros_auth_google.dart';
import 'package:dependency_module/dependency_module.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class FairebaseSigninDatasource extends Mock implements Datasource<bool> {}

void main() {
  late Datasource<bool> datasource;
  late UseCaseImplement<bool> usecase;

  setUp(() {
    datasource = FairebaseSigninDatasource();
    usecase = SignOutUsecase(
      datasource: datasource,
    );
  });

  test('Deve retornar um sucesso com bool', () async {
    when(datasource).calls(#call).thenAnswer((_) => Future.value(true));
    final result = await usecase(
      parameters: NoParams(
        error: ErroSignOut(
          message: "Erro ao fazer o signout",
        ),
        nameFeature: "Signout",
        showRuntimeMilliseconds: true,
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

  test('Deve retornar um ErroSignOut - Erro ao fazer o signout', () async {
    when(datasource).calls(#call).thenAnswer((_) => Future.value(false));
    final result = await usecase(
      parameters: NoParams(
        error: ErroSignOut(
          message: "Erro ao fazer o signout",
        ),
        nameFeature: "Signout",
        showRuntimeMilliseconds: true,
      ),
    );
    print("teste result - ${await result.fold(
      success: (value) => value.result,
      error: (value) => value.error,
    )}");
    expect(result, isA<ErrorReturn<bool>>());
  });

  test('Deve retornar um ErroSignOut - Exeption', () async {
    when(datasource).calls(#call).thenThrow(Exception());
    final result = await usecase(
      parameters: NoParams(
        error: ErroSignOut(
          message: "Erro ao fazer o signout",
        ),
        nameFeature: "Signout",
        showRuntimeMilliseconds: true,
      ),
    );
    print("teste result - ${await result.fold(
      success: (value) => value.result,
      error: (value) => value.error,
    )}");
    expect(result, isA<ErrorReturn<bool>>());
  });
}
