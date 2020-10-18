import 'package:app_intento/ui/pages/lista_contactos._page.dart';
import 'package:app_intento/ui/widgets/custom_buttons.dart';
import 'package:app_intento/ui/widgets/custom_listtile.dart';
import 'package:flutter/material.dart';
import 'package:app_intento/models/person_model.dart';

GlobalKey<ScaffoldState> homeKey = GlobalKey<ScaffoldState>();

List<Widget> pages = [
  ListaContactosPage(),
  Container(
    color: Colors.blue,
  )
];

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int picker;

  @override
  void initState() {
    super.initState();
    picker = 0;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: homeKey,
        drawer: Drawer(
          child: Column(
            children: [
              DrawerHeader(
                padding: EdgeInsets.zero,
                child: Container(
                  color: Theme.of(context).primaryColor,
                ),
              ),
              ListTile(
                title: Text('inicio'),
                onTap: () {
                  //Esto es para cerrar el drawer
                  //cuando se haya picado un boton
                  Navigator.pop(context);

                  setState(() {
                    picker = 0;
                  });
                },
              ),
              ListTile(
                title: Text('segunda pantalla'),
                onTap: () {
                  Navigator.pop(context);
                  setState(() {
                    picker = 1;
                  });
                },
              )
            ],
          ),
        ),
        floatingActionButton: Builder(builder: (BuildContext context) {
          return FloatingActionButton(
              child: Icon(
                Icons.add,
              ),
              onPressed: () {
                Scaffold.of(context)
                    .showSnackBar(SnackBar(content: Text('soy un snackbar')));
                print('Boton flotante presionado');
              });
        }),
        appBar: AppBar(
          title: Text('material app'),
          actions: [
            //IconButton(icon: Icon(Icons.access_alarm), onPressed: null),
            IconButton(icon: Icon(Icons.account_balance), onPressed: null),
            IconButton(icon: Icon(Icons.ac_unit), onPressed: null)
          ],
        ),
        body: pages[picker]);
  }
}
