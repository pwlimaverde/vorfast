import 'package:dependency_module/dependency_module.dart';

import '../../auth_google_package.dart';

class ParametrosRecuperarSenhaEmail implements ParametersReturnResult {
  final String email;
  final AppError error;
  final bool showRuntimeMilliseconds;
  final String nameFeature;

  ParametrosRecuperarSenhaEmail({
    required this.email,
    required this.error,
    required this.showRuntimeMilliseconds,
    required this.nameFeature,
  });
}

class ParametrosSignIn implements ParametersReturnResult {
  final String? email;
  final String? pass;
  final ResultadoUsuario? user;
  final AppError error;
  final bool showRuntimeMilliseconds;
  final String nameFeature;

  ParametrosSignIn({
    this.email,
    this.pass,
    this.user,
    required this.error,
    required this.showRuntimeMilliseconds,
    required this.nameFeature,
  });
}
