

import 'package:flutter/material.dart';
import 'package:flutter_practica_04/src/home_page.dart';

class DatosScreen extends StatelessWidget {

  final Data data;

  const DatosScreen({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Datos recibidos'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Los datos son: '),
            Text('Nombre: ${data.nombre}'),
            Text('Sexo: ${data.sexo}')
          ],
        )
      ),
    );
  }
}