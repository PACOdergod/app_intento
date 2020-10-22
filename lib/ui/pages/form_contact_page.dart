import 'package:app_intento/controllers/lista_contactos_controller.dart';
import 'package:app_intento/models/person_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

GlobalKey<FormState> formContactoKey = GlobalKey<FormState>();
GlobalKey<ScaffoldState> formPageKey = GlobalKey<ScaffoldState>();

class FormContactPage extends StatefulWidget {
  @override
  _FormContactPageState createState() => _FormContactPageState();
}

class _FormContactPageState extends State<FormContactPage> {
  TextEditingController _nombreController;
  TextEditingController _descripcionController;
  TextEditingController _telefonoController;

  ListaContactosController _controller = ListaContactosController.instacia;
  PersonModel _persona = PersonModel();

  @override
  void initState() {
    super.initState();
    _nombreController = TextEditingController(text: '');
    _descripcionController = TextEditingController(text: '');
    _telefonoController = TextEditingController(text: '');
  }

  bool validateAll() {
    if (formContactoKey.currentState.validate()) {
      return true;
    } else {
      formPageKey.currentState
          .showSnackBar(SnackBar(content: Text('Llene todos los campos')));
      return false;
    }
  }

  String validate(String value, String llave) =>
      value.isEmpty ? 'Escriba su ${llave}' : null;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: formPageKey,
        appBar: AppBar(
          //automaticallyImplyLeading: false,
          centerTitle: true,
          title: Text('Nuevo Contacto'),
        ),
        body: SingleChildScrollView(
          child: Form(
            key: formContactoKey,
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
                    onChanged: (value) => _persona.nombre = value,
                    controller: _nombreController,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    child: TextFormField(
                      inputFormatters: [
                        FilteringTextInputFormatter.allow(RegExp('[A-z]'))
                      ],
                      validator: (value) => validate(value, 'descripcion'),
                      decoration: InputDecoration(
                          border:
                              OutlineInputBorder(borderSide: BorderSide.none),
                          hintText: 'Ej. Compañero de trabajo',
                          prefixIcon: Icon(Icons.message),
                          labelText: 'Descripcion'),
                      controller: _descripcionController,
                      onChanged: (value) => _persona.descripcion = value,
                    ),
                    decoration: BoxDecoration(
                        color: Theme.of(context).primaryColor.withOpacity(0.3),
                        borderRadius: BorderRadius.circular(8.0),
                        border:
                            Border.all(color: Theme.of(context).primaryColor)),
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
                    onChanged: (value) => _persona.telefono = value,
                    controller: _telefonoController,
                  ),
                  SizedBox(
                    height: 32,
                  ),
                  RaisedButton(
                    onPressed: () {
                      if (validateAll()) {
                        _controller.contactos.value =
                            List.from(_controller.contactos.value)
                              ..add(_persona);
                        Navigator.pop(context);
                      }
                    },
                    child: Text(
                      'Agregar contacto',
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
