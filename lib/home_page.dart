import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'lista_page.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  @override
  HomePageState createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  int selectedIndex = 0;

  final widgetOptions = [
    new ListPage(),
    Text('Fotos')
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //cabeçalho da aplicação
      appBar: AppBar(
        title: Text('App Fotos Flutter Edgar'),
      ),

      //corpo da pagina da homepage
      body: Center(child: widgetOptions.elementAt(selectedIndex)),

      //Opção do menu de navegação

      bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
              icon: Icon(Icons.photo_album), title: Text('Galeria de Fotos')),
          BottomNavigationBarItem(
              icon: Icon(Icons.favorite), title: Text('Favoritas'))
        ],

        //indicar opção corrente para navegação
        currentIndex: selectedIndex,
        fixedColor: Colors.blueAccent,
        onTap: cliquei,
      ),
    );
  }

  void cliquei(int index) {
    setState(() {
      selectedIndex = index;
    });
  }
}
