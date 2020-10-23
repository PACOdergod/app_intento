import 'dart:convert';
import 'dart:io';
import 'package:app_intento/services/file_services.dart';
import 'package:app_intento/services/shared_preferences_services.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';

GlobalKey<FormState> formUsuarioKey = GlobalKey<FormState>();
GlobalKey<ScaffoldState> pageUsuarioKey = GlobalKey<ScaffoldState>();

class FormUsuarioPage extends StatefulWidget {
  @override
  _FormUsuarioPageState createState() => _FormUsuarioPageState();
}

class _FormUsuarioPageState extends State<FormUsuarioPage> {
  TextEditingController _nombreController;
  TextEditingController _descripcionController;
  TextEditingController _telefonoController;

  String path;

  @override
  void initState() {
    super.initState();
    _nombreController = TextEditingController(text: '');
    _descripcionController = TextEditingController(text: '');
    _telefonoController = TextEditingController(text: '');
    path = '';
  }

  bool validateAll() {
    if (formUsuarioKey.currentState.validate()) {
      return true;
    } else {
      pageUsuarioKey.currentState
          .showSnackBar(SnackBar(content: Text('Llene todos los campos')));
      return false;
    }
  }

  String validate(String value, String llave) =>
      value.isEmpty ? 'Escriba su ${llave}' : null;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: pageUsuarioKey,
        appBar: AppBar(
          //automaticallyImplyLeading: false,
          centerTitle: true,
          title: Text('Mi usuario'),
        ),
        body: SingleChildScrollView(
          child: Form(
            key: formUsuarioKey,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: <Widget>[
                  TextFormField(
                    inputFormatters: [
                      FilteringTextInputFormatter.allow(RegExp('[A-z]'))
                    ],
                    validator: (value) => validate(value, 'nombre'),
                    decoration: InputDecoration(
                        hintText: 'Ej. Francisco Alberto',
                        prefixIcon: Icon(Icons.person),
                        labelText: 'Nombre',
                        border: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: Theme.of(context).primaryColor))),
                    onChanged: (value) => () {},
                    controller: _nombreController,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    //Aqui elijo el tipo de teclado que se deplegara
                    keyboardType: TextInputType.number,
                    //Esto me permite poner expreciones regulares
                    inputFormatters: [
                      FilteringTextInputFormatter.allow(RegExp('[0-9]'))
                    ],
                    validator: (value) => validate(value, 'telefono'),
                    decoration: InputDecoration(
                        hintText: 'Ej. 64646464',
                        prefixIcon: Icon(Icons.call),
                        labelText: 'Telefono'),
                    onChanged: (value) => () {},
                    controller: _telefonoController,
                  ),
                  SizedBox(
                    height: 32,
                  ),
                  path == ''
                      ? SizedBox()
                      : Container(
                          child: Image.file(File(path)),
                        ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      OutlineButton(
                        onPressed: () async {
                          String image =
                              await FileService.getImage(camera: true);
                          setState(() {
                            path = image;
                          });
                        },
                        child: Text('abrir camara'),
                      ),
                      OutlineButton(
                        onPressed: () async {
                          String image =
                              await FileService.getImage(camera: false);
                          setState(() {
                            path = image;
                          });
                        },
                        child: Text('abrir galeria'),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  RaisedButton(
                    onPressed: () {
                      File file = File(path);

                      String imageConvert =
                          base64Encode(file.readAsBytesSync());

                      SharedPreferencesServices.writeString(
                          key: 'nombre', value: _nombreController.text);
                      SharedPreferencesServices.writeString(
                          key: 'telefono', value: _telefonoController.text);
                      SharedPreferencesServices.writeString(
                          key: 'imagen', value: imageConvert);

                      print('se guardo las preferencias');
                    },
                    child: Text(
                      'Actualizar usuario',
                      style: TextStyle(color: Colors.white),
                    ),
                    color: Theme.of(context).primaryColor,
                  )
                ],
              ),
            ),
          ),
        ));
  }
}
