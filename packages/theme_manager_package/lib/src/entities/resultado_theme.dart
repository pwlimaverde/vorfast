class ResultadoTheme {
  final String user;
  final Map primary;
  final Map secondary;

  ResultadoTheme({
    required this.user,
    required this.primary,
    required this.secondary,
  });

  @override
  String toString() {
    return "User => $user - Primary => $primary ";
  }
}
