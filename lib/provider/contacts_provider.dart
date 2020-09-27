import 'dart:async';
import 'dart:convert';

import 'package:cai_aqui/data/dummy_contacts.dart';
import 'package:cai_aqui/models/contacts.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ContactsProvider with ChangeNotifier {
  static const _baseUrl = '';
  Map<String, Contact> _items = {...DUMMY_CONTACTS};
  final List<Contact> loadedContacts = [];

  Future<void> get all async {
    final response = await http.get("$_baseUrl/contacts.json?");
    if (response != null && response.statusCode == 200) {
      final extractedData = json.decode(response.body) as Map<String, dynamic>;
      extractedData.forEach((profileId, profileData) {
        print(profileId);
        print(profileData);

        _items.putIfAbsent(
          profileId,
          () => Contact(
            id: profileId,
            nome: profileData['nome'],
            email: profileData['email'],
            telefone: profileData['telefone'],
            avatar: profileData['avatar'],
          ),
        );
      });
    }
  }

  int get count {
    return _items.length;
    // print(loadedContacts.length);
    // return loadedContacts.length;
  }

  Contact byIndex(int i) {
    return _items.values.elementAt(i);
    // return loadedContacts.elementAt(i);
  }

  Future<void> put(Contact contact) async {
    if (contact == null) {
      return;
    }

    // alterar
    if (contact.id != null &&
        contact.id.trim().isNotEmpty &&
        _items.containsKey(contact.id)) {
      await http.patch(
        "$_baseUrl/contacts/${contact.id}.json",
        body: jsonEncode({
          'nome': contact.nome,
          'email': contact.email,
          'telefone': contact.telefone,
          'avatar': contact.avatar,
        }),
      );

      _items.update(
        contact.id,
        (_) => Contact(
          id: contact.id,
          nome: contact.nome,
          email: contact.email,
          telefone: contact.telefone,
          avatar: contact.avatar,
        ),
      );
    } else {
      final response = await http.post(
        "$_baseUrl/contacts.json",
        body: jsonEncode({
          'nome': contact.nome,
          'email': contact.email,
          'telefone': contact.telefone,
          'avatar': contact.avatar,
        }),
      );
      final id = jsonDecode(response.body)['name'];
      // adcionar
      _items.putIfAbsent(
        id,
        () => Contact(
          id: id,
          nome: contact.nome,
          email: contact.email,
          telefone: contact.telefone,
          avatar: contact.avatar,
        ),
      );
    }
    notifyListeners();
  }

  Future<void> remove(Contact contact) async {
    if (contact != null && contact.id != null) {
      await http.delete(
        "$_baseUrl/contacts/${contact.id}.json",
      );
      _items.remove(contact.id);
      notifyListeners();
    }
  }
}
