import 'dart:io';

import 'package:cadastro_produtos/data/mock_data.dart';
import 'package:cadastro_produtos/models/produto.dart';
import 'package:cadastro_produtos/pages/lista_produtos.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class CadastroProduto extends StatefulWidget {
  static String routeName = '/cadastro-produtos';
  @override
  _CadastroProdutoState createState() => _CadastroProdutoState();
}

class _CadastroProdutoState extends State<CadastroProduto> {
  final _imagePicker = ImagePicker();
  final _form = GlobalKey<FormState>();
  File _imagem;
  Produto produto = Produto();

  TextEditingController _nomeController = TextEditingController();
  TextEditingController _descricaoController = TextEditingController();

  Future<void> _tirarFoto(ImageSource source) async {
    var _pickedFile = await _imagePicker.getImage(
      source: source,
    );

    if (_pickedFile != null) {
      setState(() {
        _imagem = File(_pickedFile.path);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final argumento = ModalRoute.of(context).settings.arguments;

    if (argumento != null) {
      _imagem = MockData.produtos[argumento].imagem;
      _nomeController.text = MockData.produtos[argumento].nome;
      _descricaoController.text = MockData.produtos[argumento].descricao;
    }

    return Scaffold(
      appBar: AppBar(
        title: Text("Cadastro de Produtos"),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.all(10),
        child: SingleChildScrollView(
          child: Column(children: [
            Column(
              children: [
                Container(
                  height: 240,
                  child: _imagem != null
                      ? FadeInImage(
                          placeholder: AssetImage('assets/loading.gif'),
                          image: FileImage(_imagem),
                        )
                      : Image(
                          image: AssetImage('assets/filePlaceholder.png'),
                          height: 200,
                        ),
                ),
                SizedBox(height: 5),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    IconButton(
                      iconSize: 35,
                      onPressed: () => _tirarFoto(
                        ImageSource.gallery,
                      ),
                      icon: Icon(Icons.photo),
                    ),
                    IconButton(
                      iconSize: 35,
                      onPressed: () => _tirarFoto(
                        ImageSource.camera,
                      ),
                      icon: Icon(Icons.camera_enhance),
                    ),
                  ],
                ),
              ],
            ),
            Column(
              children: [
                TextField(
                  decoration: InputDecoration(labelText: 'Nome'),
                  controller: _nomeController,
                ),
                TextField(
                  decoration: InputDecoration(labelText: 'Descrição'),
                  controller: _descricaoController,
                  maxLines: 4,
                  minLines: 3,
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    RaisedButton.icon(
                      padding: EdgeInsets.fromLTRB(20, 5, 20, 5),
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      label: Text(
                        'Cancela',
                        style: TextStyle(fontSize: 30),
                      ),
                      icon: Icon(Icons.cancel),
                    ),
                    SizedBox(width: 10),
                    RaisedButton.icon(
                      padding: EdgeInsets.fromLTRB(20, 5, 20, 5),
                      onPressed: () {
                        if (argumento != null) {
                          MockData.produtos[argumento].nome =
                              _nomeController.text;
                          MockData.produtos[argumento].descricao =
                              _descricaoController.text;
                          MockData.produtos[argumento].imagem = _imagem;
                          Navigator.of(context)
                              .pushReplacementNamed(ListaProduto.routeName);
                        } else {
                          produto.nome = _nomeController.text;
                          produto.descricao = _descricaoController.text;
                          produto.imagem = _imagem;
                          MockData.produtos.add(produto);
                          Navigator.of(context)
                              .pushReplacementNamed(ListaProduto.routeName);
                        }
                      },
                      label: Text(
                        ' Salvar  ',
                        style: TextStyle(fontSize: 30),
                      ),
                      icon: Icon(Icons.save),
                    ),
                  ],
                ),
              ],
            ),
          ]),
        ),
      ),
    );
  }
}
