

import 'package:flutter/material.dart';
import 'package:flutter_practica_04/src/datos_recibidos.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  final nombreCtrl = TextEditingController();
  final data = new Data(nombre: '', sexo:  '');
  int _valor = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepOrange[200],
        title: const Text('Práctica 03'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: nombreCtrl,
              keyboardType: TextInputType.name,
              decoration: const InputDecoration(
                hintText: 'Ingresa el nombre',
                contentPadding: EdgeInsets.all(20)
              ),
            ),
            const SizedBox(height: 20),
            DropdownButton(
              value: _valor,
              items: const [
                DropdownMenuItem(
                  value: 1,
                  child: Text('Mujer'),
                ),
                DropdownMenuItem(
                  value: 2,
                  child: Text('Hombre'),
                )
              ],
              onChanged:(selected) {
                setState(() {
                  _valor = selected!;
                });
              },
            ),
            const SizedBox(height:  20),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: Colors.orange[200],
                onPrimary: Colors.white
              ),
              onPressed: (){
                setState(() {
                  data.nombre = nombreCtrl.text;

                  if (_valor == 1) {
                    data.sexo = 'Mujer';
                  } else {
                    data.sexo = 'Hombre';
                  }
                  FocusScope.of(context).unfocus();
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => DatosScreen(data: data),
                    )
                  );
                });
              },
              child: const Text('Enviar')
            )
          ],
        ),
      ),
    );
  }
}

class Data {

  String nombre;
  String sexo;

  Data({
    required this.nombre,
    required this.sexo
  });



}