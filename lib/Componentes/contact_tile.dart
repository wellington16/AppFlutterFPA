import 'package:cai_aqui/models/contacts.dart';
import 'package:cai_aqui/provider/contacts_provider.dart';
import 'package:cai_aqui/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class UserTile extends StatefulWidget {
  final Contact contact;

  const UserTile(this.contact);

  @override
  _UserTileState createState() => _UserTileState();
}

class _UserTileState extends State<UserTile> {
  bool isloading = false;

  @override
  Widget build(BuildContext context) {
    final avatarUser =
        widget.contact.avatar == null || widget.contact.avatar.isEmpty
            ? CircleAvatar(
                child: Icon(Icons.person),
              )
            : CircleAvatar(
                backgroundImage: NetworkImage(widget.contact.avatar),
              );

    return ListTile(
        leading: avatarUser,
        title: Text(widget.contact.nome),
        subtitle: Container(
          child: Column(
            children: <Widget>[
              Text(
                widget.contact.email,
                textAlign: TextAlign.left,
              ),
              Text(
                widget.contact.telefone,
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
                onPressed: () {
                  Navigator.of(context).pushNamed(
                    AppRoutes.CONTACT_FORM,
                    arguments: widget.contact,
                  );
                },
              ),
              IconButton(
                icon: Icon(Icons.delete),
                color: Colors.red,
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (cxt) => AlertDialog(
                      title: Text("Excluir Contato"),
                      content: Text("Deseja realmente exluir este Contato?"),
                      actions: <Widget>[
                        FlatButton(
                          child: Text("Não"),
                          onPressed: () => Navigator.of(context).pop(false),
                        ),
                        FlatButton(
                          child: Text("Sim"),
                          onPressed: () => Navigator.of(context).pop(true),
                        ),
                      ],
                    ),
                  ).then((confirmed) => {
                        if (confirmed)
                          {
                            setState(() {
                              isloading = true;
                            }),
                            if (isloading == true)
                              {
                                Center(
                                  child: CircularProgressIndicator(),
                                ),
                                Provider.of<ContactsProvider>(context,
                                        listen: false)
                                    .remove(widget.contact),
                              },
                            setState(() {
                              isloading = true;
                            }),
                          }
                      });
                },
              ),
            ],
          ),
        ));
  }
}
