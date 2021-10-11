import 'package:carregar_temas_package/carregar_temas_package.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class FirebaseResultadoThemeModel extends ResultadoTheme {
  final DocumentReference? reference;
  final String user;
  final Map primary;
  final Map accent;

  FirebaseResultadoThemeModel({
    this.reference,
    required this.user,
    required this.primary,
    required this.accent,
  }) : super(
          user: user,
          primary: primary,
          accent: accent,
        );

  factory FirebaseResultadoThemeModel.fromDocument(
      {required DocumentSnapshot doc}) {
    return FirebaseResultadoThemeModel(
      reference: doc.reference,
      user: doc.data()!['user'],
      primary: doc.data()!['primary'],
      accent: doc.data()!['accent'],
    );
  }

  Map<String, dynamic> toJson() {
    Map<String, dynamic> data = Map<String, dynamic>();
    data['user'] = this.user;
    data['primary'] = this.primary;
    data['accent'] = this.accent;
    return data;
  }

  factory FirebaseResultadoThemeModel.fromJson(
      {required Map<String, dynamic> json}) {
    return FirebaseResultadoThemeModel(
      user: json['user'],
      primary: json['primary'],
      accent: json['accent'],
    );
  }

  @override
  String toString() {
    return "User - $user - Primary - $primary Accent - $accent";
  }
}
