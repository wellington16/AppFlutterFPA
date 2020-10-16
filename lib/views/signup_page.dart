import 'package:cai_aqui/models/user.dart';
import 'package:cai_aqui/provider/user_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:fluttertoast/fluttertoast.dart';

class SignupPage extends StatefulWidget {
  @override
  _SignupPageState createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  final _form = GlobalKey<FormState>();
  bool isloading = false;
  final Map<String, Object> _formData = {};

  void _loadFormData(User user) {
    if (user != null) {
      _formData['id'] = user.id;
      _formData['nome'] = user.nome;
      _formData['idade'] = user.idade;
      _formData['email'] = user.email;
      _formData['sexo'] = user.sexo;
      _formData['senha'] = user.senha;
      _formData['comodos'] = user.comodos;
      _formData['avatar'] = user.avatar;
    }
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    final User user = ModalRoute.of(context).settings.arguments;
    _loadFormData(user);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: isloading
          ? Center(
              child: CircularProgressIndicator(),
            )
          : Padding(
              padding: EdgeInsets.all(20),
              child: Form(
                key: _form,
                child: ListView(
                  children: <Widget>[
                    Container(
                      width: 200,
                      height: 200,
                      alignment: Alignment(0.0, 1.15),
                      decoration: new BoxDecoration(
                        image: new DecorationImage(
                          image: AssetImage("assets/profile-icon.png"),
                          fit: BoxFit.fitHeight,
                        ),
                      ),
                      child: Container(
                        height: 56,
                        width: 56,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                            stops: [0.3, 1.0],
                            colors: [
                              Color(0XFF23af23),
                              Color(0XFF672c81),
                            ],
                          ),
                          border: Border.all(
                            width: 4.0,
                            color: const Color(0xFFFFFFFF),
                          ),
                          borderRadius: BorderRadius.all(
                            Radius.circular(56),
                          ),
                        ),
                        child: SizedBox.expand(
                          child: FlatButton(
                            child: Icon(
                              Icons.add,
                              color: Colors.white,
                            ),
                            onPressed: () {},
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    TextFormField(
                      // autofocus: true,
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
                          return "Ocorreu um erro. Campo vazio!";
                        }

                        if (!(value is String) || value.trim().length < 3) {
                          return 'O Nome deve ter mais de 2 caracteres';
                        }

                        return null;
                      },
                      onSaved: (value) => _formData['nome'] = value,
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    TextFormField(
                      // autofocus: true,
                      initialValue: _formData['sexo'],
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                        labelText: "Sexo",
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
                          return "Ocorreu um erro. Campo vazio!";
                        }

                        if (!(value is String) || value.trim().length < 3) {
                          return "Sexo inválido! Ex.: masculino, feminino, outros";
                        }

                        return null;
                      },
                      onSaved: (value) => _formData['sexo'] = value,
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    TextFormField(
                      // autofocus: true,
                      initialValue: _formData['idade'],
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                        labelText: "Idade",
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
                          return "Ocorreu um erro. Campo vazio!";
                        }

                        bool isNumeric(value) {
                          final result =
                              double.parse(value, (e) => null) != null;
                          return !result;
                        }

                        if (value.trim().length < 2 || isNumeric(value)) {
                          return "Idade Inválida!";
                        }
                        if (int.parse(value) < 10 || int.parse(value) > 160) {
                          return "Idade Inválida!";
                        }

                        return null;
                      },
                      onSaved: (value) => _formData['idade'] = value,
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    TextFormField(
                      // autofocus: true,
                      initialValue: _formData['comodos'],
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                        labelText: "Quantidade de Cômodos",
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
                          return "Ocorreu um erro. Campo vazio!";
                        }

                        bool isNumeric(value) {
                          final result =
                              double.parse(value, (e) => null) != null;
                          return !result;
                        }

                        if (value.trim().length < 1 || isNumeric(value)) {
                          return "Quantidade de Comodos Inválida!";
                        }
                        return null;
                      },
                      onSaved: (value) => _formData['comodos'] = value,
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    TextFormField(
                      // autofocus: true,
                      initialValue: _formData['email'],
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                        labelText: "E-mail",
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
                          return "Ocorreu um erro. Campo vazio!";
                        }
                        Pattern pattern =
                            r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
                        RegExp regex = new RegExp(pattern);
                        if (!regex.hasMatch(value)) {
                          return "Email inválido!";
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
                      initialValue: _formData['senha'],
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
                          return "Senha Inválida! Exemplo de senha Válida: Tusing6!";
                        }
                        if (value.trim().length < 6) {
                          return "Senha muito pequena. No mínimo 3 letras.";
                        }

                        return null;
                      },
                      onSaved: (value) => _formData['senha'] = value,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      height: 60,
                      alignment: Alignment.centerLeft,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                          stops: [0.3, 1],
                          colors: [
                            Color(0XFF23af23),
                            Color(0XFF672c81),
                          ],
                        ),
                        borderRadius: BorderRadius.all(
                          Radius.circular(5),
                        ),
                      ),
                      child: SizedBox.expand(
                        child: FlatButton(
                          child: Text(
                            "Cadastrar",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                              fontSize: 20,
                            ),
                            textAlign: TextAlign.center,
                          ),
                          onPressed: () async {
                            final isValid = _form.currentState.validate();
                            if (isValid) {
                              _form.currentState.save();

                              setState(() {
                                isloading = true;
                              });

                              await Provider.of<UserProvider>(context,
                                      listen: false)
                                  .put(
                                User(
                                  id: _formData['id'],
                                  nome: _formData['nome'],
                                  email: _formData['email'],
                                  idade: _formData['idade'],
                                  sexo: _formData['sexo'],
                                  senha: _formData['senha'],
                                  comodos: _formData['comodos'],
                                  avatar: _formData['avatar'],
                                ),
                              );
                              Fluttertoast.showToast(
                                msg: "Cadastro salvo com sucesso!",
                                toastLength: Toast.LENGTH_SHORT,
                                gravity: ToastGravity.CENTER,
                                timeInSecForIosWeb: 2,
                                backgroundColor: Colors.green,
                                textColor: Colors.white,
                                fontSize: 16.0,
                              );
                              setState(() {
                                isloading = false;
                              });
                              Navigator.of(context).pop();
                            }
                          },
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      height: 40,
                      alignment: Alignment.center,
                      child: FlatButton(
                        child: Text(
                          "Cancelar",
                          textAlign: TextAlign.center,
                        ),
                        onPressed: () => Navigator.of(context).pop(),
                      ),
                    ),
                  ],
                ),
              ),
            ),
    );
  }
}
