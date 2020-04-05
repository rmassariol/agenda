import 'package:agenda/models/class_pessoas.dart';
import 'package:agenda/utils/mensagens.dart';
import 'package:flutter/material.dart';

class CadPessoas2 extends StatefulWidget {
  // String login, senha;
  final int codigo;
  final String nome;
  final String telefone;

  CadPessoas2({this.codigo, this.nome, this.telefone});

  @override
  _CadPessoas2State createState() => _CadPessoas2State();
}

class _CadPessoas2State extends State<CadPessoas2> with Mensagens {
  TextEditingController vcCodigo = TextEditingController();
  TextEditingController vcNome = TextEditingController();
  TextEditingController vcTelefone = TextEditingController();

  @override
  void initState() {
    vcCodigo.text =
        widget.codigo.toString() == "null" ? "" : widget.codigo.toString();
    vcNome.text = widget.nome;
    vcTelefone.text = widget.telefone;

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('CONTATOS'),
        backgroundColor: Colors.amber,
      ),
      // Create the SelectionButton widget in the next step.
      body: corpoPagina(),
    );
  }

  Widget corpoPagina() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 40, vertical: 20),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          //  mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            TextField(
              controller: vcCodigo,
              decoration: InputDecoration(
                  hintText: 'codigo', border: OutlineInputBorder()),
            ),
            Container(height: 30),
            TextField(
              controller: vcNome,
              decoration: InputDecoration(
                  hintText: 'nome', border: OutlineInputBorder()),
            ),
            Container(height: 30),
            TextField(
              controller: vcTelefone,
              decoration: InputDecoration(
                  hintText: 'telefone', border: OutlineInputBorder()),
            ),
            Container(height: 30),
            RaisedButton(
              onPressed: () {
                Pessoas x = new Pessoas(
                    nmPessoa: vcNome.text, nrTelefone: vcTelefone.text);
                if (vcCodigo.text != "") {
                  x.cdPessoa = int.tryParse(vcCodigo.text);

                  x.alterarPessoa(x).then((val) {
                    showDialog(
                        context: context,
                        builder: (context) {
                          return mensagemAtualizadoSucesso(context: context);
                        });
                  }).catchError((erro) {
                    print(erro);
                  });
                } else {
                  x.inserirPessoa(x).then((val) {
                    setState(() {
                      vcCodigo.text = val.toString();
                    });
                  }).catchError((erro) {
                    print(erro);
                  });
                }

                //setState(() {
                //   vcCodigo.text = x.inserirPessoa(x).then((val) => val.toString()) as String;

                //  print(x.inserirPessoa.toString());
                // var codigo;
                // codigo = x.inserirPessoa;
                // vcCodigo.text = codigo;

                //   var cd = x.inserirPessoa(x);
                //   print(cd);
                //  vcCodigo.text = cd.toString();

                //    vcCodigo.text =  x.inserirPessoa(x).then(onValue)

                //    });
                //  _retornarLista();
              },
              color: Colors.amber,
              child: Text("Salvar",
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold)),
            ),
          ],
        ),
      ),
    );
  }
}
