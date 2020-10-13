import 'package:flutter/cupertino.dart';

class User {
  final String id;
  final String nome;
  final String email;
  final String senha;
  final String idade;
  final String sexo;
  final String comodos;
  final String avatar;

  const User({
    this.id,
    @required this.nome,
    @required this.email,
    @required this.senha,
    @required this.idade,
    @required this.sexo,
    @required this.comodos,
    @required this.avatar,
  });
}
