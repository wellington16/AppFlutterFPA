import 'package:cai_aqui/models/contacts.dart';
import 'package:cai_aqui/provider/contacts_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ContactForm extends StatefulWidget {
  @override
  _ContactFormState createState() => _ContactFormState();
}

class _ContactFormState extends State<ContactForm> {
  final _form = GlobalKey<FormState>();
  bool isloading = false;
  final Map<String, String> _formData = {};

  void _loadFormData(Contact contact) {
    if (contact != null) {
      _formData['id'] = contact.id;
      _formData['nome'] = contact.nome;
      _formData['email'] = contact.email;
      _formData['telefone'] = contact.telefone;
      _formData['avatar'] = contact.avatar;
    }
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    final Contact contact = ModalRoute.of(context).settings.arguments;
    _loadFormData(contact);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Formulário de Contatos"),
        backgroundColor: Colors.green,
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.save),
            onPressed: () async {
              final isValid = _form.currentState.validate();
              if (isValid) {
                _form.currentState.save();

                setState(() {
                  isloading = true;
                });

                await Provider.of<ContactsProvider>(context, listen: false).put(
                  Contact(
                    id: _formData['id'],
                    nome: _formData['nome'],
                    email: _formData['email'],
                    telefone: _formData['telefone'],
                    avatar: _formData['avatar'],
                  ),
                );

                setState(() {
                  isloading = false;
                });
                Navigator.of(context).pop();
              }
            },
          ),
        ],
      ),
      body: isloading
          ? Center(
              child: CircularProgressIndicator(),
            )
          : Padding(
              padding: EdgeInsets.all(10),
              child: Form(
                key: _form,
                child: ListView(
                  children: [
                    TextFormField(
                      initialValue: _formData['nome'],
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                        labelText: "Nome",
                        labelStyle: TextStyle(
                          color: Colors.black38,
                          fontWeight: FontWeight.w400,
                          fontSize: 20,
                        ),
                      ),
                      style: TextStyle(
                        fontSize: 20,
                      ),
                      validator: (value) {
                        if (value == null || value.trim().isEmpty) {
                          return "Ocorreu um erro.";
                        }

                        if (value.trim().length < 3) {
                          return "Nome muito pequeno. No mínimo 3 letras.";
                        }

                        return null;
                      },
                      onSaved: (value) => _formData['nome'] = value,
                    ),
                    TextFormField(
                      initialValue: _formData['email'],
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                        labelText: "Email",
                        labelStyle: TextStyle(
                          color: Colors.black38,
                          fontWeight: FontWeight.w400,
                          fontSize: 20,
                        ),
                      ),
                      style: TextStyle(
                        fontSize: 20,
                      ),
                      validator: (value) {
                        if (value == null || value.trim().isEmpty) {
                          return "Ocorreu um erro.";
                        }

                        if (value.trim().length < 3) {
                          return "Nome muito pequeno. No mínimo 3 letras.";
                        }

                        return null;
                      },
                      onSaved: (value) => _formData['email'] = value,
                    ),
                    TextFormField(
                      initialValue: _formData['telefone'],
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                        labelText: "Telefone",
                        labelStyle: TextStyle(
                          color: Colors.black38,
                          fontWeight: FontWeight.w400,
                          fontSize: 20,
                        ),
                      ),
                      style: TextStyle(
                        fontSize: 20,
                      ),
                      validator: (value) {
                        if (value == null || value.trim().isEmpty) {
                          return "Ocorreu um erro.";
                        }

                        if (value.trim().length < 3) {
                          return "Nome muito pequeno. No mínimo 3 letras.";
                        }

                        return null;
                      },
                      onSaved: (value) => _formData['telefone'] = value,
                    ),
                    TextFormField(
                      initialValue: _formData['avatar'],
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                        labelText: "Avatar",
                        labelStyle: TextStyle(
                          color: Colors.black38,
                          fontWeight: FontWeight.w400,
                          fontSize: 20,
                        ),
                      ),
                      style: TextStyle(
                        fontSize: 20,
                      ),
                      onSaved: (value) => _formData['avatar'] = value,
                    ),
                  ],
                ),
              ),
            ),
    );
  }
}
