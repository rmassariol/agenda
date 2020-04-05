import 'package:flutter/material.dart';

import 'models/class_pessoas.dart';

List _todosUsuarios;

int valor;

class CadPessoas extends StatelessWidget {
  void _retornarLista() async {
    Pessoas x = new Pessoas();

    _todosUsuarios = await x.listarPessoas();
    for (int i = 0; i < _todosUsuarios.length; i++) {
      //  for (int i = 0; i < 5; i++) {
      Pessoas x2 = Pessoas.jsonParaMap(_todosUsuarios[i]);
      // debugPrint("Pessoa: ${x2.getnmPessoa}, Id: ${x2.getcdPessoa}");
    }

    valor = _todosUsuarios.length;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('CONTATOS'),
      ),
      // Create the SelectionButton widget in the next step.
      body: corpoPagina(),
    );
  }

  Widget corpoPagina() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 40, vertical: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        //  mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          TextField(
            decoration: InputDecoration(
                hintText: 'codigo', border: OutlineInputBorder()),
          ),
          Container(height: 30),
          TextField(
            decoration:
                InputDecoration(hintText: 'nome', border: OutlineInputBorder()),
          ),
          Container(height: 30),
          TextField(
            decoration: InputDecoration(
                hintText: 'telefone', border: OutlineInputBorder()),
          ),
          Container(height: 30),
          RaisedButton(
            onPressed: () {
              _retornarLista();
            },
            color: Colors.amber,
            child: Text("Salvar",
                style: TextStyle(
                    color: Colors.white, fontWeight: FontWeight.bold)),
          ),
        ],
      ),
    );
  }
}
