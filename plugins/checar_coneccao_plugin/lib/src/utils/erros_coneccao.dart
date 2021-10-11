import 'package:dependency_module/dependency_module.dart';

class ErrorConeccao implements AppError {
  String message;
  ErrorConeccao({
    required this.message,
  });

  @override
  String toString() {
    return "ErrorConeccao - $message";
  }
}
