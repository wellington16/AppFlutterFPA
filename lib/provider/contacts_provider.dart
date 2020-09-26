import 'dart:math';

import 'package:cai_aqui/data/dummy_contacts.dart';
import 'package:cai_aqui/models/contacts.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ContactsProvider with ChangeNotifier {
  Map<String, Contact> _items = {...DUMMY_CONTACTS};

  List<Contact> get all {
    return [..._items.values];
  }

  int get count {
    return _items.length;
  }

  Contact byIndex(int i) {
    return _items.values.elementAt(i);
  }

  void put(Contact contact) {
    if (contact == null) {
      return;
    }

    // alterar
    if (contact.id != null &&
        contact.id.trim().isNotEmpty &&
        _items.containsKey(contact.id)) {
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
      // adcionar
      final id = Random().nextDouble().toString();
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

  void remove(Contact contact) {
    if (contact != null && contact.id != null) {
      _items.remove(contact.id);
      notifyListeners();
    }
  }
}
