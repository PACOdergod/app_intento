import 'package:app_intento/controllers/theme_controller.dart';
import 'package:app_intento/ui/pages/form_contact_page.dart';
import 'package:app_intento/ui/pages/home_page.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  ValueNotifier<String> titulo = ValueNotifier<String>('Agregar contacto');
  ThemeController _controller = ThemeController.instacia;

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: () {
          titulo.value = 'Value notifier';

          //_controller.changeTheme(true);
          /*
        Navigator.of(context).push(MaterialPageRoute(builder: (context) {
          return FormContactPage();
        }));*/

          //Navigator.pushNamed(context, 'form_contacto');
        },

        //Diseño del boton:
        child: ValueListenableBuilder(
          valueListenable: titulo,
          builder: (context, value, child) {
            return Container(
              height: 60,
              width: double.infinity,
              decoration: BoxDecoration(
                  border: Border.all(color: Theme.of(context).primaryColor),
                  borderRadius: BorderRadius.circular(20)),
              margin: EdgeInsets.all(5),
              padding: EdgeInsets.all(5),
              child: Center(
                  child: Text(
                value,
                style: TextStyle(
                    color: Theme.of(context).primaryColor, fontSize: 20),
              )),
            );
          },
        ));
  }
}
