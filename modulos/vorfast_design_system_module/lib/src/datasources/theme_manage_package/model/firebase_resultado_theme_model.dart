import 'dart:convert';

import 'package:dependency_module/dependency_module.dart';

class FirebaseResultadoThemeModel extends ResultadoTheme {
  final String newUser;
  final Map newPrimary;
  final Map newSecondary;

  FirebaseResultadoThemeModel({
    required this.newUser,
    required this.newPrimary,
    required this.newSecondary,
  }) : super(
          user: newUser,
          primary: newPrimary,
          secondary: newSecondary,
        );

  Map<String, dynamic> toMap() {
    return {
      'user': newUser,
      'primary': newPrimary,
      'secondary': newSecondary,
    };
  }

  factory FirebaseResultadoThemeModel.fromMap({
    required Map<String, dynamic> map,
  }) {
    return FirebaseResultadoThemeModel(
      newUser: map['user'] ?? "",
      newPrimary: map['primary'] ?? "",
      newSecondary: map['secondary'] ?? "",
    );
  }

  String toJson() => json.encode(toMap());

  @override
  String toString() {
    return "User - $user - Primary - $primary Accent - $secondary";
  }
}
