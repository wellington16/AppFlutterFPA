import 'package:cai_aqui/models/contacts.dart';
import 'package:flutter/material.dart';

class UserTile extends StatelessWidget {
  final Contact contact;

  const UserTile(this.contact);

  @override
  Widget build(BuildContext context) {
    final avatarUser = contact.avatar == null || contact.avatar.isEmpty
        ? CircleAvatar(
            child: Icon(Icons.person),
          )
        : CircleAvatar(
            backgroundImage: NetworkImage(contact.avatar),
          );

    return ListTile(
        leading: avatarUser,
        title: Text(contact.nome),
        subtitle: Container(
          child: Column(
            children: <Widget>[
              Text(
                contact.email,
                textAlign: TextAlign.left,
              ),
              Text(
                contact.telefone,
                textAlign: TextAlign.left,
              )
            ],
          ),
        ),
        trailing: Container(
          width: 100,
          child: Row(
            children: <Widget>[
              IconButton(
                icon: Icon(Icons.edit),
                color: Colors.green,
                onPressed: () {},
              ),
              IconButton(
                icon: Icon(Icons.delete),
                color: Colors.red,
                onPressed: () {},
              ),
            ],
          ),
        ));
  }
}
