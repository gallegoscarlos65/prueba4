import 'package:flutter/material.dart';
import 'package:gastos/config.dart';
import 'package:gastos/widgets/barras.dart';
import 'package:gastos/widgets/barritas.dart';
import 'package:intl/intl.dart';

import 'database/gastos.dart';
import 'database/semana.dart';
import 'widgets/bitacora.dart';

class Run extends StatefulWidget {
  const Run({Key? key}) : super(key: key);

  @override
  State<Run> createState() => _RunState();
}

class _RunState extends State<Run> {
  final TextEditingController cantidadController = TextEditingController();
  final TextEditingController concepController = TextEditingController();


  //TODO Formulario para añadir datos

  void formaDatos() async {
    return await showModalBottomSheet(
        elevation: 5,
        isScrollControlled: true,
        context: context,
        builder: (_) => Container(
              padding: EdgeInsets.only(
                  left: 10,
                  right: 10,
                  top: 10,
                  bottom: 50 + MediaQuery.of(context).viewInsets.bottom),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  TextField(
                    controller: concepController,
                    decoration: InputDecoration(hintText: "Concepto:"),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  TextField(
                    controller: cantidadController,
                    decoration: InputDecoration(hintText: "Cantidad"),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  ElevatedButton(
                      onPressed: _agregarGasto, child: Text("Guardar"))
                ],
              ),
            ));
  }

  void _agregarGasto() {
    Gastos gasto = Gastos(
        concepto: concepController.text,
        cantidad: double.parse(cantidadController.text),
        fecha: DateTime.now());

    setState(() {

      // TODO Intentar losgastos.remove

      losgastos.add(gasto);
      _rellenar();
      semana = _sumaGastosSemana();
    });
    debugPrint(losgastos.toString());
    Navigator.pop(context);
    cantidadController.clear();
    concepController.clear();
  }


  void _rellenar() {
    losgastos = gastosSemana;
    debugPrint(losgastos.toString());
  }

  List<Gastos> get gastosSemana {
    return losgastos
        .where((gasto) =>
            gasto.fecha!.isAfter(DateTime.now().subtract(Duration(days: 5))))
        .toList();
  }

  // TODO AQUI SE EL NUMERO DE TABLAS QUE SE VAN A DIBUJAR DEBE SER 1 MAS DE LO ESPERADO

  List<Semana> _sumaGastosSemana() {
    return List.generate(6, (index) {
      DateTime hoy = DateTime.now().subtract(Duration(days: index));
      double suma = 0;
      List<Gastos> gasto = gastosSemana;

      for (int i = 0; i < gasto.length; i++) {
        if (gasto[i].fecha!.day == hoy.day) {

  // TODO, AQUI SE VAN HACIENDO LA SUMA DE LOS GASTOS POR LO QUE AQUI SALE EL TOTAL        
          suma += gasto[i].cantidad!;
          
        }
      }
      return Semana(
          dia: DateFormat('EEE').format(hoy).substring(0, 1), monto: suma);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: <Widget>[
          IconButton(onPressed: () => formaDatos(), icon: Icon(Icons.add)),
          IconButton(
              onPressed: () => themach.cambiarTema(),
              icon: Icon(Icons.dark_mode))
        ],
        title: const Text("Gastos"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              width: double.infinity,
              child: Barritas(),
            ),
            SizedBox(height: 500, width: double.infinity, child: Bitacora()),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: () => formaDatos(), child: Icon(Icons.add)),
    );
  }
}//end class
