import 'package:agenda/cad_pessoas.dart';
import 'package:agenda/listaPessoas.dart';
import 'package:agenda/models/class_pessoas.dart';
import 'package:agenda/ui/bd.dart';
import 'package:agenda/cad_pessoas2.dart';
import 'package:flutter/material.dart';

void main() async {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: Home(),
  ));
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('AGENDA'),
        backgroundColor: Colors.amber,
      ),
      // Create the SelectionButton widget in the next step.
      body: Column(
        children: <Widget>[
          RaisedButton(
            onPressed: () {
              //  return Navigator.push(
              //   context, MaterialPageRoute(builder: (context) => CadPessoas()));
              return Navigator.push(context,
                  MaterialPageRoute(builder: (context) => ListaPessoas()));
            },
            child: Text("clique para ir a lista"),
          ),
          RaisedButton(
            onPressed: () {
              //  return Navigator.push(
              //   context, MaterialPageRoute(builder: (context) => CadPessoas()));
              return Navigator.push(context,
                  MaterialPageRoute(builder: (context) => CadPessoas2()));
            },
            child: Text("clique para ir a Cadastro"),
          ),
        ],
      ),
    );
  }
}
