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

  FirebaseResultadoThemeModel copyWith({
    String? newUser,
    Map? newPrimary,
    Map? newSecondary,
  }) {
    return FirebaseResultadoThemeModel(
      newUser: newUser ?? this.newUser,
      newPrimary: newPrimary ?? this.newPrimary,
      newSecondary: newSecondary ?? this.newSecondary,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'user': newUser,
      'primary': newPrimary,
      'secondary': newSecondary,
    };
  }

  factory FirebaseResultadoThemeModel.fromMap(Map<String, dynamic> map) {
    return FirebaseResultadoThemeModel(
      newUser: map['user'],
      newPrimary: Map.from(map['primary']),
      newSecondary: Map.from(map['secondary']),
    );
  }

  String toJson() => json.encode(toMap());

  factory FirebaseResultadoThemeModel.fromJson(String source) =>
      FirebaseResultadoThemeModel.fromMap(json.decode(source));

  @override
  String toString() =>
      'FirebaseResultadoThemeModel(newUser: $newUser, newPrimary: $newPrimary, newSecondary: $newSecondary)';
}
