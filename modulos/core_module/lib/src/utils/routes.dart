enum Routes {
  initial,
  home,
  login,
  novoUser,
}

extension RoutesExt on Routes {
  String get caminho {
    switch (this) {
      case Routes.initial:
        return "/";
      case Routes.home:
        return "/home";
      case Routes.login:
        return "/login";
      case Routes.novoUser:
        return "/login/novo_user";
    }
  }
}
