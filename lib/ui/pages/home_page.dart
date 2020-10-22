import 'package:app_intento/ui/pages/lista_contactos._page.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'informacion_usuario_page.dart';

GlobalKey<ScaffoldState> homeKey = GlobalKey<ScaffoldState>();

List<Widget> pages = [
  ListaContactosPage(),
  InformacionUsuarioPage(),
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
                leading: Icon(MdiIcons.homeCircle),
                title: Text('Inicio'),
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
                leading: Icon(MdiIcons.accountBox),
                title: Text('Usuario'),
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
            picker == 1
                ? IconButton(
                    icon: Icon(Icons.account_balance),
                    onPressed: () {
                      print('se preciono el boton');
                      print('se inicio la descarga');
                      Future.delayed(Duration(seconds: 2), () {
                        print('se descargo la imagen');
                      });
                    })
                : SizedBox(),
            //IconButton(icon: Icon(Icons.ac_unit), onPressed: null)
          ],
        ),
        body: pages[picker]);
  }
}
