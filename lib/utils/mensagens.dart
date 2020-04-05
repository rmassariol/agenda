import 'package:flutter/material.dart';

mixin Mensagens {
  mensagemAtualizadoSucesso({BuildContext context}) {
    return AlertDialog(
      title: Text("Alterado com sucesso!"),
      content: Text("akjsdioasdiojasoidioashdih"),
      actions: <Widget>[
        RaisedButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: Text(
            "ok",
            style: TextStyle(color: Colors.white),
          ),
        )
      ],
    );
  }
}
