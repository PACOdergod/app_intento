import 'package:flutter/material.dart';

class PersonModel {
  final IconData iconIzquierda;
  final IconData iconDerecha;
  final String nombre;
  final String descripcion;

  PersonModel(
      {this.iconIzquierda, this.iconDerecha, this.nombre, this.descripcion});
}

PersonModel persona1 = PersonModel(
    nombre: 'paco',
    descripcion: 'programador flutter',
    iconDerecha: Icons.message,
    iconIzquierda: Icons.person);

PersonModel persona2 = PersonModel(
    nombre: 'admin',
    descripcion: 'master of the live',
    iconDerecha: Icons.message,
    iconIzquierda: Icons.person);

PersonModel persona3 = PersonModel(
    nombre: 'noob',
    descripcion: 'noob',
    iconDerecha: Icons.message,
    iconIzquierda: Icons.person);
