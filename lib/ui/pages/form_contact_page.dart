import 'package:flutter/material.dart';

GlobalKey<FormState> formContactoKey = GlobalKey<FormState>();
GlobalKey<ScaffoldState> formPageKey = GlobalKey<ScaffoldState>();

class FormContactPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: formPageKey ,
        appBar: AppBar(
          automaticallyImplyLeading: false,
          centerTitle: true,
          title: Text('Nuevo Contacto'),
        ),
        body: SingleChildScrollView(
          child: Form(
            key: formContactoKey,
            child: Column(
              children: <Widget>[],
            ),
          ),
        ));
  }
}
