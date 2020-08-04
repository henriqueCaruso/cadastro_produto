import 'package:flutter/material.dart';

import 'pages/cadastro_produtos.dart';
import 'pages/home_page.dart';
import 'pages/lista_produtos.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      //themeMode: ThemeMode.dark,
      darkTheme: ThemeData.dark(),
      theme: ThemeData.light(),
      debugShowCheckedModeBanner: false,
      initialRoute: HomePage.routeName,
      routes: {
        HomePage.routeName: (ctx) => HomePage(),
        CadastroProduto.routeName: (ctx) => CadastroProduto(),
        ListaProduto.routeName: (ctx) => ListaProduto(),
      },
    );
  }
}
