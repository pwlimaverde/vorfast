import 'package:dependency_module/dependency_module.dart';

class ErroCarregarTemas implements AppError {
  @override
  String message;
  ErroCarregarTemas({
    required this.message,
  });

  @override
  String toString() {
    return "ErroCarregarTemas - $message";
  }
}

class ErroCarregarConfiguracaoTemas implements AppError {
  @override
  String message;
  ErroCarregarConfiguracaoTemas({
    required this.message,
  });

  @override
  String toString() {
    return "ErroCarregarTemas - $message";
  }
}

class ErroAtualizarCorTemas implements AppError {
  @override
  String message;
  ErroAtualizarCorTemas({
    required this.message,
  });

  @override
  String toString() {
    return "ErroAtualizarCorTemas - $message";
  }
}
