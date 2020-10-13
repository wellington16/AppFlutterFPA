import 'dart:convert';

import 'package:cai_aqui/models/user.dart';
import 'package:cai_aqui/provider/contacts_provider.dart';
import 'package:cai_aqui/provider/user_provider.dart';
import 'package:cai_aqui/routes/app_routes.dart';
import 'package:cai_aqui/views/home_page.dart';
import 'package:cai_aqui/views/reset_password_page.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    final _form = GlobalKey<FormState>();
    final ContactsProvider contact = Provider.of(context);
    final UserProvider user = Provider.of(context);
    final Map<String, Object> _formData = {};
    contact.all;
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(20.0),
        color: Colors.white,
        child: Form(
          key: _form,
          child: ListView(
            children: <Widget>[
              SizedBox(
                height: 40,
              ),
              SizedBox(
                width: 128,
                height: 128,
                child: Image.asset("assets/logo.png"),
              ),
              SizedBox(
                height: 20,
              ),
              TextFormField(
                // autofocus: true,
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  labelText: "E-mail",
                  labelStyle: TextStyle(
                    color: Colors.black38,
                    fontWeight: FontWeight.w400,
                    fontSize: 20,
                  ),
                ),
                style: TextStyle(fontSize: 20),
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return "Ocorreu um erro. Campo vazio!";
                  }
                  Pattern pattern =
                      r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
                  RegExp regex = new RegExp(pattern);
                  if (!regex.hasMatch(value)) {
                    return "email inválido!";
                  }

                  return null;
                },
                onSaved: (value) => _formData['email'] = value,
              ),
              SizedBox(
                height: 10,
              ),
              TextFormField(
                // autofocus: true,
                keyboardType: TextInputType.text,
                obscureText: true,
                decoration: InputDecoration(
                  labelText: "Senha",
                  labelStyle: TextStyle(
                    color: Colors.black38,
                    fontWeight: FontWeight.w400,
                    fontSize: 20,
                  ),
                ),
                style: TextStyle(fontSize: 20),
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return "Ocorreu um erro. Campo vazio!";
                  }
                  bool validateStructure(String value) {
                    String pattern =
                        r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$';
                    RegExp regExp = new RegExp(pattern);
                    final result = regExp.hasMatch(value);
                    return result;
                  }

                  if (!validateStructure(value)) {
                    return "Senha Inválida!";
                  }
                  if (value.trim().length < 6) {
                    return "Senha muito pequena. No mínimo 3 letras.";
                  }

                  return null;
                },
                onSaved: (value) => _formData['senha'] = value,
              ),
              Container(
                height: 40,
                alignment: Alignment.centerRight,
                child: FlatButton(
                  child: Text(
                    "Recuperar Senha",
                    textAlign: TextAlign.right,
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ResetPasswordPage(),
                      ),
                    );
                  },
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                height: 60,
                alignment: Alignment.centerLeft,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(
                    Radius.circular(5),
                  ),
                  // color: Colors.green,
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    stops: [0.3, 1],
                    colors: [
                      Color(0XFF23af23),
                      Color(0XFF672c81),
                    ],
                  ),
                ),
                child: SizedBox.expand(
                  child: FlatButton(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(
                          "Login",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            fontSize: 20,
                          ),
                          textAlign: TextAlign.left,
                        ),
                        Container(
                          child: SizedBox(
                            child: Image.asset("assets/logo.png"),
                            height: 28,
                            width: 28,
                          ),
                        )
                      ],
                    ),
                    onPressed: () async {
                      final isValid = _form.currentState.validate();
                      if (isValid) {
                        _form.currentState.save();

                        await user.getUser(_formData);

                        if (user.isUser()) {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => HomePage(),
                            ),
                          );
                        } else {
                          Fluttertoast.showToast(
                            msg: "Login e/ou Senha Inválido!",
                            toastLength: Toast.LENGTH_SHORT,
                            gravity: ToastGravity.CENTER,
                            timeInSecForIosWeb: 2,
                            backgroundColor: Colors.red,
                            textColor: Colors.white,
                            fontSize: 16.0,
                          );
                        }
                      }
                    },
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                height: 60,
                alignment: Alignment.centerLeft,
                decoration: BoxDecoration(
                  color: Color(0xFF3C5A99),
                  borderRadius: BorderRadius.all(
                    Radius.circular(5),
                  ),
                ),
                child: SizedBox.expand(
                  child: FlatButton(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(
                          "Login com Facebook",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            fontSize: 20,
                          ),
                          textAlign: TextAlign.left,
                        ),
                        Container(
                          child: SizedBox(
                            child: Image.asset("assets/fb-icon.png"),
                            height: 28,
                            width: 28,
                          ),
                        )
                      ],
                    ),
                    onPressed: () {},
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                height: 40,
                child: FlatButton(
                  child: Text(
                    "Cadastre-se",
                    textAlign: TextAlign.center,
                  ),
                  onPressed: () {
                    Navigator.of(context).pushNamed(
                      AppRoutes.USER_FORM,
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
