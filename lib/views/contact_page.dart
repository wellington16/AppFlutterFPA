import 'package:cai_aqui/Componentes/contact_tile.dart';
import 'package:cai_aqui/data/dummy_contacts.dart';
import 'package:cai_aqui/models/contacts.dart';
import 'package:cai_aqui/provider/contacts_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ContatosPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final ContactsProvider contact = Provider.of(context);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Center(
          child: SizedBox(
            child: Text(
              "Contatos",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w500,
                // color: Color(0XFF23af23),
              ),
            ),
          ),
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () {
              // contact.remove(contact.byIndex(0));
              contact.put(
                Contact(
                    id: "2",
                    nome: "Joao Candido 1",
                    email: "teste@testeees.com",
                    telefone: "81 99595-9588",
                    avatar: ''),
              );

              // contact.put(Contact(
              //     nome: "Joao Candido",
              //     email: "teste@teste.com",
              //     telefone: "81 99595-9595",
              //     avatar: ''));
            },
            // color: Colors.green,
          )
        ],
      ),
      body: ListView.builder(
        itemCount: contact.count,
        itemBuilder: (cxt, i) => UserTile(contact.byIndex(i)),
      ),
    );
  }
}
