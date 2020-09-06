import 'package:flutter/material.dart';

class ContatosPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Center(
          child: SizedBox(
            child: Text(
              "Contatos",
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
              onPressed: () => {},
            ),
          ),
        ],
      ),
      body: Container(
        color: Color(0xFFF2F3F6),
        child: ListView(
          children: <Widget>[
            cardItem(),
            cardItem(),
            cardItem(),
            cardItem(),
            cardItem(),
          ],
        ),
      ),
    );
  }
}

Widget cardItem() {
  return Card(
    child: Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        const ListTile(
          leading: CircleAvatar(
            backgroundColor: Color(0XFF23af23),
            backgroundImage: AssetImage(
              "assets/profile-icon.png",
            ),
          ),
          title: Text(
            "SAMU 192",
            style: TextStyle(
              color: Color(0XFF23af23),
            ),
          ),

          // subtitle: Text("Filho"),
          trailing: Icon(Icons.more_vert),
        ),
        Container(
          // child: Image.asset("assets/post-picture-001.png"),
          // widget(
          child: Image.network(
            "https://upload.wikimedia.org/wikipedia/commons/thumb/e/ef/Ambul%C3%A2ncia-urg%C3%AAncia.jpg/1200px-Ambul%C3%A2ncia-urg%C3%AAncia.jpg",
          ),
        ),
        Container(
          padding: EdgeInsets.all(10),
          child: Text(
              "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Maecenas quis ex sem. Praesent elit dui, iaculis at interdum eu, rutrum et mi. "),
        ),
        ButtonBar(
          children: <Widget>[
            FlatButton(
              child: Icon(
                Icons.edit,
                color: Color(0XFF23af23),
              ),
              onPressed: () {},
            ),
            FlatButton(
              child: Icon(
                Icons.remove_circle,
                color: Color(0XFF23af23),
              ),
              onPressed: () {},
            ),
          ],
        ),
      ],
    ),
  );
}
