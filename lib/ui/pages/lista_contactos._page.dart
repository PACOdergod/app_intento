import 'package:app_intento/controllers/lista_contactos_controller.dart';
import 'package:app_intento/models/person_model.dart';
import 'package:app_intento/ui/widgets/custom_buttons.dart';
import 'package:app_intento/ui/widgets/custom_listtile.dart';
import 'package:flutter/material.dart';

class ListaContactosPage extends StatelessWidget {
  ListaContactosController controller = ListaContactosController.instacia;

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
        valueListenable: controller.contactos,
        builder: (context, value, child) {
          return Container(
            child: Column(
              children: [
                //Este es el boton de agregar contacto
                CustomButton(),

                //Este es el list view para la lista de contactos:
                Expanded(
                  child: ListView.builder(
                    itemCount: value.length,
                    scrollDirection: Axis.vertical,
                    itemBuilder: (context, index) {
                      return Dismissible(
                          background: Container(
                            color: Colors.red,
                          ),
                          onDismissed: (direction) => value.remove(index),
                          key: Key(index.toString()),
                          child: CustomListTile(value[index]));
                    },
                  ),
                ),
              ],
            ),
          );
        });
  }
}
