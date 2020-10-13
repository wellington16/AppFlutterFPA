import 'dart:async';
import 'dart:convert';

import 'package:cai_aqui/data/dummy_user.dart';
import 'package:cai_aqui/models/user.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class UserProvider with ChangeNotifier {
  static const _baseUrl = '';
  Map<String, User> _items = {...DUMMY_USER};
  final List<User> loadeduser = [];
  var resultado = false;
  Future<void> get all async {
    // Pegar todos
    final response = await http.get("$_baseUrl/users.json");
    if (response != null && response.statusCode == 200) {
      final extractedData = json.decode(response.body) as Map<String, dynamic>;
      extractedData.forEach((profileId, profileData) {
        // print(profileId);
        // print(profileData);

        _items.putIfAbsent(
          profileId,
          () => User(
            id: profileId,
            nome: profileData['nome'],
            email: profileData['email'],
            sexo: profileData['sexo'],
            idade: profileData['idade'],
            senha: profileData['senha'],
            comodos: profileData['comodos'],
            avatar: profileData['avatar'],
          ),
        );
      });
    }
  }

  Future<void> getUser(Map _formData) async {
    // Pegar todos
    final response = await http.get("$_baseUrl/users.json?print=pretty");
    print(json.decode(response.body));
    if (response != null && response.statusCode == 200) {
      final extractedData = json.decode(response.body) as Map<String, dynamic>;
      extractedData.forEach((profileId, profileData) {
        if (profileData['email'].toString() == _formData['email'] &&
            profileData['senha'].toString() == _formData['senha']) {
          return resultado = true;
        }
        return resultado = false;
      });
    }
  }

  int get count {
    return _items.length;
  }

  bool isUser() {
    return resultado;
  }

  User byIndex(int i) {
    return _items.values.elementAt(i);
  }

  Future<void> put(User user) async {
    if (user == null) {
      return;
    }

    // alterar
    if (user.id != null &&
        user.id.trim().isNotEmpty &&
        _items.containsKey(user.id)) {
      await http.patch(
        "$_baseUrl/users/${user.id}.json",
        body: jsonEncode({
          'nome': user.nome,
          'email': user.email,
          'sexo': user.sexo,
          'idade': user.idade,
          'comodos': user.comodos,
          'senha': user.senha,
          'avatar': user.avatar,
        }),
      );

      _items.update(
        user.id,
        (_) => User(
            id: user.id,
            nome: user.nome,
            email: user.email,
            sexo: user.sexo,
            idade: user.idade,
            comodos: user.comodos,
            avatar: user.avatar,
            senha: user.senha),
      );
    } else {
      final response = await http.post(
        "$_baseUrl/users.json",
        body: jsonEncode({
          'nome': user.nome,
          'email': user.email,
          'sexo': user.sexo,
          'idade': user.idade,
          'comodos': user.comodos,
          'senha': user.senha,
          'avatar': user.avatar,
        }),
      );
      final id = jsonDecode(response.body)['name'];
      // adcionar
      _items.putIfAbsent(
        id,
        () => User(
          id: id,
          nome: user.nome,
          email: user.email,
          sexo: user.sexo,
          idade: user.idade,
          comodos: user.comodos,
          avatar: user.avatar,
          senha: user.senha,
        ),
      );
    }
    notifyListeners();
  }

  Future<void> remove(User user) async {
    // remove
    if (user != null && user.id != null) {
      await http.delete(
        "$_baseUrl/users/${user.id}.json",
      );
      _items.remove(user.id);
      notifyListeners();
    }
  }
}
