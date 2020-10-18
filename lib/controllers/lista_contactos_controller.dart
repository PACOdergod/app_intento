import 'package:app_intento/models/person_model.dart';
import 'package:flutter/material.dart';

class ListaContactosController {
  static List<PersonModel> persons = [persona1, persona2, persona3, persona2];

  static final ListaContactosController instacia = ListaContactosController._();

  ListaContactosController._();

  ValueNotifier<List<PersonModel>> contactos =
      ValueNotifier<List<PersonModel>>(persons);
}
