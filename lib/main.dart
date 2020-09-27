// import 'dart:async';

import 'package:cai_aqui/provider/contacts_provider.dart';
import 'package:cai_aqui/routes/app_routes.dart';
import 'package:cai_aqui/views/contact_form_page.dart';
import 'package:cai_aqui/views/splash_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
// import 'package:sensors/sensors.dart';

// import 'snake.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(
            create: (cxt) => ContactsProvider(),
          ),
        ],
        child: MaterialApp(
          title: 'Caí Aqui!',
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            primarySwatch: Colors.deepOrange,
            visualDensity: VisualDensity.adaptivePlatformDensity,
          ),
          routes: {
            AppRoutes.HOME: (_) => Splash(),
            AppRoutes.CONTACT_FORM: (ctx) => ContactForm(),
          },
        ));
  }
}
