import 'package:cai_aqui/Componentes/contact_tile.dart';
import 'package:cai_aqui/provider/contacts_provider.dart';
import 'package:cai_aqui/routes/app_routes.dart';
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
              Navigator.of(context).pushNamed(
                AppRoutes.CONTACT_FORM,
              );
            },
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
