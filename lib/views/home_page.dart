import 'dart:async';

import 'package:audioplayers/audio_cache.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:cai_aqui/views/alert_page.dart';
import 'package:flutter/material.dart';
import 'package:sensors/sensors.dart';

import 'contact_page.dart';

AudioPlayer advancedPlayer = AudioPlayer();
AudioCache audioCache = AudioCache(fixedPlayer: advancedPlayer);

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Object> _accelerometerValues;

  List<StreamSubscription<dynamic>> _streamSubscriptions =
      <StreamSubscription<dynamic>>[];

  @override
  Widget build(BuildContext context) {
    final List<String> accelerometer =
        _accelerometerValues?.map((Object v) => v.toString())?.toList();
    // isPlayning = true;
    // advancedPlayer?.stop();
    // print(accelerometer);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Center(
          child: SizedBox(
            child: Text(
              "Caí Aqui",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w500,
                color: Color(0XFF23af23),
              ),
            ),
          ),
        ),
        leading: Container(
          height: 40,
          width: 40,
          decoration: new BoxDecoration(
            image: new DecorationImage(
              image: AssetImage("assets/profile-icon.png"),
              fit: BoxFit.fitHeight,
            ),
          ),
        ),
        actions: <Widget>[
          Container(
            width: 60,
            child: FlatButton(
              child: Icon(
                Icons.more_vert,
                color: Color(0xFFBABABA),
              ),
              onPressed: () => {
                isPlayning = false,
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ContatosPage(),
                  ),
                ),
              },
            ),
          ),
        ],
      ),
      body: Container(
        color: Color(0xFFF2F3F6),
        padding: const EdgeInsets.all(20.0),
        child: ListView(
          children: <Widget>[
            SizedBox(
              height: 10,
            ),
            SizedBox(
              child: Center(
                child: Text(
                  "Clique em monitorar para começar",
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            SizedBox(
              child: Center(
                child: Text(
                  "O Caí Aqui detecta quedas acidentais e envia um sinal de emergência para os números cadastrados",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                    color: Color(0XFF23af23),
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            SizedBox(
              width: 128,
              height: 128,
              child: Image.asset("assets/logo.png"),
            ),
            SizedBox(
              height: 40,
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
                        "Monitorar",
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
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => AlertPage(),
                      ),
                    );
                    // }
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
                borderRadius: BorderRadius.all(
                  Radius.circular(5),
                ),
                // color: Colors.green,
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  stops: [0.3, 1],
                  colors: [
                    Color(0XFF87cefa),
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
                        "Contatos",
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
                  onPressed: () {
                    isPlayning = false;
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ContatosPage(),
                      ),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    for (StreamSubscription<dynamic> subscription in _streamSubscriptions) {
      subscription.cancel();
    }
  }

  @override
  void initState() {
    super.initState();
    // advancedPlayer?.dispose();
    _streamSubscriptions
        .add(accelerometerEvents.listen((AccelerometerEvent event) {
      setState(() {
        // advancedPlayer?.dispose();
        int now = (new DateTime.now()).millisecondsSinceEpoch;
        now = (now / 1000).round();
        _accelerometerValues = <Object>[
          event.x.toInt(),
          event.y.toInt(),
          event.z.toInt(),
          now
        ];
      });
    }));
  }
}
