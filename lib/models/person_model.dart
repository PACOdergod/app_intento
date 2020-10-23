import 'package:flutter/material.dart';

class PersonModel {
  IconData iconIzquierda;
  IconData iconDerecha;
  String nombre;
  String descripcion;
  String telefono;

  PersonModel(
      {this.iconIzquierda,
      this.iconDerecha,
      this.nombre,
      this.descripcion,
      this.telefono});
}

PersonModel persona1 = PersonModel(
    nombre: 'paco',
    descripcion: 'programador flutter',
    iconDerecha: Icons.message,
    iconIzquierda: Icons.person,
    telefono: '3453');

PersonModel persona2 = PersonModel(
    nombre: 'admin',
    descripcion: 'master of the live',
    iconDerecha: Icons.message,
    iconIzquierda: Icons.person,
    telefono: '4535');

PersonModel persona3 = PersonModel(
    nombre: 'noob',
    descripcion: 'noob',
    iconDerecha: Icons.message,
    iconIzquierda: Icons.person,
    telefono: '4535');
