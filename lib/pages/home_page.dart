import 'package:flutter/material.dart';

import 'cadastro_produtos.dart';
import 'lista_produtos.dart';

class HomePage extends StatefulWidget {
  static String routeName = '/';
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home Page"),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.all(10),
        child: Center(
            child: Text(
          'Bem vindo',
          style: TextStyle(fontSize: 20),
        )),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              child: Text('Menu'),
              decoration: BoxDecoration(color: Theme.of(context).primaryColor),
            ),
            ListTile(
              leading: Icon(Icons.home),
              title: Text('Home'),
              onTap: () => Navigator.of(context).pushNamed(HomePage.routeName),
            ),
            ListTile(
              leading: Icon(Icons.list),
              title: Text('Lista de Produtos'),
              onTap: () =>
                  Navigator.of(context).pushNamed(ListaProduto.routeName),
            ),
            ListTile(
              leading: Icon(Icons.add),
              title: Text('Cadastrar Produto'),
              onTap: () =>
                  Navigator.of(context).pushNamed(CadastroProduto.routeName),
            )
          ],
        ),
      ),
    );
  }
}
