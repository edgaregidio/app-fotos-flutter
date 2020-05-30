import 'dart:convert';

import 'package:flutter/material.dart';

class ListPage extends StatefulWidget {
  ListPage({Key key}) : super(key: key);

  @override
  ListPageState createState() => ListPageState();
}

class ListPageState extends State<ListPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: new Container(
          child: new Center(
        //Recurso para consumir um dado de forma assincrona
        //Teste recurso pode ser local ou remoto
        //vamos buscar um arquivo json
        child: new FutureBuilder(
            future:
                DefaultAssetBundle.of(context).loadString('assets/photos.json'),
            builder: (context, snapshot) {
              //Leu o arquivo json e está atribuindo todos os dados para a variável bebidas
              var fotosJson = json.decode(snapshot.data.toString());

              return new ListView.builder(
                itemBuilder: (BuildContext context, int index) {
                  var foto = fotosJson[index];
                  return new Card(
                    child: new Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: <Widget>[
                        new Text("Title: " + foto['title'],
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 23)),
                        new Image.network(foto['thumbnailUrl'], height: 200)
                      ],
                    ),
                  );
                },
                itemCount: fotosJson == null ? 0 : fotosJson.length,
              );
            }),
      )),
    );
  }
}
