import 'package:cai_aqui/pages/login_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Splash extends StatefulWidget {
  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<Splash> {

  @override
  void initState() {
    super.initState();
    SystemChrome.setEnabledSystemUIOverlays([]);
    Future.delayed(Duration(seconds: 180)).then((_) {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => LoginPage()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:
        Container(
        color: Colors.white,
          child: ListView(
          children: <Widget>[
            Container(
              width: 150,
              height: 150,
              child: Image.asset("assets/logo.png"),
            ),
            Container(
              child: Center(
                child: SizedBox(
                  child: Text(
                    "Caí Aqui",
                    style: TextStyle(
                      fontSize: 50,
                      fontWeight: FontWeight.w500,
                      color: Color(0XFF23af23),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
          padding:EdgeInsets.fromLTRB(20.0, 150.0, 20.0, 60.0) ,
        ),
    );
  }
}