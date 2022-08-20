import 'package:flutter/material.dart';
import 'package:gastos/config.dart';
import 'package:intl/intl.dart';

class Bitacora extends StatefulWidget {
  Bitacora({Key? key}) : super(key: key);

  @override
  State<Bitacora> createState() => _BitacoraState();
}

class _BitacoraState extends State<Bitacora> {
  @override
  Widget build(BuildContext context) {
    return losgastos.isEmpty
        ? cargarImagen()
        : ListView.builder(
            itemCount: losgastos.length,
            itemBuilder: (context, indice) => Card(
                    child: Column(
                  children: <Widget>[
                    ListTile(
                        trailing: Wrap(
                          spacing: 12,
                          children: <Widget>[
                            IconButton(
                                onPressed: () {},
                                icon: const Icon(Icons.delete)),
                            IconButton(
                                onPressed: () {}, icon: const Icon(Icons.edit))
                          ],
                        ),
                        title: Text(losgastos[indice].concepto!),
                        subtitle: Text(DateFormat('dd-MM-yy')
                            .format(losgastos[indice].fecha!)),
                        leading:
                            Text("\$ ${losgastos[indice].cantidad.toString()}"))
                  ],
                )));
  } //end build

  Widget cargarImagen() => Card(
        elevation: 5,
        child: Image.asset("assets/images/waiting.png"),
      );
}
