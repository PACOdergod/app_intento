import 'package:app_intento/models/person_model.dart';
import 'package:flutter/material.dart';

class DetallesContactoPage extends StatelessWidget {
  DetallesContactoPage();

  @override
  Widget build(BuildContext context) {
    final DetallesContactoPageArguments argumentos =
        ModalRoute.of(context).settings.arguments;
    return Scaffold(
      appBar: AppBar(
        title: Text(argumentos.persona.nombre),
        centerTitle: true,
      ),
      body: Center(
        child: Text(argumentos.contenido),
      ),
    );
  }
}

class DetallesContactoPageArguments {
  final PersonModel persona;
  final String contenido;

  DetallesContactoPageArguments({this.persona, this.contenido = 'Contenido'});
}
