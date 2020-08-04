import 'package:cadastro_produtos/data/mock_data.dart';
import 'package:cadastro_produtos/pages/cadastro_produtos.dart';
import 'package:flutter/material.dart';

class ListaProduto extends StatefulWidget {
  static String routeName = '/lista-produtos';
  @override
  _ListaProdutoState createState() => _ListaProdutoState();
}

class _ListaProdutoState extends State<ListaProduto> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Lista de Produtos"),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.all(10),
        child: GridView.builder(
          itemCount: MockData.produtos.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 15,
            crossAxisSpacing: 15,
          ),
          itemBuilder: (context, index) => GestureDetector(
            child: Container(
              decoration: BoxDecoration(
                border: Border.all(),
                borderRadius: BorderRadius.all(Radius.circular(10)),
                image: DecorationImage(
                  image: FileImage(MockData.produtos[index].imagem),
                  fit: BoxFit.fill,
                ),
              ),
              child: Stack(
                fit: StackFit.expand,
                children: [
                  Positioned(
                    child: Text(
                      MockData.produtos[index].nome,
                      style: TextStyle(
                        color: Colors.blue,
                        fontSize: 25,
                        shadows: [Shadow(blurRadius: 5)],
                      ),
                    ),
                    bottom: 10,
                    right: 10,
                  ),
                ],
              ),
            ),
            onTap: () {
              Navigator.of(context)
                  .pushNamed(CadastroProduto.routeName, arguments: index);
            },
            onLongPress: () {
              return showDialog(
                context: context,
                builder: (context) {
                  return SimpleDialog(
                    title: Text(
                      '${MockData.produtos[index].nome}',
                    ),
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.fromLTRB(20, 5, 0, 10),
                        child: Text(
                          '${MockData.produtos[index].descricao}',
                          style: TextStyle(),
                        ),
                      ),
                    ],
                  );
                },
              );
            },
          ),
        ),
      ),
    );
  }
}
