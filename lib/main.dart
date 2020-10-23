import 'package:app_intento/controllers/theme_controller.dart';
import 'package:app_intento/ui/pages/detalles_contacto_page.dart';
import 'package:app_intento/ui/pages/form_contact_page.dart';
import 'package:app_intento/ui/pages/home_page.dart';
import 'package:app_intento/ui/pages/form_usuario_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

ThemeController _controller = ThemeController.instacia;

class _MyAppState extends State<MyApp> {
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
        valueListenable: _controller.isDark,
        builder: (context, value, child) {
          return MaterialApp(
            routes: {
              'detalle_contacto': (context) => DetallesContactoPage(),
              'form_contacto': (context) => FormContactPage(),
              'form_usuario': (context) => FormUsuarioPage()
            },
            title: 'flutter demo',
            theme: ThemeData(
                //iconTheme: IconThemeData(color: Colors.deepPurpleAccent),
                brightness: value ? Brightness.dark : Brightness.light,
                primarySwatch: Colors.green,
                visualDensity: VisualDensity.adaptivePlatformDensity),
            home: HomePage(),
          );
        });
  }
}
