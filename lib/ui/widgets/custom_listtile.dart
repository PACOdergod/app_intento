import 'package:app_intento/models/person_model.dart';
import 'package:app_intento/ui/pages/detalles_contacto_page.dart';
import 'package:flutter/material.dart';

class CustomListTile extends StatelessWidget {
  final PersonModel _persona;
  CustomListTile(this._persona);

  @override
  Widget build(BuildContext context) {
    return ListTile(
        onTap: () {
          //Navigator.push(context, MaterialPageRoute(builder: (context) {}));
          /*
          Navigator.of(context).push(MaterialPageRoute(builder: (context) {
            return DetallesContactoPage(
              persona: _persona,
              contenido: _persona.nombre.contains('paco') ? 'Hola PACO' : '',
            );
          }));*/
          Navigator.pushNamed(context, 'detalle_contacto',
              arguments: DetallesContactoPageArguments(
                  persona: _persona, contenido: 'contenido'));
        },
        leading: CircleAvatar(
          child: Text(_persona.nombre[0].toUpperCase()),
        ),
        trailing: SizedBox(
          width: 60,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Icon(_persona.iconDerecha),
              SizedBox(width: 5),
              Icon(Icons.accessible_forward)
            ],
          ),
        ),
        title: Text(_persona.nombre),
        subtitle: Text(_persona.descripcion));
  }
}
