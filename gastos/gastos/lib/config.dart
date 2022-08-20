library config.globals;

import 'package:flutter/material.dart';
import 'package:gastos/database/gastos.dart';
import 'package:gastos/widgets/mitema.dart';

import 'database/semana.dart';

ThemeData temaPersonal = ThemeData(
  primarySwatch: Colors.purple,
  textTheme: const TextTheme(
      headline1: TextStyle(fontSize: 11),
      bodyText1: TextStyle(fontStyle: FontStyle.italic)),
);
/*
List<Gastos> losgastos = [
  Gastos(concepto: "Papos kuchao", cantidad: 1000, fecha: DateTime.now()),
  Gastos(concepto: "Pañales 12 pz", cantidad: 65, fecha: DateTime.now()),
  Gastos(concepto: "Formula Nan", cantidad: 590, fecha: DateTime.now()),
];
*/

//Lista de los gastos habidos
List<Gastos> losgastos = [];

//Lista de los dias de la semana y el monto para cada una de ellas
List<Semana> semana = [
  Semana(dia: "L", monto: 50),
  Semana(dia: "M", monto: 60),
  Semana(dia: "Mi", monto: 80),
  Semana(dia: "J", monto: 120),
  Semana(dia: "V", monto: 90),
];

MiTema themach = MiTema();
