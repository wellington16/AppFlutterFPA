// import 'dart:async';
import 'package:cai_aqui/pages/login_page.dart';
import 'package:flutter/material.dart';
// import 'package:sensors/sensors.dart';

// import 'snake.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Caí Aqui!',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.deepOrange,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: LoginPage(),
    );
  }
}

// class LoginPage extends StatefulWidget {
//   @override
//   _LoginState createState() => _LoginState();
// }

// class _LoginState extends State<LoginPage> {
//   TextStyle style = TextStyle(fontFamily: 'Montserrat', fontSize: 20.0);

//   @override
//   Widget build(BuildContext context) {
//     final emailfield = TextField(
//       obscureText: false,
//       style: style,
//       decoration: InputDecoration(
//           contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
//           hintText: "Email",
//           border:
//               OutlineInputBorder(borderRadius: BorderRadius.circular(32.0))),
//     );

//     final passwordfield = TextField(
//       obscureText: true,
//       style: style,
//       decoration: InputDecoration(
//           contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
//           hintText: "Senha",
//           border:
//               OutlineInputBorder(borderRadius: BorderRadius.circular(32.0))),
//     );

//     final buttonLogin = ButtonTheme(
//       minWidth: MediaQuery.of(context).size.width,
//       padding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
//       child: RaisedButton(
//           color: Colors.blue,
//           child: Text(
//             "Entrar",
//             textAlign: TextAlign.center,
//             style: style.copyWith(
//               color: Colors.white,
//               fontWeight: FontWeight.bold,
//             ),
//           ),
//           onPressed: () {},
//           shape: RoundedRectangleBorder(
//               borderRadius: BorderRadius.circular(30.0))),
//     );

//     return Scaffold(
//         body: Center(
//       child: SingleChildScrollView(
//         child: Container(
//           color: Colors.white,
//           padding: const EdgeInsets.all(40.0),
//           child: Column(
//             children: <Widget>[
//               SizedBox(
//                 height: 150.0,
//                 child: Image.asset(
//                   "images/login.png",
//                   fit: BoxFit.contain,
//                 ),
//               ),
//               SizedBox(
//                 height: 40.0,
//               ),
//               emailfield,
//               SizedBox(
//                 height: 20.0,
//               ),
//               passwordfield,
//               SizedBox(
//                 height: 30.0,
//               ),
//               buttonLogin,
//             ],
//           ),
//         ),
//       ),
//     ));
//   }
// }
