import 'dart:convert';

import 'package:agenda/models/class_pessoas.dart';
import 'package:agenda/models/class_pessoas.dart' as prefix0;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'cad_pessoas2.dart';

class ListaPessoas extends StatefulWidget {
  @override
  _ListaPessoasState createState() => _ListaPessoasState();
}

class _ListaPessoasState extends State<ListaPessoas> {
  Pessoas pessoas = Pessoas();

  List contatos = List();

  void initState() {
    super.initState();

    setState(() {
      listaTodosContatos();
    });
  }

  listaTodosContatos() async {
    await pessoas.listarPessoas().then((list) {
      setState(() {
        contatos = list;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Contatos",
              style: TextStyle(
                  color: Colors.white,
                  fontFamily: 'NothingYouCouldDo',
                  fontWeight: FontWeight.bold)),
          backgroundColor: Colors.blue,
          centerTitle: true,
          elevation: 0,
        ),
        body: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  colors: [Colors.blue, Colors.pink],
                  begin: Alignment.topRight,
                  stops: [0.5, 0.5],
                  end: Alignment.bottomLeft)),
          child: ListView.builder(
            padding: EdgeInsets.all(10.00),
            itemCount: contatos.length,
            itemBuilder: (context, index) {
              return _cardContacts(context, index);
            },
          ),
        ));
  }

  Widget _cardContacts(context, index) {
    return GestureDetector(
      onTap: () {
        // detalharContato(pessoa: contatos[index])
        //     print(contatos[index]);
        return Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => CadPessoas2(
                codigo: Pessoas.jsonParaMap(contatos[index]).cdPessoa,
                nome: Pessoas.jsonParaMap(contatos[index]).nmPessoa,
                telefone: Pessoas.jsonParaMap(contatos[index]).nrTelefone),
          ),
        );
      },
      child: Card(
        elevation: 5,
        color: Colors.white,
        child: Padding(
          padding: EdgeInsets.all(10.00),
          child: Row(
            children: <Widget>[
              Container(
                width: 50.00,
                height: 50.00,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                      image: AssetImage(
                          'assets/images/default-profile-picture.jpg')),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Container(
                        transform: Matrix4.translationValues(0.0, -12.0, 0.0),
                        child: Text(
                          //  contatos[index].nm_pessoa,
                          Pessoas.jsonParaMap(contatos[index]).nmPessoa,
                          style: TextStyle(
                              color: Colors.blue,
                              fontFamily: 'Bellerose',
                              fontWeight: FontWeight.bold,
                              fontSize: 20.00),
                        )),
                    Container(
                        transform: Matrix4.translationValues(0.0, -12.0, 0.0),
                        child: Text(
                          Pessoas.jsonParaMap(contatos[index]).nrTelefone,
                          style: TextStyle(
                              color: Colors.pink,
                              fontWeight: FontWeight.bold,
                              fontSize: 15.00),
                        )),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  //  detalharContato({Pessoas pessoa}) async {
  // //   final receivedContact = await Navigator.push(context,
  // //       MaterialPageRoute(builder: (context) => cadContactPage(contact: contact)));

  // //   if (receivedContact != null) {
  // //     if (contact != null) {
  // //       print(receivedContact);
  // //       await contactHelper.updateContact(receivedContact);
  // //     } else {
  // //       await contactHelper.saveContact(receivedContact);
  // //     }
  // //     homePageListOfAllContacts();
  // //   }
  // // }

}
