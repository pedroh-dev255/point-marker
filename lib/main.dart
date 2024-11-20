import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:intl/intl.dart';

void main() async {
  await Hive.initFlutter();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Controle de Ponto',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: TelaInicial(),
    );
  }
}

class TelaInicial extends StatelessWidget {
  final TextEditingController _horarioController = TextEditingController();

  TelaInicial() {
    // Preenche o horário com o horário atual
    _horarioController.text = DateFormat('HH:mm').format(DateTime.now());
  }

  void _registrarHorario() {
    // Lógica para salvar o horário no banco de dados
    print("Horário registrado: ${_horarioController.text}");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Registrar Ponto')),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(
              width: 150, // Define a largura do input
              child: TextField(
                controller: _horarioController,
                keyboardType: TextInputType.datetime, // Abre o teclado numérico
                decoration: InputDecoration(
                  labelText: 'Horário',
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: _registrarHorario,
              child: Text('Registrar Ponto', style: TextStyle(fontSize: 18)),
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.symmetric(horizontal: 40, vertical: 20),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
