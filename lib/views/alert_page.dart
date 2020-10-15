import 'dart:async';

import 'package:audioplayers/audio_cache.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:cai_aqui/views/home_page.dart';
import 'package:flutter/material.dart';

bool isPlayning = false;

class AlertPage extends StatefulWidget {
  @override
  _OtpTimerState createState() => _OtpTimerState();
}

class _OtpTimerState extends State<AlertPage> {
  final interval = const Duration(seconds: 1);

  final int timerMaxSeconds = 30;

  int currentSeconds = 0;

  String get timerText =>
      '${((timerMaxSeconds - currentSeconds) ~/ 60).toString().padLeft(2, '0')}: ${((timerMaxSeconds - currentSeconds) % 60).toString().padLeft(2, '0')}';

  startTimeout([int milliseconds]) {
    advancedPlayer = AudioPlayer();
    audioCache = AudioCache(fixedPlayer: advancedPlayer);
    var duration = interval;
    Timer.periodic(duration, (timer) {
      setState(() {
        print(timer.tick);
        currentSeconds = timer.tick;
        if (isPlayning == false) {
          _playFile();
          isPlayning = true;
        }
      });

      setState(() {
        if (currentSeconds >= timerMaxSeconds) {
          timer.cancel();
          _stopFile();
          Navigator.pop(context);
          isPlayning = false;
        }
      });
    });
  }

  @override
  void initState() {
    startTimeout();
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    advancedPlayer?.dispose();
    isPlayning = false;
  }

  void _playFile() async {
    advancedPlayer = await audioCache.play('sirene.mp3');
  }

  void _stopFile() {
    advancedPlayer?.stop();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Color(0xFFF2F3F6),
        padding: EdgeInsets.fromLTRB(20.0, 40.0, 20.0, 20.0),
        child: ListView(
          children: <Widget>[
            SizedBox(
              height: 10,
            ),
            SizedBox(
              child: Center(
                child: Text(
                  "Queda Detectada!",
                  style: TextStyle(
                    fontSize: 50,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            SizedBox(
              child: Center(
                child: Text(
                  timerText,
                  style: TextStyle(
                    fontSize: 80,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    backgroundColor: Colors.red,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            SizedBox(
              child: Center(
                child: Text(
                  "Um pedido de ajuda será enviado para os "
                  "números cadastrados, assim que o "
                  "tempo chegar em 00:00. ",
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.w500,
                    color: Color(0XFF23af23),
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              height: 80,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(
                  Radius.circular(5),
                ),
                // color: Colors.green,
                color: Colors.red,
              ),
              child: SizedBox.expand(
                child: FlatButton(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        "Cancelar",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          fontSize: 40,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                  onPressed: () {
                    setState(() {
                      _stopFile();
                      isPlayning = false;
                      Navigator.pop(context);
                    });
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => HomePage(),
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
}

@override
Widget build(BuildContext context) {
  return new WillPopScope(
    child: new Scaffold(
      appBar: new AppBar(
          // title: new Text('Page 2'),
          ),
      body: new Center(
          // child: new Text('PAGE 2'),
          ),
    ),
    onWillPop: () async {
      return false;
    },
  );
}

Future<T> pushPage<T>(BuildContext context, Widget page) {
  return Navigator.of(context)
      .push<T>(MaterialPageRoute(builder: (context) => page));
}
