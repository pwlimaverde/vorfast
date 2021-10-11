import 'package:dependency_module/dependency_module.dart';

enum KeyCorTema {
  primary,
  secondary,
}

extension KeyCorTemaExt on KeyCorTema {
  String get descricao {
    switch (this) {
      case KeyCorTema.primary:
        return "primary";
      case KeyCorTema.secondary:
        return "accent";
    }
  }
}

class ParametrosAtualizarCorTemas implements ParametersReturnResult {
  final Map<String, int> cor;
  final KeyCorTema key;
  final String user;
  @override
  final AppError error;
  @override
  final bool showRuntimeMilliseconds;
  @override
  final String nameFeature;

  ParametrosAtualizarCorTemas({
    required this.cor,
    required this.key,
    required this.user,
    required this.error,
    required this.showRuntimeMilliseconds,
    required this.nameFeature,
  });
}
