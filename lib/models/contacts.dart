import 'package:flutter/cupertino.dart';

class Contact {
  final String id;
  final String nome;
  final String email;
  final String telefone;
  final String avatar;

  const Contact({
    this.id,
    @required this.nome,
    @required this.email,
    @required this.telefone,
    @required this.avatar,
  });
}
