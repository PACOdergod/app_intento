import 'dart:convert';
import 'package:app_intento/services/shared_preferences_services.dart';
import 'package:flutter/material.dart';

class InformacionUsuarioPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          FutureBuilder(
              future: SharedPreferencesServices.readString(key: 'imagen'),
              builder: (context, resultado) {
                if (resultado.hasData) {
                  return Container(
                      height: 200,
                      width: 200,
                      child: Image.memory(
                        base64Decode(resultado.data),
                        fit: BoxFit.cover,
                      ));
                } else {
                  return Container(
                    height: 200,
                    width: 200,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(100),
                        color: Colors.blue,
                        image: DecorationImage(
                            image: NetworkImage(
                                'https://ar.zoetis.com/_locale-assets/mcm-portal-assets/publishingimages/especie/caninos_perro_img.png'),
                            fit: BoxFit.cover)),
                  );
                }
              }),
          FutureBuilder(
              future:
                  DefaultAssetBundle.of(context).loadString('assets/data.json'),
              builder: (context, resultado) {
                if (resultado.hasData) {
                  final data = jsonDecode(resultado.data);
                  return Column(
                    children: [
                      Text(
                        data["nombre"],
                        style: Theme.of(context).textTheme.headline6,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        data["telefono"],
                        style: Theme.of(context).textTheme.headline6,
                      )
                    ],
                  );
                }
                return Container();
              }),
        ],
      ),
    );
  }
}
